package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.QnaVO;

public class QnaDAO {

	SqlSession sqlSession;

	public QnaDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	//게시글 추가
	public int qna_insert(QnaVO qnaVO) {
		return sqlSession.insert("q.qna_insert", qnaVO);
	}
	
	//전체 글 조회
	public List<QnaVO> qna_selectList(){
		return sqlSession.selectList("q.qna_selectList");
	}
	
	//글번호 search 단어 검색
	public List<QnaVO> selectListIdx(String searchWord){
		return sqlSession.selectList("q.selectListIdx", searchWord);
	}
	
	//제목에 search 단어 검색
	public List<QnaVO> selectListTitle(String searchWord){
		return sqlSession.selectList("q.selectListTitle", searchWord);
	}
	
	//컨텐츠에 search 단어 검색
	public List<QnaVO> selectListContent(String searchWord){
		return sqlSession.selectList("q.selectListContent", searchWord);
	}
	
	//게시글 한건조회 : qna_view에서 selectOne 변경
	public QnaVO selectOne(int q_idx) {
		return sqlSession.selectOne("q.qna_view", q_idx);
	}
	
	//게시글 삭제
	public int qna_del(int q_idx) {
		return sqlSession.delete("q.qna_del", q_idx);
	}
	
	//게시글 수정할때 조회
	public QnaVO qna_edit_form(int q_idx) {
		return sqlSession.selectOne("q.qna_edit_form", q_idx);
	}
	
	//게시글 업데이트(수정)
	public int qna_update(QnaVO qnaVO) {
		return sqlSession.update("q.qna_update", qnaVO);
	}

}
