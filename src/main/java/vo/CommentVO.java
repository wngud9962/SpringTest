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
}
