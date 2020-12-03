package com.goldspoon.koreabox.showinfo.command;


import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.showinfo.ShowInfoQuery;
import com.goldspoon.koreabox.showinfo.beans.IAjaxDAO;
import com.goldspoon.koreabox.showinfo.beans.ShowInfoDTO;

public class ShowInfoRegistCommand implements ShowInfoCommand {

	// 커맨드 객체(request parameter들)를 "dto" 라는 이름으로 Model 에 담아 호출됨
	@Override
	public void execute(Model model) {
		// Model 안에 담긴 값(attribute) 꺼내기
				ShowInfoDTO dto = (ShowInfoDTO)model.getAttribute("dto");
				
				// MyBatis 사용
				IAjaxDAO dao = ShowInfoQuery.sqlSession.getMapper(IAjaxDAO.class);
				
				// response 에 필요한 값들
				StringBuffer message = new StringBuffer();
				String status = "FAIL";
				
				System.out.println(dto);
				
				
				// Date객체로 로컬날짜시간받아서 SQL sysdate로 파싱
//				SimpleDateFormat sdf = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
//				Date date = new Date();
//				
//				String now = sdf.format(date);
//				java.sql.Timestamp sysdate = java.sql.Timestamp.valueOf(now);
				
				//System.out.println(now);
				//dto.setShw_regDate(sysdate);
				
				int cnt = 0;
				try {			
					cnt = dao.insert(
							dto.getShw_movieNum(), dto.getShw_movieName()
							,dto.getShw_screenNum(), dto.getShw_screenName(), dto.getShw_date()
							,dto.getShw_time(), dto.getShw_seatCnt(), dto.getShw_seatRow(), dto.getShw_seatLine()
							, dto.getShw_expireFlag()
							);
					if(cnt == 0) {
						message.append("[트랜잭션 실패: 0 insert]");
					} else {
						status = "OK";
					}
				} catch(Exception e) {
					e.printStackTrace();
					message.append("[트랜잭션 에러: " + e.getMessage() + "]");
				}
				
				model.addAttribute("status", status);
				model.addAttribute("message", message.toString());
				model.addAttribute("result", cnt);
	
	} // end execute()
} // end Command
















