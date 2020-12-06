package com.goldspoon.koreabox.user.command;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.service.Common;
import com.goldspoon.koreabox.user.beans.UserDAO;

public class PwSearchCommand implements Command {

	@Override
	public void execute(Model model) {
		String mem_id = (String)model.getAttribute("mem_id");
		String mem_name = (String)model.getAttribute("mem_name");
		String mem_email = (String)model.getAttribute("mem_email");
		String mem_pw = "";
		int result = 0;
		
		UserDAO dao = Common.sqlSession.getMapper(UserDAO.class);
		
		mem_pw = dao.pwSearch(mem_id, mem_name, mem_email);
		if(mem_pw==null) {
			result = 0;
			System.out.println("mem_pw : " + mem_pw);
			System.out.println("result : " + result);
		}else {
			result = 1;
			System.out.println("result : " + result);
		}
		
		
		model.addAttribute("result", result);
		model.addAttribute("mem_pw", mem_pw);
		
	}


}
