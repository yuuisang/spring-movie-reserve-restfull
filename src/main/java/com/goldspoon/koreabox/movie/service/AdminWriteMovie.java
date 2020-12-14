package com.goldspoon.koreabox.movie.service;

import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.MovieAdminDAO;
import com.goldspoon.koreabox.movie.beans.MovieAdminDTO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
public class AdminWriteMovie implements Service{

	@Override
	public void execute(Model model) {
		MovieAdminDTO dto = (MovieAdminDTO)model.getAttribute("dto");
		// MyBatis 사용
		MovieAdminDAO dao = Common.sqlSession.getMapper(MovieAdminDAO.class);
		
		String mov_title = "";
		String mov_director = "";
		String mov_actors = "";
		String mov_genre = "";
		int mov_runtime = 0;
		String mov_openDate = "";
		String mov_grade = "";
		String mov_intro = "";
		String mov_poster = "";
		String mov_still1 = "";
		String mov_still2 = "";
		String mov_still3 = "";
		
		try {
			mov_title = (String)model.getAttribute("mov_title");
			mov_director = (String)model.getAttribute("mov_director");
			mov_actors = (String)model.getAttribute("mov_actors");
			mov_genre = (String)model.getAttribute("mov_genre");
			mov_runtime = (Integer)model.getAttribute("mov_runtime");
			mov_openDate = (String)model.getAttribute("mov_openDate");
			mov_grade = (String)model.getAttribute("mov_grade");
			mov_intro = (String)model.getAttribute("mov_intro");
			mov_poster = (String)model.getAttribute("mov_poster");
			mov_still1 = (String)model.getAttribute("mov_still1");
			mov_still2 = (String)model.getAttribute("mov_still2");
			mov_still3 = (String)model.getAttribute("mov_still3");
			
		} catch (Exception e) {
			model.addAttribute("error", 0);
		}

		
		if (mov_title != null && mov_director != null && mov_actors != null && mov_genre != null && mov_runtime != 0
				&& mov_openDate != null && mov_grade != null && mov_intro != null && mov_poster != null
				&& mov_still1 != null && mov_still2 != null && mov_still3 != null && mov_title.trim().length() > 0
				&& mov_director.trim().length() > 0 && mov_actors.trim().length() > 0 && mov_genre.trim().length() > 0
				&& mov_openDate.trim().length() > 0 && mov_grade.trim().length() > 0 && mov_intro.trim().length() > 0
				&& mov_poster.trim().length() > 0 && mov_still1.trim().length() > 0 && mov_still2.trim().length() > 0
				&& mov_still3.trim().length() > 0) {
			System.out.println("mov_intro : " + mov_intro +"-------------------");
			try {
				model.addAttribute("result", dao.insert(
						mov_title,
						mov_director,
						mov_actors,
						mov_genre,
						mov_runtime,
						mov_openDate,
						mov_grade,
						mov_intro,
						mov_poster,
						mov_still1,
						mov_still2,
						mov_still3
						));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else {
			model.addAttribute("error", 1);
		}
		

		
//		dto.setMov_countStar((Integer)dto.getMov_countStar());
//		dto.setMov_runtime((Integer)dto.getMov_runtime());
//		dto.setMov_showFlag((Integer)dto.getMov_showFlag());
//		dto.setMov_totalStar((Integer)dto.getMov_totalStar());
		
//					dto.getMov_title(),
//					dto.getMov_director(),
//					dto.getMov_actors(),
//					dto.getMov_genre(),
//					dto.getMov_runtime(),
//					dto.getMov_openDate(),
//					dto.getMov_grade(),
//					dto.getMov_intro(),
//					dto.getMov_poster(),
//					dto.getMov_still1(),
//					dto.getMov_still2(),
//					dto.getMov_still3()
		
		
//		System.out.println(dto.toString());

		
		// auto-generated 된 uid 값 확인
//		System.out.println("생성된 uid 는" + dto.getMov_num());
		
	}
	
	@Autowired
	ServletContext servletContext;
	public void upload(HttpServletRequest request) {
		MovieAdminDAO dao = Common.sqlSession.getMapper(MovieAdminDAO.class);
//		String resourcePath=session.getServletContext().getRealPath("/upload");
		String resourcePath = request.getSession().getServletContext().getRealPath("/")
					+ "resources/upload/";
//		------------------------------------------------------------------------------------------------------
//		String resourcePath="C:\\koreabox_workspace\\koreabox\\upload";
		System.out.println(resourcePath);
//		int maxSize = 10*1024*1024;
//		
//		try {
//			MultipartRequest multi = new MultipartRequest(request, resourcePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
//			String name = multi.getParameter("name");
//			File oriFile = multi.getFile("image");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		------------------------------------------------------------------------------------------------------
		
		HttpSession session= request.getSession();

		
		
		// MultipartRequest 객체 생성 준비
//		String saveDirectory = "C:\\koreabox_workspace\\koreabox\\src\\main\\webapp\\resources\\upload";   	// 파일 저장 경로
		int maxPostSize = 5 * 1024 * 1024;  // POST 받기, 최대 5M byte
		String encoding = "utf-8";  // response 인코딩
		FileRenamePolicy policy = new DefaultFileRenamePolicy(); //업로딩 파일 이름 중복에 대한 정책

		MultipartRequest multi = null; // com.oreilly.servlet.MultipartRequest 임포트
		
		try{ // 실제로 예외를 반드시 cath 할 필요는 없지만 처리
			multi = new MultipartRequest(
					request,
					resourcePath,
					maxPostSize,
					encoding,
					policy
					);
		System.out.println("사진------------------" + multi);
		} catch(Exception e){
			e.printStackTrace();	
		}
	
//		Enumeration names = null;
		
		// 1. Parameter name 들 추출
//		names = multi.getParameterNames(); // 일반 form 요소 name들 추출
//		while(names.hasMoreElements()){
//			String name = (String)names.nextElement();  // name
//			String value = multi.getParameter(name); // value
//		}
//		
//		// 2. File 들 추출
//		names = multi.getFileNames();   // type="file" 요소 name들 추출
//		String fileSystemName = null;
//		while(names.hasMoreElements()){
//			// <input type="file"> 의 name 가져오기
//			String name = (String)names.nextElement();  
//			fileSystemName = multi.getFilesystemName(name);
//			model.addAttribute("user_profileImage", fileSystemName);
//		} // end while
		


		
//		------------------------------------------------------------------------------------------------------
		
	}


}
