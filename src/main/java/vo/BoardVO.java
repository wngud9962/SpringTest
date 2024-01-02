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
	
	
	//조인
	String u_nickname;
}
