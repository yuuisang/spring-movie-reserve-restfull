package com.goldspoon.koreabox.movie.service;

import java.util.Map;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieAdminDAO;

public class AdminDeleteMovie implements Service{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int mov_num = (Integer)map.get("mov_num");
	
		// MyBatis 사용
		MovieAdminDAO dao = Common.sqlSession.getMapper(MovieAdminDAO.class);
		
		model.addAttribute("result", dao.delete(mov_num));
		
		
	}

}
