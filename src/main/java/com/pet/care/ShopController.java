package com.pet.care;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.ProductDAO;
import util.Uploadmodule;
import vo.ProductImageVO;
import vo.ProductVO;
import vo.UserVO;

@Controller
public class ShopController {
	
	@Autowired
	ProductDAO product_dao;
	
	@Autowired
	HttpServletRequest request;
	
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
		
		UserVO user_base = (UserVO) session.getAttribute("id");
		productVO.setU_idx(user_base.getU_idx());
		System.out.println(productVO);
		int res = product_dao.insert_product(productVO);
		if(res==0) {
			System.out.println("상품 정보db에 넣는중 에러 발생");
			return null;
		}
		
		int p_idx = product_dao.getP_idx();
		//성공 product에 값이 잘 들어갔다면
		//순회하며 productimage insert를 해줄차례
		for(int i=0;i<productVO.getFiles().length;i++) {
			ProductImageVO productImageVO = new ProductImageVO();
			productImageVO.setP_idx(p_idx);
			productImageVO.setFile(productVO.getFiles()[i]);
			
			if(i==0) {
				productImageVO.setPi_type(0);
			}else {
				productImageVO.setPi_type(1);
			}
			
			String webPath ="/resources/upload/product";
			String filename = productImageVO.getFile().getOriginalFilename();
			filename = Uploadmodule.fileupload(webPath,filename,productImageVO.getFile(),request);
			productImageVO.setPi_imagename(filename);
			
			res = product_dao.insert_product_image(productImageVO);
			
			if(res==0) {
				System.out.println("세부이미지정보 db에 insert중 error발생");
			}
		}
		
		return "redirect:insert_product_form";
	}
	
//	@GetMapping("product_list")
//	public String product_list(@ModelAttribute List<OrdersVO> product_list) {
//		product_list = product_dao.selectAllProduct();
//		
//		return VIEW_PATH+"product_list.jsp";
//	}
	
}
