package com.goldspoon.koreabox.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.CommentDTO;
import com.goldspoon.koreabox.movie.beans.MovieUserDAO;
import com.goldspoon.koreabox.movie.beans.MovieUserDTO;

public class ExpectedViewMovie implements Service{

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		int mov_num = (Integer)map.get("mov_num");
		
		MovieUserDAO dao = Common.sqlSession.getMapper(MovieUserDAO.class);
		MovieUserDTO dto = null;

		
		String resourcePath = (String)model.getAttribute("resource");
		
		
		
		dto = dao.read(mov_num);
		
		
		model.addAttribute("list", dto);

		model.addAttribute("resource", resourcePath);
		
		System.out.println("resourcePath : " + resourcePath);
		
		
	}

}
