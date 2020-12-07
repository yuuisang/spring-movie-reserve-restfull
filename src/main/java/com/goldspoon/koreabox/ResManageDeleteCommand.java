package com.goldspoon.koreabox;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.mypage.MyPageQuery;
import com.goldspoon.koreabox.mypage.beans.ResManageDAO;
import com.goldspoon.koreabox.mypage.command.UserInfoCommand;

public class ResManageDeleteCommand implements UserInfoCommand {

	@Override
	public void execute(Model model) {
		// TODO Auto-generated method stub
		int cnt = 0;
		ResManageDAO dao = MyPageQuery.sqlSession.getMapper(ResManageDAO.class);
		int res_num = (int) model.getAttribute("res_num");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		try {
			cnt = dao.deleteReserve_user(res_num);
			status = "OK";
			
			int a = 3/cnt;
		} catch (Exception e) {
			message.append("[에러: " + e.getMessage() + "]");
		}

		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("result", cnt);
	}

}
