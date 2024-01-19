package util;

import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

public class Common {

	// 페이지 유효성 체크
	public static int pageParameterCheck(String page) {

		// 숫자만 허용하는 정규식
		String check = "^[\\d]*$";

		// 현재 페이지
		int nowPage = 1;

		// 현재 페이지에 값이 존재 하지 않을 경우 default 1 return
		if (page == null) {
			return nowPage;
		}

		// 빈 문자열 필터링
		if (page != null) {
			page = page.trim();
		}

		// 숫자만 허용 필터링
		if (!Pattern.matches(check, page)) {
			return nowPage;
		}

		// 공백 필터링
		if (!page.isBlank()) {
			nowPage = Integer.parseInt(page);
		}
		
		return nowPage;
	}

	// 페이지 데이터 최소 최대 개수 조회
	public static Map<String, Object> page(int nowPage, int perPage) {

		Map<String, Object> pageData = new HashMap<String, Object>();

		// min data idx
		int minData = perPage * (nowPage - 1) + 1;

		// max data idx
		int maxData = nowPage * perPage;

		pageData.put("minData", minData);

		pageData.put("maxData", maxData);

		return pageData;
	}

	// 페이징 개수
	public static int pagingCount(int totalPagingCount, int perPage) {

		// 맥스 페이지
		int maxPagingIdx = totalPagingCount / perPage;

		//조회된 데이터가 존재하지 않을 때
		if (totalPagingCount == 0) {
			maxPagingIdx = 1;
		}
		
		// 맥스페이지보다 게시물이 약간 더 많을 때 맥스 페이지 up
		if (totalPagingCount % perPage != 0) {
			maxPagingIdx++;
		}


		return maxPagingIdx;

	}

}