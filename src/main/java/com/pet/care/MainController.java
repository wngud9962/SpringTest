package com.pet.care;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.QnaDAO;
import dao.ReviewDAO;
import vo.QnaVO;
import vo.ReviewVO;

@Controller
public class MainController {
	
	public final static String VIEW_PATH = "/WEB-INF/views/main/";
	
	@Autowired
	ReviewDAO review_dao;
	
	@Autowired
	QnaDAO qnaDAO;
	
	// 메인페이지
	@RequestMapping(value= {"/","main_home.do"}) 
	public String main(Model model) {
		
		List<ReviewVO> list = review_dao.selectReviews();
		List<QnaVO> qnaList = qnaDAO.qna_fiveDataSelectList();
		
		model.addAttribute("list", list);
		model.addAttribute("qnaList",qnaList);

		return VIEW_PATH+"main_home.jsp";
	}
}
