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
		int curPage = 1;   // 현재 페이지 (디폴트 1 page)
		int cnt = 0;   // 글 목록 전체의 개수

		
		// 페이징 관련 세팅 값들
		int writePages = 4;    // 한 [페이징] 에 몇개의 '페이지'를 표현할 것인가?
		int pageRows = 10;   // 한 '페이지'에 몇개의 글을 리스트 할것인가? 
		int totalPage = 0; //총 몇 '페이지' 분량인가? 

		
		// 현재 몇 페이지인지 parameter 받아오기 + 검증
//		String pageParam = (String)model.getAttribute("page");
//		if(pageParam != null && !pageParam.trim().equals("")){
//			try{ 
				// 1이상의 자연수 이어야 한다
//				int p = Integer.parseInt(pageParam);
//				if(p > 0) curPage = p;
//			} catch(NumberFormatException e){
				// page parameter 오류는 별도의 exception 처리 안함 
//			}
//		} // end if

		curPage = (Integer)model.getAttribute("page");


		cnt = dao.countAll();	//전체 글 갯수
		
		totalPage = (int)Math.ceil(cnt / (double)pageRows); //총 몇 페이지 분량인가?
		int fromRow = (curPage - 1) * pageRows + 1;	// 몇번째 row 부터?
		
		list = dao.selectFromRow(fromRow, pageRows);
		

		System.out.println("리스트 전체 : " + cnt);


		model.addAttribute("list", list);

		model.addAttribute("totalPage", totalPage);
		model.addAttribute("curPage", curPage);

	}
}
