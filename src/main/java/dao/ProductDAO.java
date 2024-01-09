package dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class ProductDAO {

	@Autowired
	SqlSession sqlSession;
	
	
}
