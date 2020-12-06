package com.goldspoon.koreabox.user.command;

import java.util.List;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.service.Common;
import com.goldspoon.koreabox.user.beans.AdminUserDAO;
import com.goldspoon.koreabox.user.beans.AdminUserDTO;

public class AdminUserRead implements Command{

	@Override
	public void execute(Model model) {
		int mem_uid = (Integer)model.getAttribute("mem_uid");
		AdminUserDAO dao = Common.sqlSession.getMapper(AdminUserDAO.class);
		AdminUserDTO dto = dao.memberRead(mem_uid);
		
		model.addAttribute("list", dto);
		
	}

}
