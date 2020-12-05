package com.goldspoon.koreabox.screeninfo.command;

import java.util.List;

import org.springframework.ui.Model;

import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;
import com.goldspoon.koreabox.screeninfo.beans.IAjaxDAO;
import com.goldspoon.koreabox.screeninfo.beans.ScreenInfoDTO;
import com.goldspoon.koreabox.screeninfo.beans.ShowInfoDTO;


public class ScreenInfoListCommand implements ScreenInfoCommand {

   @Override
   public void execute(Model model) {
      // MyBatis 사용
            IAjaxDAO dao = ScreenInfoQuery.sqlSession.getMapper(IAjaxDAO.class);
         
            List<ScreenInfoDTO> list = null;
            List<ShowInfoDTO> list2 = null;
            
            // 페이징 관련 세팅값
            int page = 1;  // 현재 페이지 (디폴트 1 page)
            int writePages = 10; // 한[페이징] 에 몇개의 '페이지' 표현 (디폴트 10)
            int pageRows = 8;  // 한 '페이지' 에 몇개의 글을 리스트 (디폴트 8)
            int totalPage = 0; // 총 몇 페이지 분량?
            int totalCnt = 0;  // 글은 총 몇개인가?
            
            
            page = (Integer)model.getAttribute("page");
            pageRows = (Integer)model.getAttribute("pageRows");
            
            
            
            // response 에 필요한 값들
            StringBuffer message = new StringBuffer();
            String status = "FAIL";
            
            try {
               // 글 전체 개수 구하기
               totalCnt = dao.countAll();
               
               // 총 몇페이지 분량?
               totalPage = (int)Math.ceil(totalCnt / (double)pageRows);
               
               // 몇번째 row 부터?
               int fromRow = (page - 1) * pageRows + 1;
               
               list = dao.selectFromRow(fromRow, pageRows);
               list2 = dao.selectAllShowInfo();
               
               if(list == null) {
                  message.append("[리스트할 데이터가 없습니다]");
               } else {
                  status = "OK";
               }
            } catch (Exception e) {
               e.printStackTrace();
               message.append("[트랜잭션 에러: " + e.getMessage() + "]");
            }
            
            model.addAttribute("status", status);
            model.addAttribute("message", message.toString());
            model.addAttribute("list", list);
            model.addAttribute("list2",list2);
            
            model.addAttribute("page", page);
            model.addAttribute("totalPage", totalPage);
            model.addAttribute("writePages", writePages);
            model.addAttribute("pageRows", pageRows);
            model.addAttribute("totalCnt", totalCnt);
   }

}











