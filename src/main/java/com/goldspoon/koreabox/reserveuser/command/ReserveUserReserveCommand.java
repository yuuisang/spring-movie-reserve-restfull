package com.goldspoon.koreabox.reserveuser.command;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.reserveinfo.beans.ReserveInfoDTO;
import com.goldspoon.koreabox.reserveuser.beans.ReserveUserDAO;
import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;

public class ReserveUserReserveCommand implements ReserveUserCommand {

	@Override
	public void execute(Model model) {
		ReserveInfoDTO dto = (ReserveInfoDTO) model.getAttribute("dto");
		
		ReserveUserDAO dao = ScreenInfoQuery.sqlSession.getMapper(ReserveUserDAO.class);
		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		int cnt = 0;
		
		try {
			cnt = dao.insert_tb_reserve(dto);
			message.append("성공");
			if(cnt == 0) {
				message.append("[트랜잭션 실패: 0 insert]");
			}else {
				status = "OK";
			}
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[트랜잭션 에러: " + e.getMessage() + "]");
		}
		
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("result", cnt);
		
	}

}
