package com.pet.care;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class InfoController {
	
	public final static String VIEW_PATH = "/WEB-INF/views/info/";
	
	public InfoController() {
		
	}
	
	@RequestMapping("info_main.do")
	public String info_main() {
		return VIEW_PATH + "info_main.jsp";
	}
	
}
