package com.goldspoon.koreabox;

import java.util.ArrayList;
import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.goldspoon.koreabox.reserveinfo.beans.AjaxWriteList;
import com.goldspoon.koreabox.reserveinfo.beans.AjaxWriteResult;
import com.goldspoon.koreabox.reserveinfo.beans.ReserveInfoDTO;
import com.goldspoon.koreabox.reserveuser.beans.ReserveUserAjaxWriteList;
import com.goldspoon.koreabox.reserveuser.beans.ReserveUserAjaxWriteResult;
import com.goldspoon.koreabox.reserveuser.beans.ReserveUserDTO;
import com.goldspoon.koreabox.reserveuser.command.ReserveUserListCommand;
import com.goldspoon.koreabox.reserveuser.command.ReserveUserReserveCommand;

@RestController
@RequestMapping("/reserveuser")
public class ReserveUserAjaxController {
	
	@GetMapping("/{mov_num}")
	public ReserveUserAjaxWriteList list(Model model, @PathVariable int mov_num) {
		System.out.println("들오옴?" + mov_num);
		model.addAttribute("mov_num", mov_num);
		new ReserveUserListCommand().execute(model);
		return buildList(model);
	}
	
	@PostMapping("")	//reserveuser
	public ReserveUserAjaxWriteResult reserveOk(ReserveInfoDTO dto, Model model) {
		model.addAttribute("dto", dto);
		new ReserveUserReserveCommand().execute(model);
		return buildResult(model);
	}
	
	
	
	
	public ReserveUserAjaxWriteResult buildResult(Model model) {
		ReserveUserAjaxWriteResult result = new ReserveUserAjaxWriteResult();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		result.setCount((Integer)model.getAttribute("result"));
		
		return result;
	}
	
	@SuppressWarnings("unchecked")
	public ReserveUserAjaxWriteList buildList(Model model) {
		ReserveUserAjaxWriteList result = new ReserveUserAjaxWriteList();
		
		result.setStatus((String)model.getAttribute("status"));
		result.setMessage((String)model.getAttribute("message"));
		
		List<ReserveUserDTO> list = (List<ReserveUserDTO>)model.getAttribute("list");
		ArrayList<String> chk_date = (ArrayList<String>) model.getAttribute("date");
		int reserveCntAll = (int) model.getAttribute("reserveCntAll");
		int mov_num = (int) model.getAttribute("mov_num");
		String hour = (String) model.getAttribute("hour");
		String todaydate = (String) model.getAttribute("todaydate");
		result.setCount(list.size());
		result.setList(list);
		result.setReserveCntAll(reserveCntAll);
		result.setChk_date(chk_date);
		result.setMov_num(mov_num);
		result.setHour(hour);
		result.setTodaydate(todaydate);
		return result;
	}
	
}








