package com.goldspoon.koreabox.screeninfo.command;

import java.util.Map;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;
import com.goldspoon.koreabox.screeninfo.beans.ScreenInfoDAO;
import com.goldspoon.koreabox.screeninfo.beans.ScreenInfoDTO;

public class ScreenInfoUpdateCommand implements ScreenInfoCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		ScreenInfoDTO dto = (ScreenInfoDTO)map.get("dto");
		
		//BWriteDAO dao = new BWriteDAO();
		//int cnt = dao.update(dto);
		
		ScreenInfoDAO dao = ScreenInfoQuery.sqlSession.getMapper(ScreenInfoDAO.class);
		//model.addAttribute("result", dao.update(dto));
		model.addAttribute("result", dao.update(dto.getUid(), dto));
	}

}















