package com.goldspoon.koreabox.movie.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieUserDAO;
import com.goldspoon.koreabox.movie.beans.MovieUserDTO;
import com.goldspoon.koreabox.movie.beans.ShowInfoDTO;

public class UserOpenListMovie implements Service{

	@Override
	public void execute(Model model) {
		MovieUserDAO dao = Common.sqlSession.getMapper(MovieUserDAO.class);
		List<ShowInfoDTO> showInfoList = null;
		List<MovieUserDTO> list = null;
		
		showInfoList = dao.openMovieNum();
		int[] showInfoListArr = new int [showInfoList.size()];
		System.out.println(showInfoList.toString());
		
		for (int i = 0; i < showInfoList.size(); i++) {
			showInfoListArr[i] += showInfoList.get(i).getShw_movieNum();
			
			System.out.print(showInfoListArr[i]+", ");
		}
		System.out.println();
		if(showInfoListArr.length>0) {
		list = dao.openMovieList(showInfoListArr);
		System.out.println("openMovieList : " + dao.openMovieList(showInfoListArr).toString());


		}else {
			model.addAttribute("result", 0);
		}
		
		model.addAttribute("list", list);
	}

}
