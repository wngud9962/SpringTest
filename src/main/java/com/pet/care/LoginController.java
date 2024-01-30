package com.pet.care;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import dao.UserDAO;
import vo.UserVO;

@Controller
public class LoginController {

	
	public final static String VIEW_PATH = "/WEB-INF/views/login/";
	
	@Autowired
	UserDAO user_dao;
	
	@Autowired
	HttpSession session;
	


	// 로그인창
	@RequestMapping("login_main.do")
	public String login_main() {

		return VIEW_PATH + "login_main.jsp";
	}
	
	// 로그인
	@RequestMapping("login.do")
	@ResponseBody
	public String login(String u_email, String u_pwd) {
		
		// id의 존재여부 검증
		UserVO vo = user_dao.loginCheck(u_email);
		
		// id 없는 경우
		if(vo == null) {
			return "[{'param':'no_id'}]";
		}
		
		// 비밀번호가 일치하지 않는 경우
		if(!vo.getU_pwd().equals(u_pwd)) {
			return "[{'param':'no_pwd'}]";
		}
		
		// id와 비밀번호 체크에 문제가 없다면 세션에 바인딩한다.
		session.setAttribute("id", vo);
		session.setMaxInactiveInterval(60*60*2);
		
		// 로그인에 성공한 경우
		return "[{'param':'clear'}]";
		
	}
	
	// 로그아웃
	@RequestMapping("logout.do")
	public String logout() {
		session.removeAttribute("id");
		
		return "redirect:main_home.do";
	} 
	
	///////////////////////////////////////////////////////////

	// 회원가입
	@RequestMapping("regster_insert.do")
	public String reg_insert() {
		return VIEW_PATH + "reg_insert.jsp";
	}
	
	// 아이디 중복확인
	@RequestMapping("idCheck.do")
	@ResponseBody
	public String id_check(String u_email) {

		int res = user_dao.idCheck(u_email);
		
		if(res == 0) {
			return "[{'res':'yes'}]"; //중복된 아이디 없음
		} else {
			return "[{'res':'no'}]"; // 중복된 아이디 있음
		}
		
	}
	
	// 닉네임 중복확인
	@RequestMapping("nNameCheck.do")
	@ResponseBody
	public String nNameCheck(String u_nickName) {
		
		int res = user_dao.nNameCheck(u_nickName);
		
		if(res == 0) {
			return "[{'res':'yes'}]"; //중복된 닉네임 없음
		} else {
			return "[{'res':'no'}]"; // 중복된 닉네임 있음
		}
		
	}
	
	// 전화번호 중복확인
	@RequestMapping("telCheck.do")
	@ResponseBody
	public String telCheck(String u_tel) {
		int res = user_dao.telCheck(u_tel);
		
		if(res == 0) {
			return "[{'res':'yes'}]"; //중복된 번호 없음
		} else {
			return "[{'res':'no'}]"; // 중복된 전호 있음
		}
		
	}
	
	
	// 유저 추가하기
	@RequestMapping("insert_user.do")
	public String insert_user(UserVO vo) {
		
		int res = user_dao.insert_user(vo);
		
		if(res > 0) {
			return VIEW_PATH+"welcom.jsp";
		} else {
			return VIEW_PATH+"no_welcom.jsp";
		}
	}

///////////////////////////////////////////////////////////////////

	// 아이디 찾기 페이지로
	@RequestMapping("find_id.do")
	public String find_id() {
		return VIEW_PATH + "find_id.jsp";
	}
	
	// 아이디 찾기
	@RequestMapping("select_email.do")
	@ResponseBody
	public String findId(String u_name, String u_tel) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("u_name", u_name);
		map.put("u_tel", u_tel);
		
		UserVO vo = user_dao.select_email(map);
		
		if(vo == null) {
			return "[{'res':'no'}]";
		} 
		
