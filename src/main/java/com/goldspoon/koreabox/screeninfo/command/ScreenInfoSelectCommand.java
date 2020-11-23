package com.goldspoon.koreabox.screeninfo.command;

import java.util.Map;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;
import com.goldspoon.koreabox.screeninfo.beans.ScreenInfoDAO;

public class ScreenInfoSelectCommand implements ScreenInfoCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int uid = (Integer)map.get("uid");

		//BWriteDAO dao = new BWriteDAO();
		//List<BWriteDTO> list = dao.selectByUid(uid);
		
		ScreenInfoDAO dao = ScreenInfoQuery.sqlSession.getMapper(ScreenInfoDAO.class);
		model.addAttribute("list", dao.selectByUid(uid));
	}

}















