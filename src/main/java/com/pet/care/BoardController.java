package com.pet.care;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import dao.BoardDAO;
import util.Common;
import vo.BoardVO;
import vo.UserVO;

@Controller
public class BoardController {

	@Autowired
	BoardDAO boardDAO;

	@Autowired
	HttpServletRequest request;

	public final static String VIEW_PATH = "/WEB-INF/views/board/";

	@RequestMapping("board_main.do")
	public String boardMain(Model model,String page) {
		
		String mapping = "board_main.do";
		
		//페이지당 보여줄 게시물의 개수
		int perPage = 10;
		
		//일반 게시물 총 개수
		int totalPagingCount = boardDAO.totalPagingCount();
		
		//현재 페이지
		int nowPage = Common.pageParameterCheck(page);
		
		//페이징의 맥스 번호
		int maxPagingIdx = Common.pagingCount(totalPagingCount, perPage);
		
			
		if(maxPagingIdx<nowPage) {
			nowPage = maxPagingIdx;
		}
		
		//보여줄 첫번째 ~ 마지막 게시물의 번호
		Map<String, Integer> pageData = Common.page(nowPage, perPage);
		
		//공지 게시물 데이터
		List<BoardVO> noticeList = boardDAO.noticeSelectList();
		
		//일반 게시물 데이터
		List<BoardVO> nomalList = boardDAO.nomalSelectList(pageData);
		
		//공지 게시물 등록일 날짜 필터링
		for(BoardVO vo : noticeList) {
			vo.setRegdate(vo.getRegdate().split(" ")[0]);
		}
		
		//일반 게시물 등록일 날짜 필터링
		for (BoardVO vo : nomalList) {
			vo.setRegdate(vo.getRegdate().split(" ")[0]);
		}
		
		//데이터 바운딩
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("nomalList", nomalList);
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("maxPagingIdx", maxPagingIdx);
		model.addAttribute("mapping",mapping);
		
		
		return VIEW_PATH + "board_main.jsp";
	}

	@RequestMapping("board_form.do")
	public String boardForm() {
		return VIEW_PATH + "board_insert.jsp";
	}

	@RequestMapping("board_insert.do")
	public RedirectView boardInsert(BoardVO boardVO) {

		int res = 0;
		UserVO loginUser = (UserVO) request.getSession().getAttribute("id");

		int loginIdx = loginUser.getU_idx();

		
		boardVO.setU_idx(loginIdx);

		MultipartFile file = boardVO.getFile();

		String filename = null;

		String webPath = "/resources/boardImg";
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

		if(filename!=null) {
			boardVO.setFilename(filename);	
			res = boardDAO.boardInsert(boardVO);
		}
		
		if(filename==null) {
			res = boardDAO.noFileBoardInsert(boardVO);
		}
			


		if (res > 0) {
			return new RedirectView("board_main.do");
		}

		return null;
	}

}
