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

import com.goldspoon.koreabox.showinfo.beans.AjaxWriteList;
import com.goldspoon.koreabox.showinfo.beans.AjaxWriteResult;
import com.goldspoon.koreabox.showinfo.beans.MovieInfoDTO;
import com.goldspoon.koreabox.showinfo.beans.ReserveInfoDTO;
import com.goldspoon.koreabox.showinfo.beans.ScreenInfoDTO;
import com.goldspoon.koreabox.showinfo.beans.ShowInfoDTO;
import com.goldspoon.koreabox.showinfo.command.ShowInfoDeleteCommand;
import com.goldspoon.koreabox.showinfo.command.ShowInfoListCommand;
import com.goldspoon.koreabox.showinfo.command.ShowInfoRegistCommand;
import com.goldspoon.koreabox.showinfo.command.ShowInfoUpdateCommand;
import com.goldspoon.koreabox.showinfo.command.ShowInfoViewDefCommand;

@RestController
@RequestMapping("/show")
public class ShowInfoAjaxController {
	
	//@RequestMapping("/{page}/{pageRows}")  //   /show/{page}/{pageRows}
	@GetMapping("/{page}/{pageRows}")
	public AjaxWriteList list(Model model, 
			@PathVariable int page, 
			@PathVariable int pageRows) {
		model.addAttribute("page", page);
		model.addAttribute("pageRows", pageRows);
		new ShowInfoListCommand().execute(model);
		return buildList(model);
	}
	
	/*
	//@RequestMapping("/{uid}")  // /board/{uid}
	@GetMapping("/{uid}")
	public AjaxWriteList view(Model model, 
			@PathVariable int uid) {
		model.addAttribute("uid", uid);
		new ShowInfoViewCommand().execute(model);
		return buildListNoPaging(model);
	}
	*/
	
	//@RequestMapping("")
	@GetMapping("")
	public AjaxWriteList viewDefault(Model model) {
		new ShowInfoViewDefCommand().execute(model);
		return buildListNoPaging(model);
	}
	
	
	//
	@PostMapping("")   
	public AjaxWriteResult registOk(ShowInfoDTO dto, Model model) {
		System.out.println("컨트롤러dto: " + dto + "\n컨트롤러model : " + model +"\n");
		model.addAttribute("dto", dto);
		new ShowInfoRegistCommand().execute(model);
		return buildResult(model);
	}
	//
	@PutMapping("")   
	public AjaxWriteResult updateOk(ShowInfoDTO dto, Model model) {
		System.out.println("dto: " + dto + " \nmodel : " + model + "\n");
		model.addAttribute("dto", dto);
		new ShowInfoUpdateCommand().execute(model);
		return buildResult(model);
	}
	
	
	//
	@DeleteMapping("")	
	public AjaxWriteResult deleteOk(ShowInfoDTO dto, Model model) {
		model.addAttribute("dto", dto);
		new ShowInfoDeleteCommand().execute(model);
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
		
		List<ShowInfoDTO> list = (List<ShowInfoDTO>)model.getAttribute("list");
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
	
	
	@SuppressWarnings("unchecked")
	public AjaxWriteList buildListNoPaging(Model model) {
		AjaxWriteList result = new AjaxWriteList();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		List<ShowInfoDTO> list = (List<ShowInfoDTO>)model.getAttribute("list");
		List<ScreenInfoDTO> scr_shwInfo = (List<ScreenInfoDTO>)model.getAttribute("scr_shwInfo");
		List<MovieInfoDTO> mov_numTitle = (List<MovieInfoDTO>)model.getAttribute("mov_numTitle");
		List<ReserveInfoDTO> res_shwInfo = (List<ReserveInfoDTO>)model.getAttribute("res_shwInfo");
		
		
		result.setCount(list.size());
		result.setList(list);
		result.setScr_shwInfo(scr_shwInfo);
		result.setMov_numTitle(mov_numTitle);
		result.setRes_shwInfo(res_shwInfo);
		
		return result;
	}
	
}













