package com.goldspoon.koreabox.reserveinfo.command;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.reserveinfo.beans.ReserveInfoDAO;
import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;

public class ReserveInfoDeleteCommand implements ReserveInfoCommand {

	@Override
	public void execute(Model model) {
		int cnt = 0;
		ReserveInfoDAO dao = ScreenInfoQuery.sqlSession.getMapper(ReserveInfoDAO.class);
		int res_num = (int) model.getAttribute("res_num");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		try {
			cnt = dao.deleteReserve(res_num);
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
