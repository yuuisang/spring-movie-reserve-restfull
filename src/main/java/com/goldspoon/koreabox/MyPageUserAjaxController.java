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

import com.goldspoon.koreabox.mypage.beans.AjaxWriteList;
import com.goldspoon.koreabox.mypage.beans.AjaxWriteResult;
import com.goldspoon.koreabox.mypage.beans.UserInfoDTO;
import com.goldspoon.koreabox.mypage.command.UserInfoDeleteCommand;
import com.goldspoon.koreabox.mypage.command.UserInfoListCommand;
import com.goldspoon.koreabox.mypage.command.UserInfoUpdateCommand;


@RestController
@RequestMapping("/mypage")
public class MyPageUserAjaxController {
	
	//@RequestMapping("/{uid}")  
	@GetMapping("/{uid}")
	public AjaxWriteList view(Model model, 
			@PathVariable int uid) {
		System.out.println("컨트롤러 uid : " + uid);
		model.addAttribute("uid", uid);
		new UserInfoListCommand().execute(model);
		return buildListNoPaging(model);
	}
	
	
	@PutMapping("")   
	public AjaxWriteResult updateOk(UserInfoDTO dto, Model model) {
		System.out.println("dto: " + dto);
		model.addAttribute("dto", dto);
		new UserInfoUpdateCommand().execute(model);
		return buildResult(model);
	}
	
	
	
	@DeleteMapping("")	
	public AjaxWriteResult deleteOk(UserInfoDTO dto, Model model) {
		model.addAttribute("dto", dto);
		new UserInfoDeleteCommand().execute(model);
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
	public AjaxWriteList buildListNoPaging(Model model) {
		AjaxWriteList result = new AjaxWriteList();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		List<UserInfoDTO> list = (List<UserInfoDTO>)model.getAttribute("list");	
		
		result.setList(list);
		
		return result;
	}
	
}













