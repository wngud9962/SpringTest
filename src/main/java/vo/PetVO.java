package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class PetVO {
	
	private int p_idx;
	private int u_idx;
	private String p_name;
	private String p_type;
	private int p_age;
	private String p_gender;
	private MultipartFile photo;
	private String p_photo;

}
