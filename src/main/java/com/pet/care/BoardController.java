package com.pet.care;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.view.RedirectView;

import dao.BoardDAO;
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
	public String boardMain(Model model) {
		List<BoardVO> noticeList = boardDAO.noticeSelectList();
		List<BoardVO> nomalList = boardDAO.nomalSelectList();
		
		for(BoardVO vo : noticeList) {
			vo.setRegdate(vo.getRegdate().split(" ")[0]);
		}
		
		for (BoardVO vo : nomalList) {
			vo.setRegdate(vo.getRegdate().split(" ")[0]);
		}
		
		model.addAttribute("noticeList", noticeList);
		model.addAttribute("nomalList", nomalList);
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
