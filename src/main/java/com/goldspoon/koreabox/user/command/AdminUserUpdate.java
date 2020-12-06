package com.goldspoon.koreabox.user.command;

import java.util.List;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.service.Common;
import com.goldspoon.koreabox.user.beans.AdminUserDAO;
import com.goldspoon.koreabox.user.beans.AdminUserDTO;

public class AdminUserUpdate implements Command{

	@Override
	public void execute(Model model) {
		AdminUserDTO dto = (AdminUserDTO)model.getAttribute("dto");
		List<Integer> commentList = null;
		List<Integer> reserveList = null;
		int commentUpdateChk = 0;
		int reserveUpdateChk = 0;
		AdminUserDAO dao = Common.sqlSession.getMapper(AdminUserDAO.class);
		AdminUserDTO dto2 = dao.memberRead(dto.getMem_uid());
		int error = 0;
		
		String idChk = dto.getMem_id();
		String phoneChk = dto.getMem_phone();
		String mailChk = dto.getMem_email();
		
		commentList = dao.commentList();
		reserveList = dao.reserveList();
		
		if(dto.getMem_id().equals("")) {
			error = 1;
			model.addAttribute("error", error);
		}else if(dto.getMem_name().equals("")) {
			error = 2;
			model.addAttribute("error", error);
		}else if(dto.getMem_pw().equals("")) {
			error = 3;
			model.addAttribute("error", error);
		}else if(dto.getMem_birth().equals("")) {
			error = 4;
			model.addAttribute("error", error);
		}else if(dto.getMem_phone().equals("")) {
			error = 5;
			model.addAttribute("error", error);
		}else if(dto.getMem_email().equals("")) {
			error = 6;
			model.addAttribute("error", error);
		}else if(dao.idCheck(dto.getMem_id())!=null && !(dto.getMem_id().equals(dto2.getMem_id()))) {
			error = 7;	// 아이디 중복
			model.addAttribute("error", error);
		}else if(dao.phoneCheck(dto.getMem_phone())!=null && !(dto.getMem_phone().equals(dto2.getMem_phone()))) {
			error = 8;	// 휴대폰 번호 중복
			model.addAttribute("error", error);
		}else if(dao.emailCheck(dto.getMem_email())!=null && !(dto.getMem_email().equals(dto2.getMem_email()))){
			error = 9;	// 이메일 중복
			model.addAttribute("error", error);
		}else {
			model.addAttribute("result", dao.userUpdate(dto));
			for (Integer list : commentList) {
				if(list==dto.getMem_uid()) {
					commentUpdateChk = dao.commentUpdate(dto.getMem_uid(), dto.getMem_id());
				}
			}
			for (Integer list : reserveList) {
				if(list==dto.getMem_uid()) {
					reserveUpdateChk = dao.reserveUpdate(dto.getMem_uid(), dto.getMem_id());
				}
			}
		}
		
		
		
	}

}
