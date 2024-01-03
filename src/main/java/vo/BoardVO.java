package vo;

import lombok.Data;

@Data
public class BoardVO {

	int b_idx;
	int u_idx;
	String title;
	String content;
	String filename;
	String regdate;
	int select;
	int follow;
	
	
	//조인
	String u_nickname;
}
