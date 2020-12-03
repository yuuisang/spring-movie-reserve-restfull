package com.goldspoon.koreabox.screeninfo.command;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;
import com.goldspoon.koreabox.screeninfo.beans.IAjaxDAO;
import com.goldspoon.koreabox.screeninfo.beans.ScreenInfoDTO;

public class ScreenInfoRegistCommand implements ScreenInfoCommand {

	// 커맨드 객체(request parameter들)를 "dto" 라는 이름으로 Model 에 담아 호출됨
	@Override
	public void execute(Model model) {
		// Model 안에 담긴 값(attribute) 꺼내기
				ScreenInfoDTO dto = (ScreenInfoDTO)model.getAttribute("dto");
				
				// MyBatis 사용
				IAjaxDAO dao = ScreenInfoQuery.sqlSession.getMapper(IAjaxDAO.class);
				
				// response 에 필요한 값들
				StringBuffer message = new StringBuffer();
				String status = "FAIL";
				
				System.out.println(dto);
				int cnt = 0;
				try {			
					cnt = dao.insert(dto.getScr_name(), dto.getScr_seatRow(), dto.getScr_seatLine());
					if(cnt == 0) {
						message.append("[트랜잭션 실패: 0 insert]");
					} else {
						status = "OK";
						System.out.println(status);
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
