		return "[{'res':'yes'}]";
		
	}

	// 찾은 아이디 확인창
	@RequestMapping("find_id2.do")
	public String find_id2() {
		return VIEW_PATH + "find_idCheck.jsp";
	}

	///////////////////////////////////////////////////////////////////
	
	// 비밀번호 찾기 페이지로
	@RequestMapping("find_pwd.do")
	public String find_pwd() {
		return VIEW_PATH + "find_pwd.jsp";
	}

	// 비밀번호 찾기
	@RequestMapping("select_pwd.do")
	@ResponseBody
	public String findPwd(Model model, String u_name, String u_email) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("u_name", u_name);
		map.put("u_email", u_email);
		
		UserVO vo = user_dao.select_pwd(map);
		
		if(vo == null) { // 비밀번호 X
			return "[{'res':'no'}]";
		}
		return "[{'res':'"+vo.getU_pwd()+"'}]";		
	}
	
	// 비밀번호 확인창
	@RequestMapping("find_pwd2.do")
	public String find_pwd2() {
		return VIEW_PATH + "find_pwdCheck.jsp";
	}
	
	///////////////////////////
	
	// 내정보 조회 (폼으로 이동)
	// 수정필요
	@RequestMapping("updateInfo.do")
	public String updateInfo() {
		
		UserVO vo = (UserVO)session.getAttribute("id");
		int u_idx = vo.getU_idx();
		
		/* session.removeAttribute("id"); */
		
		vo = user_dao.select_info(u_idx);
		session.setAttribute("id", vo);
		
		
		return VIEW_PATH + "updateInfo.jsp";
	}
	
	//내 정보 갱신 반영
	@PostMapping("update_userinfo")
	public String update_userinfo(UserVO uservo){
		UserVO base_user = (UserVO) session.getAttribute("id");
		if(base_user==null) {
			return "WEB-INF/views/login/login_main.jsp";
		}
		
		uservo.setU_idx(base_user.getU_idx());
		
		user_dao.update_userinfo(uservo);
		
		return "redirect:main_home.do";
	}
	
	
	
	// 정보 수정을 위한 비번 확인페이지로
	@RequestMapping("check_up.do")
	public String check_up() {
		return VIEW_PATH + "check_up.jsp";
	}
	
	////////////////////////////////////
	
	// 닉네임 변경 팝업
	@RequestMapping("updateNname.do")
	public String updateNname() {
		return VIEW_PATH + "updateNname.jsp";
	}
	
	// 닉네임 변경
	@RequestMapping("update_Nname.do")
	public String update_Nname(String u_nickName, String nickName) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("u_nickName", u_nickName);
		map.put("nickName", nickName);
		
		int res = user_dao.update_Nname(map);
		
		if(res == 1) {
			return VIEW_PATH+"close.jsp";
		}		
		return null;
	}
	
	/////////////////////////////////////

	// 이름 변경 팝업
	@RequestMapping("updateName.do")
	public String updateName() {
		return VIEW_PATH+"updateName.jsp";
	}

	// 이름 변경
	@RequestMapping("update_name.do")
	public String update_name(String u_name, String u_tel) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("u_name", u_name);
		map.put("u_tel", u_tel);
		
		int res = user_dao.update_name(map);
		
		if(res == 1) {
			return VIEW_PATH+"close.jsp";
		}		
		return null;
	}
	
	///////////////////////////////////////
	
	// 이메일 변겅 팝업
	@RequestMapping("updateEmail.do")
	public String updateEmail() {
		return VIEW_PATH+"updateEmail.jsp";
	}
	
	// 이메일 변경
	@RequestMapping("update_email.do")
	public String update_email(String email, String u_email) {
	HashMap<String, String> map = new HashMap<String, String>();
	
	map.put("email", email);
	map.put("u_email", u_email);
	
	int res = user_dao.update_email(map);
	
	if(res == 1) {
		return VIEW_PATH+"close.jsp";
	}
	
	return null;
	
	}
	
	///////////////////////////////////////
	
	// 비밀번호 변경 팝업
	@RequestMapping("updatePwd.do")
	public String updatePwd() {
		return VIEW_PATH+"updatePwd.jsp";
	}
	
	// 비밀번호 변경
	@RequestMapping("update_pwd.do")
	public String update_pwd(String u_email, String u_pwd) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("u_email", u_email);
		map.put("u_pwd", u_pwd);
		
		int res = user_dao.update_pwd(map);
		
		if(res == 1) {
			return VIEW_PATH+"close.jsp";
		}
		
		return null;
		
		}
	
	//////////////////////////////////////
	
	// 전화번호 변경 팝업
	@RequestMapping("updateTel.do")
	public String updateTel() {
		return VIEW_PATH +"updateTel.jsp";
	}
	
	// 전화번호 변경
	@RequestMapping("update_tel.do")
	public String update_tel(String tel, String u_tel) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("tel", tel);
		map.put("u_tel", u_tel);
		
		int res = user_dao.update_tel(map);
		
		if(res == 1) {
			return VIEW_PATH+"close.jsp";
		}
		
		return null;
		
	}
	
	/////////////////////////////////////////////
	
	// 주소 변경 팝업
	@RequestMapping("updateAddr.do")
	public String updateAddr() {
		return VIEW_PATH +"updateAddr.jsp";
	}
	
	// 주소변경
	@RequestMapping("update_addr.do")
	public String update_addr(String u_email, String u_addr) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("u_email", u_email);
		map.put("u_addr", u_addr);
		
		int res = user_dao.update_addr(map);
		
		if(res == 1) {
			return VIEW_PATH+"close.jsp";
		}
		
		return null;
	}
	
	
	/////////////////////////////////////
	// 탈퇴하기
	@RequestMapping("deleteInfo.do")
	public String deleteInfo() {
		return VIEW_PATH + "delete.jsp";
	}
	
	@RequestMapping("delete_info.do")
	public String delete_info(String u_idx) {
		int res = user_dao.deleteUser(Integer.parseInt(u_idx));
		
		if(res == 1) {
			session.removeAttribute("id");
			return "redirect:main_home.do";
		}
		return null;
	}
}
