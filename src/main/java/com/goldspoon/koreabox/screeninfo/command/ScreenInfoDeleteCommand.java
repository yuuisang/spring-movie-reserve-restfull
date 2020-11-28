package com.goldspoon.koreabox.screeninfo.command;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;
import com.goldspoon.koreabox.screeninfo.beans.IAjaxDAO;

public class ScreenInfoDeleteCommand implements ScreenInfoCommand {

   @Override
   public void execute(Model model) {
      int cnt = 0;
      IAjaxDAO dao = ScreenInfoQuery.sqlSession.getMapper(IAjaxDAO.class);
      
      int scr_num = (int)model.getAttribute("scr_num");
   
      StringBuffer message = new StringBuffer();
      String status = "FAIL";
      
      try {      
         cnt = dao.deleteByNum(scr_num);
         status = "OK";
         
         // cnt 가 0 이면 Arithmetic 에러 catchㄱㄱ
         int chkResult = 1 / cnt;
      } catch(Exception e) {
         e.printStackTrace();
         message.append("[에러: " + e.getMessage() + "]");
      }
      
      model.addAttribute("status", status);
      model.addAttribute("message", message.toString());
      model.addAttribute("result", cnt);
      
   }

}















