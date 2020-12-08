package com.goldspoon.koreabox.movie.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieUserDAO;
import com.goldspoon.koreabox.movie.beans.MovieUserDTO;

public class UserExpectedListMovie implements Service{

	@Override
	public void execute(Model model) {
		MovieUserDAO dao = Common.sqlSession.getMapper(MovieUserDAO.class);
		List<MovieUserDTO> list = null;
		List<MovieUserDTO> AfterList = null;
		SimpleDateFormat dateFormat =new SimpleDateFormat("yyyy-MM-dd");
        String todayString = dateFormat.format(new java.util.Date());
        Date today = Date.valueOf(todayString);
        System.out.println("오늘 날짜 : " + today.toString());
//        Date openDate = null;
        
        //java.sql.Date 형식으로 바꾼다.

		
		
		list = dao.select();
		
//		for (MovieUserDTO dto : list) {
//			String openString = dateFormat.format(dto.getMov_openDate());
//			openDate = Date.valueOf(openString);
//			if(today.after(openDate)) {
//				System.out.println("오픈 날짜 : " + openDate.toString());
//				AfterList = dao.openBefore(openDate);
//				System.out.println(AfterList.toString());
//			}
//		}
		
		AfterList = dao.openBeforeList();
		System.out.println(AfterList.size());
		if(AfterList.size()>0) {
			model.addAttribute("result", 1);
		}else {
			model.addAttribute("result", 0);
		}

		
		model.addAttribute("list", AfterList);
	}

}
