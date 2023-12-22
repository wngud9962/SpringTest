package com.pet.care;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ReviewDAO;
import vo.ReviewVO;

@Controller
public class MainController {
	
	public final static String VIEW_PATH = "/WEB-INF/views/main/";
	
	ReviewDAO review_dao;
	
	public MainController(ReviewDAO review_dao) {
		this.review_dao = review_dao;
		System.out.println("메인 컨트롤러 생성자");
	}
	
	// 메인페이지
	@RequestMapping(value= {"/","main_home.do"}) 
	public String main(Model model) {
		
		List<ReviewVO> list = review_dao.selectReviews();
		
		model.addAttribute("list", list);
		

		return VIEW_PATH+"main_home.jsp";
	}
}
