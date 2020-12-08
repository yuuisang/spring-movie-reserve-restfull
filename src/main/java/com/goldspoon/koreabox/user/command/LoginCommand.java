package com.goldspoon.koreabox.user.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.movie.service.Common;
import com.goldspoon.koreabox.user.beans.UserDAO;
import com.goldspoon.koreabox.user.beans.UserDTO;

public class LoginCommand implements Command{

   @Override
   public void execute(Model model) {

      
   }
   
   public void loginSession(HttpServletRequest request, Model model) {
      String mem_id = (String)model.getAttribute("mem_id");
      String mem_pw = (String)model.getAttribute("mem_pw");
      UserDTO loginDto = null;
      UserDAO dao = Common.sqlSession.getMapper(UserDAO.class);
      int error = 0;
      
      
      HttpSession session = request.getSession();
       
       
      int result = 0;
      
      try {
         if(mem_id != null && mem_pw != null && mem_id.trim().length()>0 && mem_pw.trim().length()>0) {
         if(mem_id.equals("admin")&&mem_pw.equals("1234")) {
            loginDto = dao.login(mem_id, mem_pw);
            System.out.println("loginDTO : " + loginDto.toString());
            result = 2;
            session.setAttribute("mem_uid", 0);
            session.setAttribute("mem_id", "admin");
            model.addAttribute("mem_uid", loginDto.getMem_uid());
            model.addAttribute("mem_id", loginDto.getMem_id());
            model.addAttribute("result", result);
         }else {
            loginDto = dao.login(mem_id, mem_pw);
            System.out.println("loginDTO : " + loginDto.toString());
            result = 1;
            session.setAttribute("mem_uid", loginDto.getMem_uid());
            session.setAttribute("mem_id", loginDto.getMem_id());
            System.out.println(session.getAttribute("mem_id"));
            System.out.println(session.getAttribute("mem_uid"));
            model.addAttribute("mem_uid", loginDto.getMem_uid());
            model.addAttribute("mem_id", loginDto.getMem_id());
            model.addAttribute("result", result);
         }
         }else if(mem_id == null && mem_id.trim().length()==0){
            error = 1;   // 아이디를 입력 안했을 때
            model.addAttribute("error", error);
         }else if(mem_pw != null && mem_pw.trim().length()>0) {
            error = 2;   // 비밀번호를 입력 안했을 때
            model.addAttribute("error", error);
         }
      } catch (Exception e) {
         result = 0;
         model.addAttribute("result", result);
      }
      

   }

}