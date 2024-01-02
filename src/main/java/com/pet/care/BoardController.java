package com.pet.care;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dao.BoardDAO;
import vo.BoardVO;

@Controller
public class BoardController {

	@Autowired
	BoardDAO boardDAO;
	
	public final static String VIEW_PATH = "/WEB-INF/views/board/";
	
	@RequestMapping("board_main.do")
	public String boardMain(Model model) {
		List<BoardVO> list = boardDAO.selectList();
		for(BoardVO vo : list) {
			vo.setRegdate(vo.getRegdate().split(" ")[0]);	
		}
		model.addAttribute("list", list);
		return VIEW_PATH+"board_main.jsp";
	}
	
	
}
