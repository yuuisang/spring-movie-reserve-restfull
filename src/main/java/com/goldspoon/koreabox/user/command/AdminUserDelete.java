package com.goldspoon.koreabox.user.command;

import java.util.List;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.service.Common;
import com.goldspoon.koreabox.user.beans.AdminUserDAO;

public class AdminUserDelete implements Command{

	@Override
	public void execute(Model model) {
		int mem_uid = (Integer)model.getAttribute("mem_uid");
		List<Integer> reserveList = null;
//		List<Integer> commentNum = null;
//		Integer movieNum = 0;
//		int starRating = 0;
//		int commentDeleteChk = 0;
//		int starDeleteChk = 0;
//		int starCntDeleteChk = 0;
		int error = 0;
		
		AdminUserDAO dao = Common.sqlSession.getMapper(AdminUserDAO.class);
		

		reserveList = dao.reserveList();
		if(reserveList.size()>0) {
		for (Integer list : reserveList) {
			if(list==mem_uid) {
				error = 1;
			}
		}
		}
		
//		System.out.println("mem_uid : " + mem_uid);
//		commentNum = dao.commentNumSearch(mem_uid);
//		System.out.println(commentNum.toString());
//		for (Integer list : commentNum) {
//			if(commentNum.size()>0) {
//			movieNum = dao.movieNumSearch(list);
//			System.out.println("movieNum : " + movieNum);
//			starRating = dao.starRatingSearch(mem_uid, list);
//			System.out.println("starRating : " + starRating);
//			commentDeleteChk = dao.commentDelete(mem_uid);
//			starDeleteChk = dao.starRatingDelete(movieNum, starRating);
//			starCntDeleteChk = dao.starCntDelete(movieNum);
//		}
//		}
		
		if(error == 0) {
			model.addAttribute("result", dao.userDelete(mem_uid));

		}else {
			model.addAttribute("error", error);
		}
	}

}
