package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.ProductVO;

public class ProductDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insert_product(ProductVO productVO) {
		return sqlSession.insert("p.insert_product",productVO);
	}
	
	public int getP_idx() {
		return sqlSession.selectOne("p.getP_idx");
	}
}
