package dao;

import java.util.List;
import java.util.Map;

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
	public List<BoardVO> nomalSelectList(Map<String, Integer> pageData){
		return sqlSession.selectList("b.nomalSelectList",pageData);
	}
	
	//파일 첨부 게시물 등록
	public int boardInsert(BoardVO boardVO) {
		return sqlSession.insert("b.boardInsert", boardVO);
	}
	
	//파일 null일 때 등록
	public int noFileBoardInsert(BoardVO boardVO) {
		return sqlSession.insert("b.noFileBoardInsert", boardVO);
	}
	
	//일반 게시물 전체 개수 조회
	public int totalPagingCount() {
		return sqlSession.selectOne("b.totalPagingCount");
	}
	
	//상세 페이지 조회
	public BoardVO selectOne(int b_idx) {
		return sqlSession.selectOne("b.selectOne", b_idx);
	}
	
	//게시글 삭제
	public int boardDelete(int b_idx) {
		return sqlSession.delete("b.boardDelete", b_idx);
	}
	
	//조회수 증가
	public int boardUpReadHit(int b_idx) {
		return sqlSession.update("b.boardUpReadHit", b_idx);
	}
	
}
