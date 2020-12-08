package com.goldspoon.koreabox.movie.service;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.beans.CommentDTO;
import com.goldspoon.koreabox.movie.beans.MovieUserDAO;

public class CommentWriteMovie implements Service{

   @Override
   public void execute(Model model) {
      CommentDTO dto = (CommentDTO)model.getAttribute("dto");
      int cmt_movieNum = (Integer)model.getAttribute("cmt_movieNum");
      MovieUserDAO dao = Common.sqlSession.getMapper(MovieUserDAO.class);
      Integer userChk = dao.commentUserChk(cmt_movieNum, dto.getCmt_memberUid());
      
      int error = 0;
      System.out.println("star : " + dto.getCmt_star());
      System.out.println("content : " + dto.getCmt_content().toString());
      
      if(dto.getCmt_star()==0) {
         error = 1;
         model.addAttribute("error", error);                  
      } else if(dto.getCmt_content().equals("")) {
         error = 2;
         model.addAttribute("error", error);
      } else if(dto.getCmt_memberId().equals("")) {
         error = 3;
         model.addAttribute("error", error);
      } else if(userChk != null) {
         error = 4;
         model.addAttribute("error", error);
      }
      else {
         model.addAttribute("result", dao.commentWrite(dto));
         model.addAttribute("starUpdate", dao.starRatingUpdate(dto));
         model.addAttribute("starCnt", dao.starRatingCnt(dto.getCmt_movieNum()));
         model.addAttribute("cmt_movieNum", cmt_movieNum);
         model.addAttribute("error", error);
      
      }
      
   }

}