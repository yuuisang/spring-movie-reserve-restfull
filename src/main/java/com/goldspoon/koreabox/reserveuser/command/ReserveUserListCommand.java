package com.goldspoon.koreabox.reserveuser.command;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.reserveuser.beans.ReserveUserDAO;
import com.goldspoon.koreabox.reserveuser.beans.ReserveUserDTO;
import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;

public class ReserveUserListCommand implements ReserveUserCommand {

	@Override
	public void execute(Model model) {
		int mov_num = (int) model.getAttribute("mov_num");
		System.out.println("커맨드단 -- mov_num : " + mov_num);
		
		ReserveUserDAO dao = ScreenInfoQuery.sqlSession.getMapper(ReserveUserDAO.class);
		model.addAttribute("list", dao.tb_showinfo(mov_num));
		
		Set<String> dateList = new HashSet<String>();
		for (ReserveUserDTO date : dao.tb_showinfo(mov_num)) {
			dateList.add(date.getShw_date());
		}
	
		ArrayList<String> date = new ArrayList<String>();
		for(String dd : dateList) {
			date.add(dd);
		}
		Collections.sort(date);
		model.addAttribute("date", date);
	}

}
