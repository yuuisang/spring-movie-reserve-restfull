package com.goldspoon.koreabox.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.CommentDTO;
import com.goldspoon.koreabox.movie.beans.MovieUserDAO;
import com.goldspoon.koreabox.movie.beans.MovieUserDTO;

public class OpenViewMovie implements Service{

	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		int mov_num = (Integer)map.get("mov_num");
		int curPage = 1;   // 현재 페이지 (디폴트 1 page)
		int cnt = 0;   // 글 목록 전체의 개수

		
		// 페이징 관련 세팅 값들
		int writePages = 4;    // 한 [페이징] 에 몇개의 '페이지'를 표현할 것인가?
		int pageRows = 10;   // 한 '페이지'에 몇개의 글을 리스트 할것인가? 
		int totalPage = 0; //총 몇 '페이지' 분량인가? 
		
		curPage = (Integer)model.getAttribute("page");
		
		MovieUserDAO dao = Common.sqlSession.getMapper(MovieUserDAO.class);
		MovieUserDTO dto = null;
		List<CommentDTO> listComment = null;
		
		String resourcePath = (String)model.getAttribute("resource");
		
		cnt = dao.countAllComment(mov_num);	//전체 글 갯수
		totalPage = (int)Math.ceil(cnt / (double)pageRows); //총 몇 페이지 분량인가?
		int fromRow = (curPage - 1) * pageRows + 1;	// 몇번째 row 부터?
		
		
		dto = dao.read(mov_num);
		listComment = dao.commentList(mov_num, fromRow);
		
		double star_rating = (double)dto.getMov_totalStar()/(double)dto.getMov_countStar();
		
		model.addAttribute("list", dto);
		model.addAttribute("listComment", listComment);
		
		model.addAttribute("star_rating", Math.round(star_rating*100)/100.0);
		model.addAttribute("resource", resourcePath);
		
		System.out.println("resourcePath : " + resourcePath);
		
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("curPage", curPage);
		
	}

}
