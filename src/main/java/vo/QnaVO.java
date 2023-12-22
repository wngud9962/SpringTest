package vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class QnaVO {

	private int q_idx, u_idx;
	private String q_title, q_content, q_regdate, q_filename;
	private MultipartFile q_file;
}
