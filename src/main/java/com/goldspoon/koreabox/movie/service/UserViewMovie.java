package com.goldspoon.koreabox.movie.service;

import java.util.Map;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieUserDAO;
import com.goldspoon.koreabox.movie.beans.MovieUserDTO;

public class UserViewMovie implements Service{

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		int mov_num = (Integer)map.get("mov_num");
		
		MovieUserDAO dao = Common.sqlSession.getMapper(MovieUserDAO.class);
		MovieUserDTO dto = null;
		
		String resourcePath = (String)model.getAttribute("resource");
		
		dto = dao.read(mov_num);
		
		double star_rating = (double)dto.getMov_totalStar()/(double)dto.getMov_countStar();
		
		model.addAttribute("list", dto);
		model.addAttribute("star_rating", Math.round(star_rating*100)/100.0);
		model.addAttribute("resource", resourcePath);
		
		System.out.println("resourcePath : " + resourcePath);
		
	}

}
