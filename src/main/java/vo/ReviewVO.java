package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReviewVO {
	private int r_idx; // 리뷰 글번호 PK
	private int u_idx; // 유저 번호 FK
	private String r_content; // 리뷰 내용 
	private String r_regdate; // 작성일
	private String r_photo; // 사진
	
	private MultipartFile photo;
	private String u_nickName;

}
