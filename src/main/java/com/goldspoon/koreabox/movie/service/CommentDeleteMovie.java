package com.goldspoon.koreabox.movie.service;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieUserDAO;

public class CommentDeleteMovie implements Service{

	@Override
	public void execute(Model model) {
		int cmt_num = (Integer)model.getAttribute("cmt_num");
		int cmt_movieNum = (Integer)model.getAttribute("cmt_movieNum");
		int starRating = 0;
		int starRatingDeleteChk = 0;
		int starCntDeleteChk = 0; 
		MovieUserDAO dao = Common.sqlSession.getMapper(MovieUserDAO.class);
		
		starRating = dao.starRatingSearch(cmt_num);
		
		
		model.addAttribute("result", dao.commentDelete(cmt_num, cmt_movieNum));
		starRatingDeleteChk = dao.starRatingDelete(starRating, cmt_movieNum);
		starCntDeleteChk = dao.starCntDelete(cmt_movieNum);
		model.addAttribute("cmt_movieNum", cmt_movieNum);
		
	}

}
