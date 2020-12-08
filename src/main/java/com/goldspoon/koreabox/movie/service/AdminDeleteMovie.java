package com.goldspoon.koreabox.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieAdminDAO;

public class AdminDeleteMovie implements Service{

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int mov_num = (Integer)map.get("mov_num");
		
		List<Integer> showInfoList = null;
		List<Integer> reserveList = null;
		
		int error = 0;
		
		// MyBatis 사용
		MovieAdminDAO dao = Common.sqlSession.getMapper(MovieAdminDAO.class);
		
		showInfoList = dao.showInfoList();
		reserveList = dao.reserveList();
		
		for (Integer reserve : reserveList) {
			if(reserve==mov_num) {
				error = 1;
			}
		}
		for (Integer showInfo : showInfoList) {
			if(showInfo==mov_num) {
				error = 2;
			}
		}
		
		if(error == 0) {
			model.addAttribute("result", dao.delete(mov_num));
		}else {
			model.addAttribute("error", error);
		}
		
		
	}

}
