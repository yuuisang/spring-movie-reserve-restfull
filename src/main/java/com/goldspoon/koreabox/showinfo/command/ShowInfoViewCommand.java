package com.goldspoon.koreabox.showinfo.command;

import java.util.List;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.showinfo.ShowInfoQuery;
import com.goldspoon.koreabox.showinfo.beans.IAjaxDAO;
import com.goldspoon.koreabox.showinfo.beans.ShowInfoDTO;

public class ShowInfoViewCommand implements ShowInfoCommand{
	@Override
	public void execute(Model model) {
		
		IAjaxDAO dao = ShowInfoQuery.sqlSession.getMapper(IAjaxDAO.class);
		
		int uid = (Integer)model.getAttribute("uid");
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		List<ShowInfoDTO> list = null;
		
		try {				
			list = dao.selectInfo(uid); // 읽기
			if(list.size() == 0) {
				message.append("[해당 데이터가 없습니다]");
			} else {
				status = "OK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[에러: " + e.getMessage() + "]");
		}
		
		model.addAttribute("list", list);
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
	}
}















