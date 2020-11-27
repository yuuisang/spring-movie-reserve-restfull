package com.goldspoon.koreabox.showinfo.command;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.showinfo.ShowInfoQuery;
import com.goldspoon.koreabox.showinfo.beans.IAjaxDAO;

public class ShowInfoDeleteCommand implements ShowInfoCommand {

	@Override
	public void execute(Model model) {
		int cnt = 0;
		IAjaxDAO dao = ShowInfoQuery.sqlSession.getMapper(IAjaxDAO.class);
		
		int shw_num = (int)model.getAttribute("shw_num");
	
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {		
			cnt = dao.deleteByNum(shw_num);
			status = "OK";
			
			// cnt 가 0 이면 Arithmetic 에러 catchㄱㄱ
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
















