package context;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import dao.PetDAO;
import dao.QnaDAO;
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
	public QnaDAO qna_dao() {
		return new QnaDAO();
	}

	@Bean
	public RevDAO rev_dao() {
		return new RevDAO();
	}

	@Bean
	public ReviewDAO review_dao() {
		return new ReviewDAO();
	}

}