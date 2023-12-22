package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.PetVO;
import vo.UserVO;

public class PetDAO {
	
	SqlSession sqlSession;
	
	public PetDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 펫 리스트
	public List<PetVO> selectList(int idx){
		List<PetVO> list = sqlSession.selectList("p.petinfo_list",idx);
			return list;
	}
	
	// 펫 등록하기
	public int insert(PetVO vo) {
		return sqlSession.insert("p.petinfo_insert", vo);
	}
	
	// 펫 정보 삭제
	public int delete(int p_idx) {
		return sqlSession.delete("p.petinfo_delete", p_idx);
	}
	
	// 펫 정보 조회 및 수정화면
	public PetVO selectOne(int p_idx) {
		return sqlSession.selectOne("p.petinfo_check", p_idx);
	}
	
	// 펫 정보 수정
	public int update(PetVO vo) {
		return sqlSession.update("p.petinfo_update", vo);
	}
	
	// 유저 펫 리스트 개수 조회
	public int userPetListCount(UserVO vo) {
		return sqlSession.selectOne("p.petinfo_List",vo);
	}
	
	// 로그인 유저 펫 리스트 데이터 조회
//	nowpage = 현재페이지인덱스    onepageview= 한페이지당 띄울 상품개수 user_idx= 유저인덱스
	public List<PetVO> loginUserPetList(HashMap<String, Integer> pagingData){

		int minPage = pagingData.get("OnepageView") *(pagingData.get("nowpage") -1)+1;
		int maxPage = pagingData.get("nowpage")*pagingData.get("OnepageView");
		
		HashMap<String, Integer> realData = new HashMap<String, Integer>();
		realData.put("user_idx", pagingData.get("user_idx"));
		realData.put("minPage", minPage);
		realData.put("maxPage", maxPage);
		return sqlSession.selectList("p.petinfo_ListCheck",realData);
	}
	
	
	
	
	
	
	

}
