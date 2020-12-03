package com.goldspoon.koreabox;


import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.goldspoon.koreabox.reserveinfo.beans.AjaxWriteList;
import com.goldspoon.koreabox.reserveinfo.beans.AjaxWriteResult;
import com.goldspoon.koreabox.reserveinfo.beans.ReserveInfoDTO;
import com.goldspoon.koreabox.reserveinfo.command.ReserveInfoDeleteCommand;
import com.goldspoon.koreabox.reserveinfo.command.ReserveInfoListCommand;

@RestController
@RequestMapping("/reserveinfo")
public class ReserveAjaxController {

	@GetMapping("/{page}/{pageRows}")
	public AjaxWriteList list(Model model, @PathVariable int page, @PathVariable int pageRows) {
		model.addAttribute("page", page);
		model.addAttribute("pageRows", pageRows);
		new ReserveInfoListCommand().execute(model);
		return buildList(model);
	}
	
	@DeleteMapping("")
	public AjaxWriteResult deleteOk(int res_num, Model model) {
		model.addAttribute("res_num", res_num);
		System.out.println(res_num);
		new ReserveInfoDeleteCommand().execute(model);
		return buildResult(model);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	public AjaxWriteResult buildResult(Model model) {
		AjaxWriteResult result = new AjaxWriteResult();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		result.setCount((Integer)model.getAttribute("result"));
		
		return result;
	}
	
	
	@SuppressWarnings("unchecked")
	public AjaxWriteList buildList(Model model) {
		AjaxWriteList result = new AjaxWriteList();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		List<ReserveInfoDTO> list = (List<ReserveInfoDTO>)model.getAttribute("list");
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



