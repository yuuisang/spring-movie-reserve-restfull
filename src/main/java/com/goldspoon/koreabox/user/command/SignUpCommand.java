package com.goldspoon.koreabox.user.command;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieUserDAO;
import com.goldspoon.koreabox.movie.service.Common;
import com.goldspoon.koreabox.user.beans.UserDAO;
import com.goldspoon.koreabox.user.beans.UserDTO;

public class SignUpCommand implements Command {

	@Override
	public void execute(Model model) {
		
		UserDTO dto = (UserDTO)model.getAttribute("dto");
		String pwOk = (String)model.getAttribute("pwOk");
		UserDAO dao = Common.sqlSession.getMapper(UserDAO.class);
		int result = 0;
		int error = 0;
		
		if(dto.getMem_name().equals("")) {
			error = 1;	// 이름 입력x
			model.addAttribute("error", error);
		}else if(dto.getMem_id().equals("")) {
			error = 2;	// 아이디 입력 x
			model.addAttribute("error", error);
		}else if(dto.getMem_pw().equals("")) {
			error = 3;	// 비밀번호 입력x
			model.addAttribute("error", error);
		}else if(!pwOk.equals(dto.getMem_pw())) {
			error = 4;	// 비밀번호 확인이 다를때
			model.addAttribute("error", error);
		}else if(dto.getMem_birth().equals("")) {
			error = 5;	// 생년월일 입력x
			model.addAttribute("error", error);
		}else if(dto.getMem_phone().equals("")) {
			error = 6;	// 휴대폰 번호 입력x
			model.addAttribute("error", error);
		}else if(dto.getMem_email().equals("")) {
			error = 7;	// 이메일 입력 x
			model.addAttribute("error", error);
		}else if(dao.idCheck(dto.getMem_id())!=null) {
			error = 8;	// 아이디 중복
			model.addAttribute("error", error);
		}else if(dao.phoneCheck(dto.getMem_phone())!=null) {
			error = 9;	// 휴대폰 번호 중복
			model.addAttribute("error", error);
		}else if(dao.emailCheck(dto.getMem_email())!=null){
			error = 10;	// 이메일 중복
			model.addAttribute("error", error);
		}
		else {			
			result = dao.signUpInsert(dto);
			model.addAttribute("result", result);
		}
		
		
	}

}
