package vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CommentVO {

	private int c_idx;
	private int u_idx;
	private String content;
	private int ref;
	private int step;
	private int depth;
	private String regdate;
	private int delinfo;
	
	//join
	private String u_nickname;
	
	//가상 변수
	private int rank;
}
