package com.goldspoon.koreabox.screeninfo.command;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;
import com.goldspoon.koreabox.screeninfo.beans.ScreenInfoDAO;


public class ScreenInfoListCommand implements ScreenInfoCommand {

	@Override
	public void execute(Model model) {
		//BWriteDAO dao = new BWriteDAO();
		//List<BWriteDTO> list = dao.select();
		
		// MyBatis 사용
		ScreenInfoDAO dao = ScreenInfoQuery.sqlSession.getMapper(ScreenInfoDAO.class);
		model.addAttribute("list", dao.select());
	}

}












