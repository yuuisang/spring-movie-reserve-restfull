package com.goldspoon.koreabox.movie.service;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieAdminDAO;
import com.goldspoon.koreabox.movie.beans.MovieAdminDTO;

public class AdminUpdateMovie implements Service {

	@Override
	public void execute(Model model) {
		MovieAdminDTO dto = (MovieAdminDTO) model.getAttribute("dto");
		MovieAdminDTO dto2 = null;
		List<Integer> showInfoList = null;
		List<Integer> reserveList = null;
		
		// MyBatis 사용
		MovieAdminDAO dao = Common.sqlSession.getMapper(MovieAdminDAO.class);

		System.out.println("포스터 :---------------------------" + dto.getMov_poster());
		dto2 = dao.read(dto.getMov_num());
		System.out.println("포스터 :---------------------------" + dto2.getMov_poster());

		String mov_poster = "";
		String mov_still1 = "";
		String mov_still2 = "";
		String mov_still3 = "";
		
//		if (dto.getMov_poster() == null && dto.getMov_poster().trim().length() == 0) {
//			mov_poster = dto2.getMov_poster();
//			System.out.println(mov_poster);
//		}if(dto.getMov_still1() == null && dto.getMov_still1().trim().length() == 0) {
//			mov_still1 = dto2.getMov_still1();
//			System.out.println(mov_still1);
//		}if(dto.getMov_still2() == null && dto.getMov_still2().trim().length() == 0) {
//			mov_still2 = dto2.getMov_still2();
//			System.out.println(mov_still2);
//		}if(dto.getMov_still3() == null && dto.getMov_still3().trim().length() == 0) {
//			mov_still3 = dto2.getMov_still3();
//			System.out.println(mov_still3);
//		}
		showInfoList = dao.showInfoList();
		System.out.println("showInfoList : " + showInfoList.toString());
		reserveList = dao.reserveList();
		System.out.println("reserveList : " + reserveList.toString());

		
		if (dto.getMov_poster().trim().equals("")) {
			mov_poster = dto2.getMov_poster();
			System.out.println(mov_poster);
		}else {
			mov_poster = dto.getMov_poster();
			System.out.println(mov_poster);
		}
		if(dto.getMov_still1().trim().equals("")) {
			mov_still1 = dto2.getMov_still1();
			System.out.println(mov_still1);
		}else {
			mov_still1 = dto.getMov_still1();
			System.out.println(mov_still1);
		}
		if(dto.getMov_still2().trim().equals("")) {
			mov_still2 = dto2.getMov_still2();
			System.out.println(mov_still2);
		}else {
			mov_still2 = dto.getMov_still2();
			System.out.println(mov_still2);
		}
		if(dto.getMov_still3().trim().equals("")) {
			mov_still3 = dto2.getMov_still3();
			System.out.println(mov_still3);
		}else {
			mov_still3 = dto.getMov_still3();
			System.out.println(mov_still3);
		}

		if (dto.getMov_title() != null && dto.getMov_director() != null && dto.getMov_actors() != null
				&& dto.getMov_genre() != null && dto.getMov_runtime() != 0 && dto.getMov_openDate() != null
				&& dto.getMov_grade() != null && dto.getMov_intro() != null
				&& dto.getMov_title().trim().length() > 0 && dto.getMov_director().trim().length() > 0
				&& dto.getMov_actors().trim().length() > 0 && dto.getMov_genre().trim().length() > 0
				&& dto.getMov_openDate().trim().length() > 0 && dto.getMov_grade().trim().length() > 0
				&& dto.getMov_intro().trim().length() > 0) {


				
//		dto.setMov_num((Integer)dto.getMov_num());
				try {

					System.out.println("mov_num : " + dto.getMov_num());
					model.addAttribute("result", dao.update(dto, dto.getMov_num(), mov_poster, mov_still1, mov_still2, mov_still3));
					
					for (Integer showInfo : showInfoList) {
						if(showInfo==dto.getMov_num()) {
							dao.updateShowInfo(dto.getMov_num(), dto.getMov_title());
						}
					}
					
					for (Integer reserve : reserveList) {
						if(reserve==dto.getMov_num()) {
							dao.updateReserve(dto.getMov_num(), dto.getMov_title());
						}
					}
					
				} catch (Exception e) {
					e.printStackTrace();
					model.addAttribute("error", 0);
				}
			} else {
				model.addAttribute("error", 1);
			}
		
	}

}
