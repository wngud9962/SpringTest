package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class FaqVO {

	private int f_idx, u_idx;
	private String f_title, f_content, f_regdate, f_filename;
	private MultipartFile f_file;
}
