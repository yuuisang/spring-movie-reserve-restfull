package com.goldspoon.koreabox;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.goldspoon.koreabox.movie.beans.CommentDTO;
import com.goldspoon.koreabox.movie.service.CommentDeleteMovie;
import com.goldspoon.koreabox.movie.service.CommentUpdateMovie;
import com.goldspoon.koreabox.movie.service.CommentWriteMovie;
import com.goldspoon.koreabox.movie.service.Common;
import com.goldspoon.koreabox.movie.service.ExpectedViewMovie;
import com.goldspoon.koreabox.movie.service.Service;
import com.goldspoon.koreabox.movie.service.UserExpectedListMovie;
import com.goldspoon.koreabox.movie.service.UserOpenListMovie;

import com.goldspoon.koreabox.movie.service.OpenViewMovie;
import com.sun.org.apache.xpath.internal.operations.Mod;

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
	public void openViewMovie(int mov_num, int page, Model model) {
		model.addAttribute("mov_num", mov_num);
		model.addAttribute("page", page);
		new OpenViewMovie().execute(model);
	}
	
	@RequestMapping("/expectedViewMovie")
	public void expectedViewMovie(int mov_num, Model model) {
		model.addAttribute("mov_num", mov_num);
		new ExpectedViewMovie().execute(model);
	}
	
	@RequestMapping("/commentWriteOk")
	public void commentWriteOk(CommentDTO dto, int cmt_movieNum, Model model) {
		model.addAttribute("dto", dto);
		model.addAttribute("cmt_movieNum", cmt_movieNum);
		new CommentWriteMovie().execute(model);
	}
	
	@RequestMapping("/commentDeleteOk")
	public void commentDeleteOk(int cmt_num, int cmt_movieNum, Model model) {
		model.addAttribute("cmt_movieNum", cmt_movieNum);
		model.addAttribute("cmt_num", cmt_num);
		new CommentDeleteMovie().execute(model);
	}
	
	@RequestMapping(value = "/commentUpdateOk")
	public void commentUpdateOk(int cmt_movieNum, int cmt_num, String cmt_content, Model model) {
		model.addAttribute("cmt_movieNum", cmt_movieNum);
		model.addAttribute("cmt_num", cmt_num);
		model.addAttribute("cmt_content", cmt_content);
		new CommentUpdateMovie().execute(model);
	}
	
}
