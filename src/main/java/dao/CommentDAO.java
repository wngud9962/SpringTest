package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.CommentVO;

public class CommentDAO {

	@Autowired
	SqlSession sqlSession;
	
	
	public String commetMaxStepSelect(int b_idx) {
		return sqlSession.selectOne("c.maxStepSelect", b_idx);
	}
	
	//댓글 추가
	public int commentInsert(CommentVO commentData) {
		return sqlSession.insert("c.commentInsert", commentData);
	}
}
