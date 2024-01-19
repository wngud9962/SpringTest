package com.pet.care;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import dao.OrdersDAO;
import vo.OrdersVO;
import vo.UserVO;

@Controller
public class MyInfoController {
	
	@Autowired
	OrdersDAO orders_dao;
	
	@Autowired
	HttpSession session;
	
	public final static String VIEW_PATH = "/WEB-INF/views/myinfo/";
	
	@GetMapping("my_order_list")
	public String my_order_list(Model model) {
		
		UserVO user_base = (UserVO)session.getAttribute("id");
		
		if(user_base==null) {
			return "redirect:login_main";
		}	
		
		int u_idx = user_base.getU_idx();
		
		List<OrdersVO> order_list = orders_dao.selectOrdersByIdx(u_idx);
		
		model.addAttribute("order_list",order_list);
		
		
		return VIEW_PATH+"my_order_list.jsp";
	}
	
}
