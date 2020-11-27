package com.goldspoon.koreabox.movie.service;

import java.util.Map;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieAdminDAO;
import com.goldspoon.koreabox.movie.beans.MovieAdminDTO;

public class AdminUpdateMovie implements Service {

	@Override
	public void execute(Model model) {
		MovieAdminDTO dto = (MovieAdminDTO)model.getAttribute("dto");

		
		// MyBatis 사용
		MovieAdminDAO dao = Common.sqlSession.getMapper(MovieAdminDAO.class);
//		dto.setMov_num((Integer)dto.getMov_num());
		dto.setMov_countStar((Integer)dto.getMov_countStar());
		dto.setMov_runtime((Integer)dto.getMov_runtime());
		dto.setMov_showFlag((Integer)dto.getMov_showFlag());
		dto.setMov_totalStar((Integer)dto.getMov_totalStar());
		
		System.out.println(dto.toString());
		System.out.println("mov_num : " + dto.getMov_num());
		model.addAttribute("result", dao.update(dto, dto.getMov_num()));
		

	}

}
