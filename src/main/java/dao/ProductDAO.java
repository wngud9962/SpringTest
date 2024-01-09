package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.OrdersVO;
import vo.ProductImageVO;
import vo.ProductVO;

public class ProductDAO {

	@Autowired
	SqlSession sqlSession;
	
	public int insert_product(ProductVO productVO) {
		return sqlSession.insert("product.insert_product",productVO);
	}
	
	public int getP_idx() {
		return sqlSession.selectOne("product.getP_idx");
	}
	
	public int insert_product_image(ProductImageVO productImageVO) {
		return sqlSession.insert("product.insert_product_image",productImageVO);
	}
	
	public List<OrdersVO> selectAllProduct(){
		return sqlSession.selectList("product.selectAllProduct");
	}
}
