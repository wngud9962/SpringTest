package com.pet.care;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.QnaDAO;
import vo.QnaVO;
import vo.UserVO;

@Controller
public class QnAController {

	QnaDAO qna_dao;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	public final static String VIEW_PATH = "/WEB-INF/views/qna/";

	public QnAController(QnaDAO qna_dao) {
		this.qna_dao = qna_dao;
		System.out.println("qnaController 생성자");
	}

	@RequestMapping("qna_form.do")
	public String qna_form() {

		UserVO userVO = (UserVO) session.getAttribute("id");
		if (userVO == null || userVO.getU_type() == 0) {
			return "redirect:qna_main.do";
		}

		return VIEW_PATH + "qna_form.jsp";
	}

	@RequestMapping("qna_main.do")
	public String qna_main(Model model) {
		List<QnaVO> list = qna_dao.qna_selectList();
		int size = list.size();
		model.addAttribute("size", size);
		model.addAttribute("list", list);
		return VIEW_PATH + "qna_main.jsp";
	}

	// 게시물 한건 조회 (상세보기)
	@RequestMapping("qna_view.do")
	public String qna_view(Model model, int q_idx) {
		QnaVO qnaVO = qna_dao.selectOne(q_idx);

		model.addAttribute("qnaVO", qnaVO);
		return VIEW_PATH + "qna_view.jsp";
	}

	// 게시글 삭제하기
	@RequestMapping("qna_del.do")
	@ResponseBody
	// view의 var url=qna_del.do의 DB를 갔다오기 위한 경유지
	// 그 화면을 유지하기 위해서 사용
	public String qna_del(int q_idx) {
		int result = qna_dao.qna_del(q_idx);

		if (result == 1) {
			return "[{'result':'yes'}]";
			// return "redirect:qna_view.do?u_idx="+u_idx; 차이점?
		} else {
			return "[{'result':'no'}]";
		}
	}

	// 게시글 수정폼
	@RequestMapping("qna_edit_form.do")
	public String qna_edit_form(Model model, int q_idx) {

		QnaVO qnaVO = qna_dao.qna_edit_form(q_idx);
		model.addAttribute("qnaVO", qnaVO);
		return VIEW_PATH + "qna_edit_form.jsp";
	}

	// 게시글 등록
	@RequestMapping("qna_insert.do")
	public String qna_insert(QnaVO vo) {

		UserVO userVO = (UserVO) session.getAttribute("id");
		int u_idx = userVO.getU_idx();
		vo.setU_idx(u_idx);

		String webPath = "/resources/upload/qna";
		String savePath = request.getServletContext().getRealPath(webPath);
		System.out.println(savePath);

		MultipartFile file = vo.getQ_file();

		String filename = "no_file";

		// file
		if (!file.isEmpty() && (file != null)) {
			filename = file.getOriginalFilename();

			File saveFile = new File(savePath, filename);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				System.out.println("파일저장 안된거같어");
			}
		}

		vo.setQ_filename(filename);

		int res = qna_dao.qna_insert(vo);

		if (res > 0) {
			return "redirect:qna_main.do";
		} else {
			return null;
		}
	}

	// 게시글 수정완료
	@RequestMapping("qna_update.do")
	public String qna_update(QnaVO qnaVO) {

		UserVO userVO = (UserVO) session.getAttribute("id");
		int u_idx = userVO.getU_idx();
		qnaVO.setU_idx(u_idx);

		String webPath = "/resources/upload/qna";
		String savePath = request.getServletContext().getRealPath(webPath);
		System.out.println(savePath);

		MultipartFile file = qnaVO.getQ_file();

		String filename = qnaVO.getQ_filename();

		// file
		if (!file.isEmpty() && (file != null)) {
			filename = file.getOriginalFilename();

			File saveFile = new File(savePath, filename);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				System.out.println("파일저장 안된거같어");
			}
		}

		qnaVO.setQ_filename(filename);

		int res = qna_dao.qna_update(qnaVO);

		if (res > 0) {
			return "redirect:qna_main.do";
		} else {
			return null;
		}
	}

	@RequestMapping("qna_search.do")
	public String qna_search(Model model, String searchField, String searchWord) {

		// 검색어가 없을때
		if (searchWord.equals("")) {
			return "redirect:qna_main.do";
		}

		List<QnaVO> list = new ArrayList<>();

		switch (searchField) {
		case "idx":
			int idx;
			try {
				idx = Integer.parseInt(searchWord);
			} catch (Exception e) {
				return VIEW_PATH + "alert_only_number.jsp";
			}

			searchWord = "%" + idx + "%";
			list = qna_dao.selectListIdx(searchWord);

			break;
		case "title":
			searchWord = "%" + searchWord + "%";
			list = qna_dao.selectListTitle(searchWord);
			break;
		case "content":
			searchWord = "%" + searchWord + "%";
			list = qna_dao.selectListContent(searchWord);
			break;
		}

		int size = list.size();
		model.addAttribute("size", size);
		model.addAttribute("list", list);
		return VIEW_PATH + "qna_main.jsp";
	}
}
