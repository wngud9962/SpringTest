package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.PetVO;
import vo.QnaVO;
import vo.RevVO;

public class RevDAO {
SqlSession sqlSession;
	
	public RevDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	//예약리스트
	public List<RevVO> rev_selectList(int u_idx){
		return sqlSession.selectList("r.rev_list", u_idx);
	
	}
	
	public List<String> rev_selectList2(String rv_day){
		return sqlSession.selectList("r.rev_list2", rv_day);
		
	}
	
	// 예약 등록하기
		public int rev_insert(RevVO vo) {
			return sqlSession.insert("r.rev_insert", vo);
		}
		// 예약  삭제
        public int delete(int rv_idx) {
            return sqlSession.delete("r.rev_delete", rv_idx);
        }
}
