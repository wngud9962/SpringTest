package util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.multipart.MultipartFile;

public class Uploadmodule {
	public static String fileupload(String webPath,String originfilename,MultipartFile file,HttpServletRequest request) {
		
//		String webPath = "/resources/upload/faq";
		String savePath = request.getServletContext().getRealPath(webPath);
		System.out.println(savePath);
		String filename = originfilename;
		
//		MultipartFile file = vo.getF_file();

		// file
		if (!file.isEmpty() && (file != null)) {
			filename = file.getOriginalFilename();

			File saveFile = new File(savePath, filename);
			if (!saveFile.exists()) {
				saveFile.mkdirs();
			} else {
				long time = System.currentTimeMillis();
				filename = String.format("%d_%s", time, filename);
				saveFile = new File(savePath, filename);
			}

			try {
				file.transferTo(saveFile);
			} catch (Exception e) {
				System.out.println("파일저장 실패추정");
			}
		}
		
		return filename;
	}
}
