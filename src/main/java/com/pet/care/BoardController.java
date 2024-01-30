package com.pet.care;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import dao.BoardDAO;
import dao.CommentDAO;
import dao.UserDAO;
import util.Common;
import util.Uploadmodule;
import vo.BoardVO;
import vo.CommentVO;
import vo.UserVO;

@Controller
public class BoardController {

	@Autowired
	BoardDAO boardDAO;

	@Autowired
	UserDAO userDAO;

	@Autowired
	CommentDAO commentDAO;

	@Autowired
	HttpServletRequest request;
	
	@Autowired
	HttpSession session;

	// 숫자만 허용하는 정규식
	String check = "^[\\d]*$";

	public final static String VIEW_PATH = "/WEB-INF/views/board/";

	// board게시판 default 조회페이지 이동
	@RequestMapping("board_main.do")
	public String boardMain(Model model, String page, String searchType, String searchTypeHead, String searchContent) {

		String mapping = "board_main.do";

		if (searchTypeHead == null) {
			searchTypeHead = "null";
		}

		if (searchTypeHead != null) {
			if ((!searchTypeHead.equals("idx") && !searchTypeHead.equals("title")
					&& !searchTypeHead.equals("writter"))) {
				searchTypeHead = "null";
			}
		}

		if (searchType == null) {
			searchType = "all";
		}

		// 페이지당 보여줄 게시물의 개수
		int perPage = 10;

		// 일반 게시물 총 개수
		int totalPagingCount = 0;

		List<BoardVO> nomalList = null;

		// 검색 안했을 때 개수 검색
		if (searchTypeHead == "null") {
			totalPagingCount = boardDAO.totalPagingCount();
		}

		// 검색 글번호로 검색 개수
		if (searchTypeHead.equals("idx")) {
			totalPagingCount = boardDAO.idxPagingCount(Integer.parseInt(searchContent));
		}

		// 검색 제목으로 검색 개수
		if (searchTypeHead.equals("title")) {
			searchContent = "%" + searchContent + "%";
			totalPagingCount = boardDAO.titlePagingCount(searchContent);
		}

		if (searchTypeHead.equals("writter")) {
			searchContent = "%" + searchContent + "%";
			totalPagingCount = boardDAO.writterPagingCount(searchContent);
		}

		// 현재 페이지
		int nowPage = Common.pageParameterCheck(page);

		// 페이징의 맥스 번호
		int maxPagingIdx = Common.pagingCount(totalPagingCount, perPage);

		if (maxPagingIdx < nowPage) {
			nowPage = maxPagingIdx;
		}

		// 보여줄 첫번째 ~ 마지막 게시물의 번호
		Map<String, Object> pageData = Common.page(nowPage, perPage);

		// 공지 게시물 데이터
		List<BoardVO> noticeList = boardDAO.noticeSelectList();

		// 일반 게시물 데이터
		nomalList = boardDAO.nomalSelectList(pageData);

		if (searchTypeHead.equals("idx")) {
			pageData.put("b_idx", Integer.parseInt(searchContent));
			nomalList = boardDAO.idxNomalSelectList(pageData);
		}

		if (searchTypeHead.equals("title")) {
			pageData.put("title", searchContent);
			searchContent = searchContent.substring(1, searchContent.length() - 1);
			nomalList = boardDAO.titleNomalSelectList(pageData);
		}

		if (searchTypeHead.equals("writter")) {
			pageData.put("writter", searchContent);
			searchContent = searchContent.substring(1, searchContent.length() - 1);
			nomalList = boardDAO.writterNomalSelectList(pageData);
		}

		// 공지 게시물 등록일 날짜 필터링
		for (BoardVO vo : noticeList) {
			vo.setRegdate(vo.getRegdate().split(" ")[0]);
		}

		// 일반 게시물 등록일 날짜 필터링
		for (BoardVO vo : nomalList) {
			vo.setRegdate(vo.getRegdate().split(" ")[0]);
		}

		for (BoardVO noticeData : noticeList) {
			noticeData.setCommentCount(boardDAO.boardCommentCount(noticeData.getB_idx()));
		}

		for (BoardVO nomalData : nomalList) {
			nomalData.setCommentCount(boardDAO.boardCommentCount(nomalData.getB_idx()));
		}

		// 데이터 바운딩
		if (!searchType.equals("nomal")) {
			model.addAttribute("noticeList", noticeList);
		}

		if (!searchType.equals("notice")) {

			model.addAttribute("nomalList", nomalList);
			model.addAttribute("nowPage", nowPage);
			model.addAttribute("maxPagingIdx", maxPagingIdx);
			model.addAttribute("mapping", mapping);
		}
		model.addAttribute("searchTypeHead", searchTypeHead);
		model.addAttribute("searchContent", searchContent);
		model.addAttribute("searchType", searchType);

		return VIEW_PATH + "board_main.jsp";
	}

