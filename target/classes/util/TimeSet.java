package util;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class TimeSet {
	
	public static List<String> timeSet(List<String> list){
		
		Collection<String> time = new ArrayList<String>(); // 예약 받을 시간
		
		for(int i = 0; i < 11; i++) {
			time.add((10+i)+":00");
			System.out.println("추가됨"+time.toString());
		} // for문
		
		Collection<String> stime = new ArrayList<String>(); // 지울 시간
		
		for(int i = 0; i < list.size(); i++) {
			stime.add(list.get(i));
			System.out.println(stime.toString());
		} // for문
		
		List<String> timeSet = new ArrayList<String>(time);
		List<String> timeDel = new ArrayList<String>(stime);
		
		timeSet.removeAll(timeDel);
		timeDel.removeAll(timeSet);
		
		System.out.println("timeSet : "+ timeSet.toString());
		System.out.println("timeDel : "+ timeDel.toString());
	
		return timeSet;
		

	}
}
