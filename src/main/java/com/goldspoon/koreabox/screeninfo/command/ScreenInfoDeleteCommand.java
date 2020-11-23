package com.goldspoon.koreabox.screeninfo.command;

import java.util.Map;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;
import com.goldspoon.koreabox.screeninfo.beans.ScreenInfoDAO;

public class ScreenInfoDeleteCommand implements ScreenInfoCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int uid = (Integer)map.get("uid");
		//BWriteDAO dao = new BWriteDAO();
		//int cnt = dao.deleteByUid(uid);
		
		ScreenInfoDAO dao = ScreenInfoQuery.sqlSession.getMapper(ScreenInfoDAO.class);
		model.addAttribute("result", dao.deleteByUid(uid));
		
		//model.addAttribute("result", new BWriteDAO().deleteByUid((Integer)(model.asMap().get("uid"))));
	}

}
















