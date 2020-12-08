package com.goldspoon.koreabox.user.command;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.service.Common;
import com.goldspoon.koreabox.user.beans.UserDAO;

public class IdSearchCommand implements Command {

	@Override
	public void execute(Model model) {
		String mem_name = (String)model.getAttribute("mem_name");
		String mem_phone = (String)model.getAttribute("mem_phone");
		String mem_id = "";
		int result = 0;
		
		UserDAO dao = Common.sqlSession.getMapper(UserDAO.class);
		
		mem_id = dao.idSearch(mem_name, mem_phone);
		if(mem_id==null) {
			result = 0;
			System.out.println("mem_id : " + mem_id);
			System.out.println("result : " + result);
		}else {
			result = 1;
			System.out.println("result : " + result);
		}
		
		
		model.addAttribute("result", result);
		model.addAttribute("mem_id", mem_id);
		
	}

}
