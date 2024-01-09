package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class ProductVO {
	private int p_idx,u_idx,p_stockcount,p_discount;
	private String p_name;
	private MultipartFile[] files;
	private String[] filenames;
	private String pi_imagename;
}
