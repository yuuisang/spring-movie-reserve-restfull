package com.goldspoon.koreabox;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.goldspoon.koreabox.mypage.beans.ResManageAjaxWriteList;
import com.goldspoon.koreabox.mypage.beans.ResManageAjaxWriteResult;
import com.goldspoon.koreabox.mypage.beans.ResManageDTO;
import com.goldspoon.koreabox.mypage.command.ResManageListCommand;
import com.goldspoon.koreabox.reserveinfo.beans.AjaxWriteResult;
import com.goldspoon.koreabox.reserveinfo.command.ReserveInfoDeleteCommand;

@RestController
@RequestMapping("/resManageajax")
public class ResManageAjaxController {

	@GetMapping("/{page}/{pageRows}/{res_memberUid}")
	public ResManageAjaxWriteList list(Model model, @PathVariable int page, @PathVariable int pageRows, @PathVariable int res_memberUid) {
		model.addAttribute("page", page);
		model.addAttribute("pageRows", pageRows);
		model.addAttribute("res_memberUid", res_memberUid);
		System.out.println(page);
		System.out.println(pageRows);
		System.out.println(res_memberUid);
		new ResManageListCommand().execute(model);
		return buildList(model);
	}
	
	@DeleteMapping("")
	public ResManageAjaxWriteResult deleteOk(int res_num, Model model) {
		model.addAttribute("res_num", res_num);
		System.out.println(res_num);
		new ResManageDeleteCommand().execute(model);
		return buildResult(model);
	}
	
	
	
	public ResManageAjaxWriteResult buildResult(Model model) {
		ResManageAjaxWriteResult result = new ResManageAjaxWriteResult();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		result.setCount((Integer)model.getAttribute("result"));
		
		return result;
	}
	
	
	@SuppressWarnings("unchecked")
	public ResManageAjaxWriteList buildList(Model model) {
		ResManageAjaxWriteList result = new ResManageAjaxWriteList();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		result.setRes_memberUid((Integer)model.getAttribute("res_memberUid"));
		
		List<ResManageDTO> list = (List<ResManageDTO>)model.getAttribute("list");
		result.setCount(list.size());
		result.setList(list);
		
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
