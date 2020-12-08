package com.goldspoon.koreabox.movie.service;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieAdminDAO;
import com.goldspoon.koreabox.movie.beans.MovieAdminDTO;


public class AdminListMovie implements Service{
	@Override
	public void execute(Model model) {
		MovieAdminDAO dao = Common.sqlSession.getMapper(MovieAdminDAO.class);
		List<MovieAdminDTO> list = null;




		list = dao.select();

		model.addAttribute("list", list);



	}
}
