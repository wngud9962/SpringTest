package dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import vo.UserVO;

public class UserDAO {
	
	SqlSession sqlSession;
	
	public UserDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	/////////////////////////////////////////////////////
	// 유저 정보 조회
	public UserVO select_info(int u_idx) {
		return sqlSession.selectOne("u.select_info", u_idx);
	}
	
	// 아이디 존재여부
	public UserVO loginCheck(String u_email) {
		return sqlSession.selectOne("u.loginCheck", u_email);
	}
	
	// 아이디 찾기
	public UserVO select_email(HashMap<String, String> map) {
		return sqlSession.selectOne("u.select_email", map);
	}
	
	// 회원가입 아이디 중복 검사
	public int idCheck(String u_email) {
		return sqlSession.selectOne("u.idCheck", u_email);
	}
	
	// 회원가입 닉네임 중복 검사
	public int nNameCheck(String u_nickName) {
		return sqlSession.selectOne("u.nNameCheck", u_nickName);
	}
	
	// 전화번호 중복 검사
	public int telCheck(String u_tel) {
		return sqlSession.selectOne("u.telCheck", u_tel);
	}
	
	// 유저 추가(회원가입)
	public int insert_user(UserVO vo) {
		return sqlSession.insert("u.insertU", vo);
	}
	
	// 비밀번호 찾기
	public UserVO select_pwd(HashMap<String, String> map) {
		return sqlSession.selectOne("u.select_pwd", map);
	}
	
	// 닉네임 변경
	public int update_Nname(HashMap<String, String> map) {
		return sqlSession.update("u.upNname", map);
	}
	
	// 이름 변경
	public int update_name(HashMap<String, String> map) {
		return sqlSession.update("u.update_name", map);
	}
	
	// 이메일 변경
	public int update_email(HashMap<String, String> map) {
		return sqlSession.update("u.update_email", map);
	}
	
	// 비밀번호 변경
	public int update_pwd(HashMap<String, String> map) {
		return sqlSession.update("u.update_pwd", map);
	}

	// 전화번호 변경
	public int update_tel(HashMap<String, String> map) {
		return sqlSession.update("u.update_tel", map);
	}
	
	// 주소 변경
	public int update_addr(HashMap<String, String> map) {
		return sqlSession.update("u.update_addr", map);
	}
	
	// 유저 삭제하기
	public int deleteUser(String u_idx) {
		return sqlSession.delete("u.delete", u_idx);
	}
}
