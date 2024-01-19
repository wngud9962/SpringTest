package com.pet.care;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import dao.FaqDAO;
import util.Uploadmodule;
import vo.FaqVO;
import vo.UserVO;

@Controller
public class FaqController {

	@Autowired
	FaqDAO faq_dao;

	@Autowired
	HttpSession session;

	@Autowired
	HttpServletRequest request;

	public final static String VIEW_PATH = "/WEB-INF/views/faq/";


	@RequestMapping("faq_form.do")
	public String faq_form() {

		UserVO userVO = (UserVO) session.getAttribute("id");
		if (userVO == null || !userVO.getU_type().equals("0")) {
			return "redirect:faq_main.do";
		}

		return VIEW_PATH + "faq_form.jsp";
	}

	@RequestMapping("faq_main.do")
	public String faq_main(Model model) {
		List<FaqVO> list = faq_dao.faq_selectList();
		int size = list.size();
		model.addAttribute("size", size);
		model.addAttribute("list", list);
		return VIEW_PATH + "faq_main.jsp";
	}

	// 게시물 한건 조회 (상세보기)
	@RequestMapping("faq_view.do")
	public String faq_view(Model model, @RequestParam("f_idx") int f_idx) {
	
		FaqVO faqVO = faq_dao.selectOne(f_idx);

		model.addAttribute("faqVO", faqVO);
		return VIEW_PATH + "faq_view.jsp";
	}

	// 게시글 삭제하기
	@RequestMapping("faq_del.do")
	@ResponseBody
	public String faq_del(int f_idx) {
		int result = faq_dao.faq_del(f_idx);

		if (result == 1) {
			return "[{'result':'yes'}]";
		} else {
			return "[{'result':'no'}]";
		}
	}

	// 게시글 수정폼
	@RequestMapping("faq_edit_form.do")
	public String faq_edit_form(Model model, int f_idx) {

		FaqVO faqVO = faq_dao.faq_edit_form(f_idx);
		model.addAttribute("faqVO", faqVO);
		return VIEW_PATH + "faq_edit_form.jsp";
	}

	// 게시글 등록
	@RequestMapping("faq_insert.do")
	public String faq_insert(FaqVO vo) {

		UserVO userVO = (UserVO) session.getAttribute("id");
		int u_idx = userVO.getU_idx();
		vo.setU_idx(u_idx);

		String webPath = "/resources/upload/faq";

		MultipartFile uploadfile = vo.getF_file();
		
		String filename = "no_file";
		
		filename = Uploadmodule.fileupload(webPath,filename,uploadfile,request);		

		vo.setF_filename(filename);

		int res = faq_dao.faq_insert(vo);

		if (res > 0) {
			return "redirect:faq_main.do";
		} else {
			return null;
		}
	}

	// 게시글 수정완료
	@RequestMapping("faq_update.do")
	public String faq_update(FaqVO faqVO) {

		UserVO userVO = (UserVO) session.getAttribute("id");
		int u_idx = userVO.getU_idx();
		faqVO.setU_idx(u_idx);

		String webPath = "/resources/upload/faq";
		String savePath = request.getServletContext().getRealPath(webPath);
		System.out.println(savePath);

		MultipartFile file = faqVO.getF_file();

		String filename = faqVO.getF_filename();
		
		filename= Uploadmodule.fileupload(webPath, filename, file, request);
		
		faqVO.setF_filename(filename);

		int res = faq_dao.faq_update(faqVO);

		if (res > 0) {
			return "redirect:faq_main.do";
		} else {
			return null;
		}
	}

	@RequestMapping("faq_search.do")
	public String faq_search(Model model, String searchField, String searchWord) {

		// 검색어가 없을때
		if (searchWord.equals("")) {
			return "redirect:faq_main.do";
		}

		List<FaqVO> list = new ArrayList<>();

		switch (searchField) {
		case "idx":
			int idx;
			try {
				idx = Integer.parseInt(searchWord);
			} catch (Exception e) {
				return VIEW_PATH + "alert_only_number.jsp";
			}

			searchWord = "%" + idx + "%";
			list = faq_dao.selectListIdx(searchWord);

			break;
		case "title":
			searchWord = "%" + searchWord + "%";
			list = faq_dao.selectListTitle(searchWord);
			break;
		case "content":
			searchWord = "%" + searchWord + "%";
			list = faq_dao.selectListContent(searchWord);
			break;
		}
		searchWord = searchWord.substring(1, searchWord.length()-1);
		
		int size = list.size();
		model.addAttribute("size", size);
		model.addAttribute("list", list);
		model.addAttribute("searchField", searchField);
		model.addAttribute("searchWord", searchWord);
		return VIEW_PATH + "faq_main.jsp";
	}
}
