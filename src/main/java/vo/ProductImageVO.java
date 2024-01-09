package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductImageVO {
	private int pi_idx,p_idx,pi_type;
	private String pi_imagename;
	private MultipartFile file;
}
