package com.goldspoon.koreabox.screeninfo.command;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;
import com.goldspoon.koreabox.screeninfo.beans.ScreenInfoDAO;
import com.goldspoon.koreabox.screeninfo.beans.ScreenInfoDTO;

public class ScreenInfoViewCommand implements ScreenInfoCommand {

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int uid = (Integer)map.get("uid");
		
//		BWriteDAO dao = new BWriteDAO();
//		List<BWriteDTO> list = dao.readByUid(uid);
		
		ScreenInfoDAO dao = ScreenInfoQuery.sqlSession.getMapper(ScreenInfoDAO.class);
		dao.incViewCnt(uid);  // 조회수 증가
		
		List<ScreenInfoDTO> list = dao.selectByUid(uid);
		
		model.addAttribute("list", list);
	}

}














