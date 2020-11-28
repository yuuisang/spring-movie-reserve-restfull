package com.goldspoon.koreabox.movie.service;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieUserDAO;


public class UserRatingMovie implements Service {

	@Override
	public void execute(Model model) {
		int mov_num = (Integer)model.getAttribute("mov_num");
		int star_rating = (Integer)model.getAttribute("star_rating");
		int cnt = 0;
		
		// MyBatis 사용
		MovieUserDAO dao = Common.sqlSession.getMapper(MovieUserDAO.class);
		cnt = dao.updateRating(mov_num, star_rating);
		dao.ratingCnt(mov_num);
		
		model.addAttribute("result", cnt);
		
	}

}
