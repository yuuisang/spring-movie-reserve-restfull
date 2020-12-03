package com.goldspoon.koreabox.reserveuser.command;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.reserveuser.beans.ReserveUserDAO;
import com.goldspoon.koreabox.reserveuser.beans.ReserveUserDTO;
import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;

public class ReserveUserListCommand implements ReserveUserCommand {

	@Override
	public void execute(Model model) {
		// 선택한 영화 값들 가져오기
		//-----------------------------------------------------
		int mov_num = (Integer) model.getAttribute("mov_num");
		System.out.println("커맨드단 -- mov_num : " + mov_num);
		
		List<ReserveUserDTO> list = null;
		int reserveCntAll = 0;
		
		// response 에 필요한 것
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			ReserveUserDAO dao = ScreenInfoQuery.sqlSession.getMapper(ReserveUserDAO.class);
			list = dao.tb_showinfo(mov_num);
			reserveCntAll = dao.reserveCntAll();
			
			if(list == null) {
				message.append("[리스트할 데이터가 없습니다]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[트랜잭션 에러: " + e.getMessage() + "]");
		}
		
		
		model.addAttribute("reserveCntAll", reserveCntAll);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("list", list);
		
		// 영화 날짜 겹치는거 지워주기 위해서 set에 담았다가 다시 List로 보내주기
		//-----------------------------------------------------
		
		Calendar cal = Calendar.getInstance();
		 
		//현재 년도, 월, 일
		String year = cal.get ( cal.YEAR ) + "";
		String month = cal.get ( cal.MONTH ) + 1 + "" ;
		String to_date = cal.get ( cal.DATE ) + "" ;
		 
		 
		//현재 (시,분,초)
		String hour = cal.get ( cal.HOUR_OF_DAY ) + "" ;
		String min = cal.get ( cal.MINUTE ) + "";
		String sec = cal.get ( cal.SECOND ) + "";
		
		if(Integer.parseInt(month)<10) {
			month = 0 + month;
		}
		
		if(Integer.parseInt(to_date)<10) {
			to_date = 0 + to_date;
		}
		
		if(Integer.parseInt(hour)<10) {
			hour = 0 + hour;
		}

		String todaydate = year + month + to_date;
//		date.getShw_time()> Integer.parseInt(hour)
//		Integer.parseInt(todaydate) <= Integer.parseInt(date.getShw_date().replaceAll("-", "")) &&
//				Integer.parseInt(todaydate) > Integer.parseInt(date.getShw_date().replaceAll("-", ""))-3
//		Set<ReserveUserDTO> dateList = new HashSet<ReserveUserDTO>();
		Set<String> dateList2 = new HashSet<String>();
		for (ReserveUserDTO date : list) {
			if(Integer.parseInt(todaydate) == Integer.parseInt(date.getShw_date().replaceAll("-", "")) &&
					date.getShw_time()> Integer.parseInt(hour)) {
				dateList2.add(date.getShw_date());				
			}
			//System.out.println(date.getShw_date());
		}
		
		for (ReserveUserDTO date : list) {
			if(Integer.parseInt(todaydate) != Integer.parseInt(date.getShw_date().replaceAll("-", "")) &&
					Integer.parseInt(todaydate) <= Integer.parseInt(date.getShw_date().replaceAll("-", "")) &&
					Integer.parseInt(todaydate) > Integer.parseInt(date.getShw_date().replaceAll("-", ""))-3) {
				dateList2.add(date.getShw_date());				
			}
			//System.out.println(date.getShw_date());
		}
	
		ArrayList<String> date = new ArrayList<String>();
		for(String dd : dateList2) {
			if(true) {
				date.add(dd);				
			}
		}
		
		System.out.println(date);
		Collections.sort(date);	// 날짜별로 정렬해주기
		model.addAttribute("date", date);
		model.addAttribute("todaydate", todaydate);
		model.addAttribute("hour", hour);
	}
	

}
