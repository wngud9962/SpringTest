package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.FaqVO;

public class FaqDAO {

	@Autowired
	SqlSession sqlSession;

	// 게시글 추가
	public int faq_insert(FaqVO faqVO) {
		return sqlSession.insert("f.faq_insert", faqVO);
	}

	// 최근 5개의 글 조회
	public List<FaqVO> faq_fiveDataSelectList() {
		return sqlSession.selectList("f.faq_fiveDataSelectList");
	}

	// 전체 글 조회
	public List<FaqVO> faq_selectList() {
		return sqlSession.selectList("f.faq_selectList");
	}

	// 글번호 search 단어 검색
	public List<FaqVO> selectListIdx(String searchWord) {
		return sqlSession.selectList("f.selectListIdx", searchWord);
	}

	// 제목에 search 단어 검색
	public List<FaqVO> selectListTitle(String searchWord) {
		return sqlSession.selectList("f.selectListTitle", searchWord);
	}

	// 컨텐츠에 search 단어 검색
	public List<FaqVO> selectListContent(String searchWord) {
		return sqlSession.selectList("f.selectListContent", searchWord);
	}

	// 게시글 한건조회 : faq_view에서 selectOne 변경
	public FaqVO selectOne(int f_idx) {
		return sqlSession.selectOne("f.faq_view", f_idx);
	}

	// 게시글 삭제
	public int faq_del(int f_idx) {
		return sqlSession.delete("f.faq_del", f_idx);
	}

	// 게시글 수정할때 조회
	public FaqVO faq_edit_form(int f_idx) {
		return sqlSession.selectOne("f.faq_edit_form", f_idx);
	}

	// 게시글 업데이트(수정)
	public int faq_update(FaqVO faqVO) {
		return sqlSession.update("f.faq_update", faqVO);
	}

}
