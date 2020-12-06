package com.goldspoon.koreabox;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.goldspoon.koreabox.movie.service.AdminListMovie;
import com.goldspoon.koreabox.movie.service.Common;
import com.goldspoon.koreabox.user.beans.AdminUserDTO;
import com.goldspoon.koreabox.user.command.AdminUserDelete;
import com.goldspoon.koreabox.user.command.AdminUserList;
import com.goldspoon.koreabox.user.command.AdminUserRead;
import com.goldspoon.koreabox.user.command.AdminUserUpdate;

@Controller
@RequestMapping("/admin")
public class MemberAdminController {
	
	// MyBatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Common.sqlSession = sqlSession;
	}

	@RequestMapping("/managerMemberList")
	public void managerMemberList(Model model) {
//		model.addAttribute("page", page);
		new AdminUserList().execute(model);
	}
	
	@RequestMapping("/updateUserData")
	public void updateUserData(Model model, int mem_uid) {
		model.addAttribute("mem_uid", mem_uid);
		new AdminUserRead().execute(model);
	}
	
	@RequestMapping("/updateUserDataOk")
	public void updateUserDataOk(Model model, AdminUserDTO dto) {
		model.addAttribute("dto", dto);
		new AdminUserUpdate().execute(model);
	}
	
	@RequestMapping("/deleteUserDataOk")
	public void deleteUserDataOk(Model model, int mem_uid) {
		model.addAttribute("mem_uid", mem_uid);
		new AdminUserDelete().execute(model);
	}

	
	
}
