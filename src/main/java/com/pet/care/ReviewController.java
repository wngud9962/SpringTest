package com.pet.care;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import dao.ReviewDAO;
import util.ReviewListPaging;
import vo.ReviewVO;

@Controller
public class ReviewController {
	
	public final static String VIEW_PATH = "/WEB-INF/views/review/";
	
	ReviewDAO review_dao;
	
	@Autowired
	HttpServletRequest request;
	
	public ReviewController(ReviewDAO review_dao) {
		this.review_dao = review_dao;
	}
	
	// 리뷰 목록 가기
	@RequestMapping("review_main.do")
	public String review_main(Model model, String page) {
		
//		List<ReviewVO> rlist = review_dao.selectReviews();
		HashMap<String, Object> map = ReviewListPaging.getPaging(5, page, review_dao);
		
		
		model.addAttribute("rlist",map.get("rlist"));
        model.addAttribute("pagingCount", map.get("pagingCount"));
        model.addAttribute("minpage", map.get("minpage"));
        model.addAttribute("nowpage", map.get("nowpage"));
        model.addAttribute("maxpage", map.get("maxpage"));
        model.addAttribute("jumpgingPage", map.get("jumpgingPage"));
		
		
//		model.addAttribute("rlist", rlist);
	
		return VIEW_PATH+"review.jsp";
	}
	
	
	
	// 리뷰 쓰기 페이지
	@RequestMapping("reivewInsert.do")
	public String reivewInsert() {
		return VIEW_PATH+"reivewInsert.jsp";
	}
	
	
	// 리뷰 추가
	@RequestMapping("review_insert.do")
	public String reivewInsert(ReviewVO vo) {
		
		String webPath = "/resources/reviewImg"; // 사진 저장할 주소
		String savePath = request.getServletContext().getRealPath(webPath); // 저장된 주소
		System.out.println(savePath);
		
		MultipartFile photo = vo.getPhoto(); // 사진 객체 담기
		
		System.out.println(photo);
		
		String filename = "no_file"; // 확인용 이름?
		
		if((!photo.isEmpty()) && (photo != null)) { // 파일이 저장됬다면
			filename = photo.getOriginalFilename(); // 파일이름에 실 저장 주소 저장
			
			File saveFile = new File(savePath, filename); // 파일 객체에 담기
			
			if(!saveFile.exists()) { // 파일이 없다면 생성
				saveFile.getParentFile().mkdirs();
			} else {
				long time = System.currentTimeMillis(); // 있다면 이름 중복시 시간 추가하기
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
		
		vo.setR_photo(filename);
	
		int res = review_dao.insert(vo);
		
		
		if(res > 0) {
			return "redirect:review_main.do";
		}
			return null;
	}
	
	//////////////
	// 내가 쓴 글
	@RequestMapping("myReviewList.do")
	public String myReviewList(Model model, int u_idx) {
		
		List<ReviewVO> list = review_dao.selectMyList(u_idx);
		model.addAttribute("list", list);
		
		return VIEW_PATH+"myReviewList.jsp";
	}
	
	// 리뷰 상세보기
	@RequestMapping("view.do")
	public String view(Model model, int r_idx) {
		
		ReviewVO vo = review_dao.selectOne(r_idx);
		
		model.addAttribute("vo", vo);
		
		return VIEW_PATH+"view.jsp";
	}
	
	// 리뷰 삭제하기
	@RequestMapping("delReview.do")
	public String delReview(int r_idx, int u_idx) {
		
		int res = review_dao.delReviw(r_idx);
		
		if(res == 1) {
			return "redirect:myReviewList.do?u_idx="+u_idx;
			
		} else {
			return null;
		}
		
	}
	
	// 리뷰 수정
	@RequestMapping("upReview.do")
	public String upReview(ReviewVO vo) {
		
		String webPath = "/resources/reviewImg"; // 사진 저장할 주소
		String savePath = request.getServletContext().getRealPath(webPath); // 저장된 주소
		System.out.println(savePath);
		
		MultipartFile photo = vo.getPhoto(); // 사진 객체 담기
		
		System.out.println(photo);
		
		String filename = "no_file"; // 확인용 이름?
		
		if((!photo.isEmpty()) && (photo != null)) { // 파일이 저장됬다면
			filename = photo.getOriginalFilename(); // 파일이름에 실 저장 주소 저장
			
			File saveFile = new File(savePath, filename); // 파일 객체에 담기
			
			if(!saveFile.exists()) { // 파일이 없다면 생성
				saveFile.getParentFile().mkdirs();
			} else {
				long time = System.currentTimeMillis(); // 있다면 이름 중복시 시간 추가하기
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
		
		vo.setR_photo(filename);
	
		int res = review_dao.update(vo);
		
		
		if(res == 1) {
			return "redirect:review_main.do";
		}
			return null;
	}
	
}