	// board 게시물 추가 view 이동
	@RequestMapping("board_form.do")
	public String boardForm() {
		if (request.getSession().getAttribute("id") == null) {
			return "redirect:board_main.do";
		}
		return VIEW_PATH + "board_insert.jsp";
	}

	// board 게시물 추가
	@RequestMapping("board_insert.do")
	public RedirectView boardInsert(BoardVO boardVO) {

		int res = 0;
		UserVO loginUser = (UserVO) request.getSession().getAttribute("id");

		int loginIdx = loginUser.getU_idx();

		boardVO.setU_idx(loginIdx);

		MultipartFile file = boardVO.getFile();

		String filename = null;

		String webPath = "/resources/boardUpload";
		String savePath = request.getServletContext().getRealPath(webPath);

		if (file != null && !file.isEmpty()) {
			filename = file.getOriginalFilename();
			File saveFile = new File(savePath, filename);

			if (!saveFile.exists()) {
				saveFile.getParentFile().mkdirs();
			} else {
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				file.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		if (filename != null) {
			boardVO.setFilename(filename);
			res = boardDAO.boardInsert(boardVO);
		}

		if (filename == null) {
			res = boardDAO.noFileBoardInsert(boardVO);
		}

		if (res > 0) {
			return new RedirectView("board_main.do");
		}

		return null;
	}

	// 게시판 상세보기 페이지 이동
	@RequestMapping("board_view.do")
	public String boardView(Model model, String idx, String page, String searchType) {

		int nowPage = 1;

		if (page != null && Pattern.matches(check, page) && !page.isBlank()) {
			nowPage = Integer.parseInt(page);
		}

		if (idx == null) {
			return "redirect:board_main.do";
		}

		idx = idx.trim();

		if (idx.isBlank() || !Pattern.matches(check, idx)) {
			return "redirect:board_main.do";
		}

		int b_idx = Integer.parseInt(idx);

		BoardVO boardData = boardDAO.selectOne(b_idx);

		if (boardData == null) {
			return "redirect:board_main.do";
		}

		boardData.setContent(boardData.getContent().replaceAll("\n", "<br>"));
		boardData.setRegdate(boardData.getRegdate().split(" ")[0]);
		model.addAttribute("boardData", boardData);

		// 조회수 증가
		if (request.getSession().getAttribute("id") != null) {
			boardDAO.boardUpReadHit(b_idx);
			boardData.setSelect(boardData.getSelect() + 1);
		}

		// 댓글관련
		List<CommentVO> commentData = commentDAO.commentSelectList(b_idx);

		// 댓글 불필요한 날짜 데이터 자르기 작업
		for (CommentVO data : commentData) {
			data.setRegdate(data.getRegdate().substring(0, data.getRegdate().length() - 2));
		}

		// 댓글 데이터 바운딩 및 포워딩
		model.addAttribute("commentData", commentData);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("searchType", searchType);

		return VIEW_PATH + "board_view.jsp";
	}

	// 게시글 첨부파일 다운로드
	@RequestMapping("board_download.do")
	public String boardDownload(String filename, String b_idx) {

		String resultView = "redirect:board_main.do";

		int idx = 0;

		if (filename == null || filename.isBlank()) {
			return resultView;
		}

		if (b_idx == null) {
			return resultView;
		}

		b_idx = b_idx.trim();

		if (b_idx.isBlank() || !Pattern.matches(check, b_idx)) {
			return resultView;
		}

		idx = Integer.parseInt(b_idx);

		String webPath = "/resources/boardUpload/";
		String readPath = request.getServletContext().getRealPath(webPath);
		readPath += filename;

		System.out.println(readPath);

		File file = new File(readPath);

		String downloadPath = "D:\\sms\\download";
		BufferedInputStream in = null;
		BufferedOutputStream out = null;
		try {
			in = new BufferedInputStream(new FileInputStream(file));
			out = new BufferedOutputStream(new FileOutputStream(new File(downloadPath)));
			int read = 0;
			while ((read = in.read()) != -1) {
				out.write(read);
			}
			if (in != null) {
				in.close();
			}

			if (out != null) {
				out.close();
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		resultView = "redirect:board_view.do?idx=" + idx;

		return resultView;
	}

	// 게시글 삭제
	@RequestMapping("board_delete.do")
	@ResponseBody
	public String boardDelete(String b_idx) {

		int res = 0;

		String result = "[{'res':'no'}]";

		if (b_idx == null) {
			return result;
		}

		b_idx = b_idx.trim();

		if (b_idx.isBlank() || !Pattern.matches(check, b_idx)) {
			return result;
		}

		int deleteBoardIdx = boardDAO.selectOne(Integer.parseInt(b_idx)).getU_idx();
		UserVO loginUserData = (UserVO) request.getSession().getAttribute("id");

		if (loginUserData.getU_idx() == deleteBoardIdx) {
			res = boardDAO.boardDelete(Integer.parseInt(b_idx));
		}

		if (res > 0) {
			result = "[{'res':'yes'}]";
		}
		return result;
	}

	// 게시글 수정
	@RequestMapping("board_update.do")
	public String boardUpdate(Model model, String b_idx) {

		String resultView = VIEW_PATH + "board_main.jsp";

		if (b_idx == null) {
			return resultView;
		}

		b_idx = b_idx.trim();

		if (b_idx.isBlank() || !Pattern.matches(check, b_idx)) {
			return resultView;
		}

		UserVO loginUserData = (UserVO) request.getSession().getAttribute("id");
		BoardVO updateData = boardDAO.selectOne(Integer.parseInt(b_idx));

		if (loginUserData != null && loginUserData.getU_idx() == updateData.getU_idx()) {

			resultView = VIEW_PATH + "board_update.jsp";

			model.addAttribute("updateData", updateData);

			return resultView;

		}

		return resultView;
	}

	@RequestMapping("board_updateProcess.do")
	public RedirectView boardUpdateProcess(BoardVO updateData) {

		String filename = null;

		filename = updateData.getFile().getOriginalFilename();

		if (filename.isBlank()) {
			boardDAO.noFileBoardUpdate(updateData);
		}

		if (!filename.isBlank()) {
			String webPath = "/resources/boardUpload";
			String realPath = request.getServletContext().getRealPath(webPath);
			System.out.println(realPath);

			filename = Uploadmodule.fileupload(webPath, filename, updateData.getFile(), request);

			updateData.setFilename(filename);

			boardDAO.boardUpdate(updateData);
		}

		return new RedirectView("board_main.do");
	}

	// 댓글 등록
	@RequestMapping("commentInsert.do")
	public RedirectView commentInsert(CommentVO commentData, int b_idx) {

		// 현재 게시물의 가장 큰 step을 담는 변수
		String step = null;

		// 로그인 되어있는지 체크
		UserVO loginUser = (UserVO) request.getSession().getAttribute("id");

		if (loginUser == null) {
			return new RedirectView(request.getHeader("referer"));
		}

		commentData.setU_idx(loginUser.getU_idx());
		commentData.setRef(b_idx);

		step = commentDAO.commetMaxStepSelect(b_idx);

		if (step == null) {
			step = "0";
			commentData.setStep(Integer.parseInt(step));
		} else {
			commentData.setStep((Integer.parseInt(step)) + 1);
		}

		commentDAO.commentInsert(commentData);

		return new RedirectView(request.getHeader("referer"));
	}

	// 대댓글 등록
	@RequestMapping("commentInCommentInsert.do")
	public RedirectView commentInCommentInsert(@RequestParam int commentRef, @RequestParam int commentStep,
			@RequestParam String commentContent) {

		UserVO loginUser = (UserVO) request.getSession().getAttribute("id");
		
		
		

		// 로그인 유무 체크
		if (loginUser == null) {
			return new RedirectView(request.getHeader("referer"));
		}

		CommentVO insertData = new CommentVO();

		insertData.setU_idx(loginUser.getU_idx());
		insertData.setRef(commentRef);
		insertData.setStep(commentStep);
		insertData.setContent(commentContent);

		// 현재 depth 높은 값 가져와야함
		insertData.setDepth((commentDAO.selectMaxDepth(insertData)) + 1);

		System.out.println(insertData);

		commentDAO.commentInCommentInsert(insertData);

		return new RedirectView(request.getHeader("referer"));
	}

	@RequestMapping("commentUpdateProcess.do")
	@ResponseBody
	public String commentUpdateProcess(CommentVO updateData) {

		String result = "[{'res':'no'}]";
		UserVO loginUser = (UserVO) request.getSession().getAttribute("id");

		if (loginUser == null) {
			return result;
		}

		if (loginUser.getU_idx() != updateData.getU_idx()) {
			return result;
		}

		commentDAO.commentUpdate(updateData);

		result = "[{'res':'yes'}]";

		return result;
	}

	// 댓글 삭제
	@RequestMapping("commentDelete.do")
	@ResponseBody
	public String commentDelete(int c_idx) {
		String result = "[{'res':'no'}]";
		int res = 0;
		UserVO loginUserData = (UserVO) request.getSession().getAttribute("id");
		CommentVO deleteCommentData = commentDAO.commentSelectOne(c_idx);

		if (!loginUserData.getU_type().equals("0")) {
			if (loginUserData.getU_idx() != deleteCommentData.getU_idx()) {
				return result;
			}
		}

		res = commentDAO.commentDelete(c_idx);

		if (res > 0) {
			result = "[{'res':'yes'}]";
		}

		return result;
	}

}
