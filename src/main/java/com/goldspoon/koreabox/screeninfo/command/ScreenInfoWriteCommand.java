package com.goldspoon.koreabox.screeninfo.command;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;
import com.goldspoon.koreabox.screeninfo.beans.ScreenInfoDAO;
import com.goldspoon.koreabox.screeninfo.beans.ScreenInfoDTO;

public class ScreenInfoWriteCommand implements ScreenInfoCommand {

	// 커맨드 객체(request parameter들)를 "dto" 라는 이름으로 Model 에 담아 호출됨
	@Override
	public void execute(Model model) {
		// Model 안에 담긴 값(attribute) 꺼내기
		ScreenInfoDTO dto = (ScreenInfoDTO)model.getAttribute("dto");
		//BWriteDAO dao = new BWriteDAO();
		//int result = dao.insert(dto);
		
		// MyBatis 사용
		ScreenInfoDAO dao = ScreenInfoQuery.sqlSession.getMapper(ScreenInfoDAO.class);
		model.addAttribute("result", dao.insert(dto));		
		
		// auto-generated 된 uid 값 확인
		System.out.println("생성된 uid 는 : "+ dto.getUid());
		
		
		//model.addAttribute("result", dao.insert(dto.getSubject(), dto.getContent(), dto.getName()));
	
	} // end execute()
} // end Command
















