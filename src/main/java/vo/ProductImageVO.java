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
	private int index; //index가 0이면 메인사진 아니면 내용사진
}
