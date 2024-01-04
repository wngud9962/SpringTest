package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.BoardVO;

public class BoardDAO {

	@Autowired
	SqlSession sqlSession;
	
	//공지 게시글 전체 조회
	public List<BoardVO> noticeSelectList(){
		return sqlSession.selectList("b.noticeSelectList");
	}
	//일반 게시글 전체 조회
	public List<BoardVO> nomalSelectList(){
		return sqlSession.selectList("b.nomalSelectList");
	}
	
	//파일 첨부 게시물 등록
	public int boardInsert(BoardVO boardVO) {
		return sqlSession.insert("b.boardInsert", boardVO);
	}
	
	//파일 null일 때 등록
	public int noFileBoardInsert(BoardVO boardVO) {
		return sqlSession.insert("b.noFileBoardInsert", boardVO);
	}
	
}
