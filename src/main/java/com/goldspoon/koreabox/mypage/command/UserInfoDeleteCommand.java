package com.goldspoon.koreabox.mypage.command;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.mypage.MyPageQuery;
import com.goldspoon.koreabox.mypage.beans.IAjaxDAO;
import com.goldspoon.koreabox.mypage.beans.UserInfoDTO;


public class UserInfoDeleteCommand implements UserInfoCommand {

	@Override
	public void execute(Model model) {
		IAjaxDAO dao = MyPageQuery.sqlSession.getMapper(IAjaxDAO.class);
		
		UserInfoDTO dto = (UserInfoDTO)model.getAttribute("dto");
	
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		int cnt = 0;
		int cnt2 = 0;
		int cnt3 = 0;
		try {		
			cnt = dao.deleteByNum(dto);
			cnt2 = dao.deleteResByNum(dto);
			cnt3 = dao.deleteCommByNum(dto);
			status = "OK";
			
			// cnt 가 0 이면 Arithmetic 에러 catch
			int chkResult = 1 / cnt;
		} catch(Exception e) {
			e.printStackTrace();
			message.append("[에러: " + e.getMessage() + "]");
		}
		
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("result", cnt);
		
	}

}
















