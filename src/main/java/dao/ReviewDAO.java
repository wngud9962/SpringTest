package dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import vo.PetVO;
import vo.ReviewVO;
import vo.UserVO;

public class ReviewDAO {
	
	SqlSession sqlSession;
	
	public ReviewDAO(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	// 리뷰 목록 불러오기
	public List<ReviewVO> selectReviews(){
		return sqlSession.selectList("review.selectList");
	}
	
	// 리뷰 추가하기
	public int insert(ReviewVO vo) {
		return sqlSession.insert("review.insert", vo);
	}
	
	// 내가 쓴 글
	public List<ReviewVO> selectMyList(int u_idx){
		return sqlSession.selectList("review.selectM", u_idx);
	}
	
	// 리뷰 삭제
	public int delReviw(int r_idx) {
		return sqlSession.delete("review.delReviw", r_idx);
	}
	
	// 한건 조회
	public ReviewVO selectOne(int r_idx) {
		return sqlSession.selectOne("review.selectOne", r_idx);
	}
	
	// 수정
	public int update(ReviewVO vo) {
		return sqlSession.update("review.update", vo);
	}
	
	//  리뷰 리스트 개수 조회
		public int userReviewListCount(UserVO vo) {
			return sqlSession.selectOne("review.reviewInfo_List", vo);
		}
	
	// 로그인 유저 펫 리스트 데이터 조회
   //	nowpage = 현재페이지인덱스    onepageview= 한페이지당 띄울 상품개수 user_idx= 유저인덱스
	public List<ReviewVO> loginUserReviewList(int page, int onePageDataCount){

		int minPage = onePageDataCount *(page -1)+1;
		int maxPage = page*onePageDataCount;
		
		HashMap<String, Integer> realData = new HashMap<String, Integer>();
		realData.put("minPage", minPage);
		realData.put("maxPage", maxPage);
		return sqlSession.selectList("review.reviewInfo_ListCheck",realData);
	}
	
	public int TotalListCount() {
		return sqlSession.selectOne("review.totalListCount");
	}

	public List<ReviewVO> selectList(int intnowpage, int page_product_quantity) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
