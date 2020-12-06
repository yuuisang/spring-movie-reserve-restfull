package com.goldspoon.koreabox.movie.service;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieUserDAO;

public class CommentUpdateMovie implements Service{

	@Override
	public void execute(Model model) {
		String cmt_content = (String)model.getAttribute("cmt_content");
		int cmt_num = (Integer)model.getAttribute("cmt_num");
		int cmt_movieNum = (Integer)model.getAttribute("cmt_movieNum");
		
		MovieUserDAO dao = Common.sqlSession.getMapper(MovieUserDAO.class);
		
		model.addAttribute("result", dao.commentUpdate(cmt_content, cmt_num));
		model.addAttribute("cmt_movieNum", cmt_movieNum);
	}

}
