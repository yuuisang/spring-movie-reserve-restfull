package com.goldspoon.koreabox.movie.service;

import java.util.Map;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieAdminDAO;

public class AdminReadMovie implements Service{


	
	@Override
	public void execute(Model model) {
		
		
		Map<String, Object> map = model.asMap();
		int mov_num = (Integer)map.get("mov_num");
		
		MovieAdminDAO dao = Common.sqlSession.getMapper(MovieAdminDAO.class);
		
		String resourcePath = (String)model.getAttribute("resource");
		
		model.addAttribute("list", dao.read(mov_num));
		model.addAttribute("resource", resourcePath);
		
		System.out.println("resourcePath : " + resourcePath);
		
		
	}

}
