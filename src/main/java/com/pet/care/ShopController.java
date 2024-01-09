package com.pet.care;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.ProductDAO;
import vo.ProductVO;
import vo.UserVO;

@Controller
public class ShopController {
	
	@Autowired
	ProductDAO product_dao;
	
	@Autowired
	HttpSession session;
	
	public final static String VIEW_PATH = "/WEB-INF/views/shop/";
	
	@RequestMapping("insert_product_form")
	public String insert_product_form(Model model) {
		UserVO user_base = (UserVO) session.getAttribute("id");
		if(user_base==null) {
			return "redirect:login_main.do";
		}
		
		if(!user_base.getU_type().equals("1")) {
			return VIEW_PATH+"insert_product_form.jsp";
		}
		
		return "redirect:login_main.do";
	}
	
	@PostMapping("product_insert")
	public String product_insert(ProductVO productVO) {
		System.out.println(productVO);
		UserVO user_base = (UserVO) session.getAttribute("id");
		productVO.setU_idx(user_base.getU_idx());
		int res = product_dao.insert_product(productVO);
		if(res>0) {
			int p_idx = product_dao.getP_idx();
			//성공 product에 값이 잘 들어갔다면
			//순회하며 productimage insert를 해줄차례
			for(MultipartFile file : productVO.getFiles()) {
				
			}
			
		}else {
			
		}
		return "redirect:insert_product_form";
	}
	
}
