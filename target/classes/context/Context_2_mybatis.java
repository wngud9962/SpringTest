package context;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;


@Configuration
// Spring이 @Configuration 어노테이션이 붙은 클래스의 Bean을 생성하고
// 생성자 주입이 성립됨
public class Context_2_mybatis {
	
	DataSource ds;
	
	// 생성자 주입
	public Context_2_mybatis(DataSource ds) {
		this.ds = ds;
	}
	
	// Factory객체(SqlSessionFactory 클래스)가 DB에 접근하는 방법을 알고있는 객체
	
	@Bean
	public SqlSessionFactory factoryBean() throws Exception {
		SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
		factoryBean.setDataSource(ds);
		
		// 추가적인 MyBatis 설정
        factoryBean.setConfigLocation(new ClassPathResource("config/mybatis/mybatis-config.xml"));
        
        // SqlSessionFactoryBean 객체 자체를 생성하는 것이 아니라,
        // Factory에서 getObject()메서드를 호출한 결과를 리턴한다.
        // 이 경우 스프링은 어플리케이션 시작 지점에서 SqlSessionFactory를 빌드하고,
        // sqlSessionFactory라는 이름으로 저장한다.
        return factoryBean.getObject();
  
	}
	
	// Mybatis 원래 작동방식
	// factory객체를 가지고 factory.openSession() -> SqlSession객체 생성
	
	// Mybatis 스프링 작동방식
	// 스프링에서는 SqlSessionTemplate클래스가 SqlSession을 구현하고,
	// 다른 코드에서 SqlSession을 대체하는 역할을 한다.
	// SQL을 처리하는 Mybatis메서드를 호출할 때, SqlSessionTemplate은 SqlSession이
	// 현재의 스프링 트랜잭션에서 사용될 수 있도록 보장해준다.
	
	// SqlSessionTemplate은 필요한 시점에서 세션을 닫고, 
	// Commit하거나, Rollback하는 것을 포함한 Session의 LifeCycle을 관리한다.
	
	@Bean
	public SqlSessionTemplate sqlSessionBean() throws Exception {
		return new SqlSessionTemplate(factoryBean());
	}
}
