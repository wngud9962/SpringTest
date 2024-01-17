package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
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
	private int delinfo;
	
	
	
	//조인
	private String u_nickname;
	private String u_type;
	
	//댓글수
	private int commentCount;
}
