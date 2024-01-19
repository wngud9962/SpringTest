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
	public List<BoardVO> nomalSelectList(Map<String, Object> pageData){
		return sqlSession.selectList("b.nomalSelectList",pageData);
	}
	
	//게시물 댓글 개수 조회
	public int boardCommentCount(int b_idx){
		return sqlSession.selectOne("b.boardCommentCount", b_idx);
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
	
	//파일 등록 후 게시글 수정
	public int boardUpdate(BoardVO updateData) {
		return sqlSession.update("b.boardUpdate", updateData);
	}
	
	//파일 등록 없이 게시글 수정
	public int noFileBoardUpdate(BoardVO updateData) {
		return sqlSession.update("b.noFileBoardUpdate", updateData);
	}
	
	//idx 기준으로 전체게시물 개수 조회
	public int idxPagingCount(int b_idx){
		return sqlSession.selectOne("b.idxPagingCount", b_idx);
	}
	
	//제목 기준으로 전체게시물 개수 조회
	public int titlePagingCount(String title){
		return sqlSession.selectOne("b.titlePagingCount", title);
	}
	
	//작성자 기준으로 전체게시물 개수 조회
	public int writterPagingCount(String writter) {
		return sqlSession.selectOne("b.writterPagingCount", writter);
	}
	
	//idx 기준으로 검색했을때 전체게시물 조회
	public List<BoardVO> idxNomalSelectList(Map<String, Object> pageData){
		return sqlSession.selectList("b.idxNomalSelectList", pageData);
	}
	
	//제목 기준으로 검색했을때 전체게시물 조회
	public List<BoardVO> titleNomalSelectList(Map<String, Object> pageData){
		return sqlSession.selectList("b.titleNomalSelectList", pageData);
	}
	//작성자 기준으로 검색했을때 전체게시물 조회
	public List<BoardVO> writterNomalSelectList(Map<String, Object> pageData){
		return sqlSession.selectList("b.writterNomalSelectList", pageData);
	}
	
}
