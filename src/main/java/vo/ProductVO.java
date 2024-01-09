package vo;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductVO {
	private int p_idx,u_idx,p_stockcount,p_discount;
	private String p_name;
}
