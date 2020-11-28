package com.goldspoon.koreabox;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.goldspoon.koreabox.movie.service.Common;
import com.goldspoon.koreabox.movie.service.Service;
import com.goldspoon.koreabox.movie.service.UserExpectedListMovie;
import com.goldspoon.koreabox.movie.service.UserOpenListMovie;
import com.goldspoon.koreabox.movie.service.UserRatingMovie;
import com.goldspoon.koreabox.movie.service.UserViewMovie;

@Controller
@RequestMapping("/movieUser")
public class MovieUserController {
	private Service service;
	
	// MyBatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		Common.sqlSession = sqlSession;
	}

	@RequestMapping("/openMovieList")
	public void openMovieList(Model model) {
		service = new UserOpenListMovie();
		service.execute(model);
	}
	
	
	
	@RequestMapping("/expectedMovieList")
	public void expectedMovieList(Model model) {
		service = new UserExpectedListMovie();
		service.execute(model);
		
	}
	
	@RequestMapping("/openViewMovie")
	public void openViewMovie(int mov_num, Model model) {
		model.addAttribute("mov_num", mov_num);
		new UserViewMovie().execute(model);
	}
	
	@RequestMapping("/expectedViewMovie")
	public void expectedViewMovie(int mov_num, Model model) {
		model.addAttribute("mov_num", mov_num);
		new UserViewMovie().execute(model);
	}
	
	@RequestMapping("/ratingOk")
	public void ratingOk(int mov_num, int star_rating, Model model) {
		model.addAttribute("mov_num", mov_num);
		model.addAttribute("star_rating", star_rating);
		new UserRatingMovie().execute(model);
	}
	
}
