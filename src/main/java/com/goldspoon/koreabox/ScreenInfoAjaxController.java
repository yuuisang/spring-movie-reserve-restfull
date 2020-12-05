package com.goldspoon.koreabox;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.goldspoon.koreabox.screeninfo.beans.AjaxWriteList;
import com.goldspoon.koreabox.screeninfo.beans.AjaxWriteResult;
import com.goldspoon.koreabox.screeninfo.beans.ScreenInfoDTO;
import com.goldspoon.koreabox.screeninfo.beans.ShowInfoDTO;
import com.goldspoon.koreabox.screeninfo.command.ScreenInfoDeleteCommand;
import com.goldspoon.koreabox.screeninfo.command.ScreenInfoListCommand;
import com.goldspoon.koreabox.screeninfo.command.ScreenInfoRegistCommand;

@RestController
@RequestMapping("/screen")
public class ScreenInfoAjaxController {
   
   //@RequestMapping("/{page}/{pageRows}")  //   /screen/{page}/{pageRows}
   @GetMapping("/{page}/{pageRows}")
   public AjaxWriteList list(Model model, 
         @PathVariable int page, 
         @PathVariable int pageRows) {
      model.addAttribute("page", page);
      model.addAttribute("pageRows", pageRows);
      new ScreenInfoListCommand().execute(model);
      return buildList(model);
   }
   
   //@RequestMapping(value = "/board/writeOk.ajax", method=RequestMethod.POST)
   @PostMapping("")   
   public AjaxWriteResult registOk(ScreenInfoDTO dto, Model model) {
      System.out.println("dto: " + dto + " / model : " + model);
      model.addAttribute("dto", dto);
      new ScreenInfoRegistCommand().execute(model);
      System.out.println(model.getAttribute("status"));
      return buildResult(model);
   }
   
   
   //@RequestMapping(value = "/board/deleteOk.ajax",   method = RequestMethod.DELETE)
   @DeleteMapping("")   
   public AjaxWriteResult deleteOk(int scr_num, Model model) {
      model.addAttribute("scr_num", scr_num);
      new ScreenInfoDeleteCommand().execute(model);
      return buildResult(model);
   }
   
   
   
   
   public AjaxWriteResult buildResult(Model model) {
      AjaxWriteResult result = new AjaxWriteResult();
      
      result.setStatus((String) model.getAttribute("status"));
      result.setMessage((String)model.getAttribute("message"));
      result.setCount((Integer)model.getAttribute("result"));
      
      return result;
   }
   
   
   @SuppressWarnings("unchecked")
   public AjaxWriteList buildList(Model model) {
      AjaxWriteList result = new AjaxWriteList();
      
      result.setStatus((String)model.getAttribute("status"));
      result.setMessage((String)model.getAttribute("message"));
      
      List<ScreenInfoDTO> list = (List<ScreenInfoDTO>)model.getAttribute("list");
      List<ShowInfoDTO> list2 = (List<ShowInfoDTO>) model.getAttribute("list2");
      result.setCount(list.size());
      result.setList(list);
      result.setList2(list2);
      
      // 페이징 할때만 필요한 것들
      try {
         result.setPage((Integer)model.getAttribute("page"));
         result.setTotalPage((Integer)model.getAttribute("totalPage"));
         result.setWritePages((Integer)model.getAttribute("writePages"));
         result.setPageRows((Integer)model.getAttribute("pageRows"));
         result.setTotalCnt((Integer)model.getAttribute("totalCnt"));         
      } catch(Exception e) {
         
      }
      
      return result;
   }

}












