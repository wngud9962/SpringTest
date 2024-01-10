package context;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.BoardDAO;
import dao.CartDAO;
import dao.CommentDAO;
import dao.FaqDAO;
import dao.OrderDetailDAO;
import dao.OrdersDAO;
import dao.PetDAO;
import dao.ProductDAO;
import dao.ProductImageDAO;
import dao.RevDAO;
import dao.ReviewDAO;
import dao.UserDAO;


@Configuration
public class Context_3_dao {

	@Bean
	public UserDAO user_dao() {
		return new UserDAO();
	}

	@Bean
	public PetDAO pet_dao() {
		return new PetDAO();
	}

	@Bean
	public FaqDAO faq_dao() {
		return new FaqDAO();
	}

	@Bean
	public RevDAO rev_dao() {
		return new RevDAO();
	}

	@Bean
	public ReviewDAO review_dao() {
		return new ReviewDAO();
	}
	
	@Bean
	public BoardDAO boardDAO() {
		return new BoardDAO();
	}
	
	@Bean
	public CartDAO cartDAO() {
		return new CartDAO();
	}
	
	@Bean
	public OrderDetailDAO orderDetailDAO() {
		return new OrderDetailDAO();
	}
	
	@Bean
	public OrdersDAO ordersDAO() {
		return new OrdersDAO();
	}
	
	@Bean
	public ProductImageDAO productImageDAO() {
		return new ProductImageDAO();
	}
	
	@Bean
	public ProductDAO productDAO() {
		return new ProductDAO();
	}
	
	@Bean
	public CommentDAO commentDAO() {
		return new CommentDAO();
	}
}