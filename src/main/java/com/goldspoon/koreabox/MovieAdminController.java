package com.goldspoon.koreabox;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.goldspoon.koreabox.movie.beans.MovieAdminDAO;
import com.goldspoon.koreabox.movie.beans.MovieAdminDTO;
import com.goldspoon.koreabox.movie.service.Common;
import com.goldspoon.koreabox.movie.service.AdminDeleteMovie;
import com.goldspoon.koreabox.movie.service.AdminListMovie;
import com.goldspoon.koreabox.movie.service.AdminReadMovie;
import com.goldspoon.koreabox.movie.service.Service;
import com.goldspoon.koreabox.movie.service.AdminUpdateMovie;
import com.goldspoon.koreabox.movie.service.AdminWriteMovie;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;

@Controller
@RequestMapping("/movieAdmin")
public class MovieAdminController {

   private Service service;

   @Autowired
   private HttpSession session;

   // MyBatis
   private SqlSession sqlSession;

   @Autowired
   public void setSqlSession(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
      Common.sqlSession = sqlSession;
   }

   @Autowired
   ServletContext servletContext;

   @RequestMapping(value = "/managementMovie")
   public void managementMovie(Model model) {
      service = new AdminListMovie();
      service.execute(model);

   }

   

   @RequestMapping("/writeMovie")
   public void writeMovie() {
   }

   @RequestMapping(value = "/writeMovieOk", method = RequestMethod.POST)
   public void writeMovieOk(MovieAdminDTO dto, Model model, HttpServletRequest request) {

//      String resourcePath="C:\\koreabox_workspace\\koreabox\\upload";
//      String resourcePath = servletContext.getRealPath("/resources")+"/upload";
//      String resourcePath = request.getSession().getServletContext().getRealPath("upload");
//      String resourcePath = "C:\\koreabox_workspace\\koreabox\\src\\main\\webapp\\resources\\upload";
//      String resourcePath = request.getSession().getServletContext().getRealPath("/resources/upload");
//      String resourcePath = servletContext.getRealPath("/resources/upload");
      String resourcePath = request.getSession().getServletContext().getRealPath("/")
    		  					+ "resources/upload/";
//      String resourcePath = getServletContext().getRealPath("upload");
      System.out.println(resourcePath);
      int maxPostSize = 5 * 1024 * 1024; // POST 받기, 최대 5M byte
      String encoding = "utf-8"; // response 인코딩
      FileRenamePolicy policy = new DefaultFileRenamePolicy(); // 업로딩 파일 이름 중복에 대한 정책

      MultipartRequest multi = null; // com.oreilly.servlet.MultipartRequest 임포트

      try {
         multi = new MultipartRequest(request, resourcePath, maxPostSize, encoding, policy);
      } catch (IOException e) {
         // TODO Auto-generated catch block
         e.printStackTrace();
      }

      Enumeration names = null;

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
         mov_title = multi.getParameter("mov_title");
         mov_director = multi.getParameter("mov_director");
         mov_actors = multi.getParameter("mov_actors");
         mov_genre = multi.getParameter("mov_genre");
         mov_runtime = Integer.parseInt(multi.getParameter("mov_runtime"));
         mov_openDate = multi.getParameter("mov_openDate");
         mov_grade = multi.getParameter("mov_grade");
         mov_intro = multi.getParameter("mov_intro");
         mov_poster = multi.getFilesystemName("mov_poster");
         mov_still1 = multi.getFilesystemName("mov_still1");
         mov_still2 = multi.getFilesystemName("mov_still2");
         mov_still3 = multi.getFilesystemName("mov_still3");

      } catch (Exception e) {
         model.addAttribute("error", 0);
      }

         // 1. Parameter name 들 추출
//      names = multi.getParameterNames(); // 일반 form 요소 name들 추출
//      while(names.hasMoreElements()){
//         String name = (String)names.nextElement();  // name
//         String value = multi.getParameter(name); // value
//      };

//      System.out.println("mov_title : " + mov_title);
      model.addAttribute("mov_title", mov_title);
      model.addAttribute("mov_director", mov_director);
      model.addAttribute("mov_actors", mov_actors);
      model.addAttribute("mov_genre", mov_genre);
      model.addAttribute("mov_runtime", mov_runtime);
      model.addAttribute("mov_openDate", mov_openDate);
      model.addAttribute("mov_grade", mov_grade);
      model.addAttribute("mov_intro", mov_intro);
      model.addAttribute("mov_poster", mov_poster);
      model.addAttribute("mov_still1", mov_still1);
      model.addAttribute("mov_still2", mov_still2);
      model.addAttribute("mov_still3", mov_still3);
//      new WriteMovie().upload(request);
      new AdminWriteMovie().execute(model);

   }

   @RequestMapping("/updateMovie")
   public void updateMovie(int mov_num, Model model) {
      String resourcePath = servletContext.getRealPath("/resources");
      model.addAttribute("resource", resourcePath);
      model.addAttribute("mov_num", mov_num);
      new AdminReadMovie().execute(model);
   }

   @RequestMapping("/updateMovieOk")
   public void updateMovieOk(MovieAdminDTO dto, Model model) {
      model.addAttribute("dto", dto);
      new AdminUpdateMovie().execute(model);
   }

   @RequestMapping("/deleteMovieOk")
   public void deleteMovieOk(int mov_num, Model model) {
      model.addAttribute("mov_num", mov_num);
      new AdminDeleteMovie().execute(model);
   }
}