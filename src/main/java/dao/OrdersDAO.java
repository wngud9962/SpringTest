package dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

import vo.OrdersVO;

public class OrdersDAO {

	@Autowired
	SqlSession sqlSession;
	
	public List<OrdersVO> selectOrdersByIdx(int u_idx){
		return sqlSession.selectList("o.selectOrdersByIdx",u_idx);
	}
	
}
