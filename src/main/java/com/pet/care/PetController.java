package com.pet.care;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.PetDAO;
import util.PetListPaging;
import vo.PetVO;
import vo.UserVO;

@Controller
public class PetController {

	public final static String VIEW_PATH = "/WEB-INF/views/pet/";

	PetDAO pet_dao;

	@Autowired
	HttpServletRequest request;
	
	public PetController(PetDAO pet_dao) {
		this.pet_dao = pet_dao;
		System.out.println("petController 생성자");
	}

	// 펫 정보 메인 화면 펫 리스트 보임
	@RequestMapping(value = { "petinfo_main.do" })
	public String list(Model model,String page) {
		UserVO userInfo =(UserVO)request.getSession().getAttribute("id");
		HashMap<String, Object> map = PetListPaging.getPaging(5, page, pet_dao,userInfo);
		
		

//		int idx = (((UserVO)request.getSession().getAttribute("id")).getU_idx());
//		List<PetVO> list = pet_dao.selectList(idx);
		
//		List<PetVO> vo =()map.get("list");
		model.addAttribute("list",map.get("list"));
        model.addAttribute("pagingCount", map.get("pagingCount"));
        model.addAttribute("minpage", map.get("minpage"));
        model.addAttribute("nowpage", map.get("nowpage"));
        model.addAttribute("maxpage", map.get("maxpage"));
        model.addAttribute("jumpgingPage", map.get("jumpgingPage"));
//		model.addAttribute("list", list);

		return VIEW_PATH + "petinfo_main.jsp";
		
		
	}

	// 펫 리스트 화면
	@RequestMapping("petinfo_insert.do")
	public String petinfo_main() {
		return VIEW_PATH + "petinfo_insert.jsp";
	}
	
	// 펫 등록하기
	@RequestMapping("pet_insert.do")
	public String pet_insert(PetVO vo) {
		
		String webPath = "/resources/petImg";
		String savePath = request.getServletContext().getRealPath(webPath);
		System.out.println(savePath);
		
		MultipartFile photo = vo.getPhoto();
		
		System.out.println(photo);
		
		String filename = "no_file";
		
		if((!photo.isEmpty()) && (photo != null)) {
			filename = photo.getOriginalFilename();
			
			File saveFile = new File(savePath, filename);
			
			if(!saveFile.exists()) {
				saveFile.getParentFile().mkdirs();
			} else {
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}
			
			try {
				photo.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		vo.setP_photo(filename);
		
		System.out.println(vo.getP_age());
		System.out.println(vo.getP_gender());
		System.out.println(vo.getP_name());
		System.out.println(vo.getP_photo());
		System.out.println(vo.getP_type());
	
		int res = pet_dao.insert(vo);
		
		System.out.println(res);
		
		if(res > 0) {
			return "redirect:petinfo_main.do";
		}
			return null;
	}
	
	// 펫 정보 삭제하기
    @RequestMapping("petinfo_del.do")
    public String delete(int p_idx) {
        System.out.println(p_idx);
        
       int res = pet_dao.delete(p_idx);
       
       if(res == 0) {
    	   System.out.println("실패");
    	   return null;
       }
        return "redirect:petinfo_main.do";

    }
    
    // 펫 정보수정 화면으로 이동
    @RequestMapping("petinfo_updateForm.do")
    public String updateForm(Model model, String p_idx) {
    	System.out.println("p_idx : "+p_idx);
    	int pet_idx = 1;
    	if(p_idx!=null && !p_idx.isEmpty()) {
    		pet_idx = Integer.parseInt(p_idx);
    		PetVO vo = pet_dao.selectOne(pet_idx);
    		model.addAttribute("vo", vo);
    	}
    	
    	return VIEW_PATH+"petinfo_updateForm.jsp";
    }
    
    // 펫 정보수정
    @RequestMapping("petinfo_update.do")
    public String petinfo_update(PetVO vo) {
    	UserVO userVO = (UserVO)request.getSession().getAttribute("id");
    	
    	if(userVO==null) {
    		return "redirect:/";
    	}
    	
    	if(vo.getPhoto() != null) {
    		String webPath = "/resources/petImg";
    		String savePath = request.getServletContext().getRealPath(webPath);
    		System.out.println(savePath);
    		
    		MultipartFile photo = vo.getPhoto();
    		
    		System.out.println(photo);
    		
    		String filename = "no_file";
    		
    		if((!photo.isEmpty()) && (photo != null)) {
    			filename = photo.getOriginalFilename();
    			
    			File saveFile = new File(savePath, filename);
    			
    			if(!saveFile.exists()) {
    				saveFile.getParentFile().mkdirs();
    			} else {
    				long time = System.currentTimeMillis();
    				filename = String.format("%d_%s", time, filename);
    				saveFile = new File(savePath, filename);
    			}
    			
    			try {
    				photo.transferTo(saveFile);
    			} catch (IllegalStateException e) {
    				e.printStackTrace();
    			} catch (IOException e) {
    				e.printStackTrace();
    			}
    		}
    		
    		vo.setP_photo(filename);
    		
    	}
    	System.out.println(vo);
    	
    	int res = pet_dao.update(vo);
    	
    	if(res > 0) {
    		return "redirect:petinfo_main.do";
    	}
    	
    	return null;
    	
    }
    
    
}


	
