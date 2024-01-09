package util;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

public class TimeSet {
	
	public static List<String> timeSet(List<String> list,String rv_day){
		
		List<String> time = new ArrayList<String>(); // 예약 받을 시간
		
		Calendar cal = Calendar.getInstance();
	    int currenthour = cal.get(Calendar.HOUR_OF_DAY); // 24시간 형식으로 시간 얻기	    
	    int starttime = 10;
	    int endtime = 21;
	    
	    //오늘날짜 만들기
	    int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH) + 1;
		int date = cal.get(Calendar.DATE);
		String today = String.format("%04d-%02d-%02d", year, month, date);
	    
	    //오늘이 예약일일 경우 시간 제한 걸기 (현재 시간보다 1시간이후에만 영업 시간내에 예약가능)
	    if(rv_day.equals(today)) {
	    	starttime = 10<currenthour+1?currenthour+1:10;
	    }
		
		for(int i = starttime; i < endtime; i++) {
			time.add((i)+":00");
		} // for문
		
		time.removeAll(list);
		
		return time;

	}
}
