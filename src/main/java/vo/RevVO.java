package vo;

import lombok.Data;

@Data
public class RevVO {
	
	private int rv_idx;
	private int u_idx;
	private String rv_time;
	private String rv_day;
	String year = "";
	String month = "";
	String date = "";
	String value = "";
	
	private String u_name;
	private String u_tel;
	
}
