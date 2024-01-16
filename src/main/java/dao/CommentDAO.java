package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.CommentVO;

public class CommentDAO {

	@Autowired
	SqlSession sqlSession;
	
	//step max치 조회
	public String commetMaxStepSelect(int b_idx) {
		return sqlSession.selectOne("c.maxStepSelect", b_idx);
	}
	
	//댓글 추가
	public int commentInsert(CommentVO commentData) {
		return sqlSession.insert("c.commentInsert", commentData);
	}
	
	//댓글 조회
	public List<CommentVO> commentSelectList(int b_idx) {
		return sqlSession.selectList("c.commentSelectList", b_idx);
	}
	
	//댓글 depth의 max 수치 조회
	public int selectMaxDepth(CommentVO insertData) {
		return sqlSession.selectOne("c.selectMaxDepth", insertData);
	}
	
	//대댓글 등록
	public int commentInCommentInsert(CommentVO insertData) {
		return sqlSession.insert("c.commentInCommentInsert", insertData);
	}
	
	//댓글 수정
	public int commentUpdate(CommentVO updateData) {
		return sqlSession.update("c.commentUpdate", updateData);
	}
	
	//댓글 삭제
	public int commentDelete(int c_idx) {
		return sqlSession.update("c.commentDelete",c_idx);
	}
	
	//댓글 1개 조회
	public CommentVO commentSelectOne(int c_idx) {
		return sqlSession.selectOne("c.commentSelectOne",c_idx);
	}
}
