package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class BoardVO {

	private int b_idx;
	private int u_idx;
	private int point;
	private String title;
	private String content;
	private String filename;
	private String regdate;
	private int select;
	private int follow;
	private MultipartFile file;
	
	
	
	//조인
	private String u_nickname;
}
