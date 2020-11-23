package com.goldspoon.koreabox;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;
import com.goldspoon.koreabox.screeninfo.beans.ScreenInfoDTO;
import com.goldspoon.koreabox.screeninfo.command.ScreenInfoCommand;
import com.goldspoon.koreabox.screeninfo.command.ScreenInfoDeleteCommand;
import com.goldspoon.koreabox.screeninfo.command.ScreenInfoListCommand;
import com.goldspoon.koreabox.screeninfo.command.ScreenInfoSelectCommand;
import com.goldspoon.koreabox.screeninfo.command.ScreenInfoUpdateCommand;
import com.goldspoon.koreabox.screeninfo.command.ScreenInfoViewCommand;
import com.goldspoon.koreabox.screeninfo.command.ScreenInfoWriteCommand;

@Controller
@RequestMapping("/board")
public class ScreenInfoController {
	
	private ScreenInfoCommand command;
	
	// MyBatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		ScreenInfoQuery.sqlSession = sqlSession;
	}

	@RequestMapping("/list.do")
	public String list(Model model) {
		command = new ScreenInfoListCommand();
		command.execute(model);		
		return "board/list";
	}
	
	@RequestMapping("/write.do")
	public String write(Model model){
		return "board/write";
	}
	
	@RequestMapping(value="/writeOk.do", method = RequestMethod.POST)
	public String writeOk(ScreenInfoDTO dto, Model model) {
		model.addAttribute("dto", dto);
		new ScreenInfoWriteCommand().execute(model);
		return "board/writeOk";
	}
	
	@RequestMapping("/view.do")
	public String view(int uid, Model model) {
		model.addAttribute("uid", uid);
		new ScreenInfoViewCommand().execute(model);
		return "board/view";
	}
	
	@RequestMapping("/update.do")
	public String update(int uid, Model model) {
		model.addAttribute("uid", uid);
		new ScreenInfoSelectCommand().execute(model);		
		return "board/update";
	}
	
	@RequestMapping(value="/updateOk.do", method= RequestMethod.POST)
	public String updateOk(ScreenInfoDTO dto, Model model) {
		model.addAttribute("dto", dto);
		
		new ScreenInfoUpdateCommand().execute(model);
		
		return "board/updateOk";
	}
	
	@RequestMapping(value="/deleteOk.do")
	public String deleteOk(int uid, Model model) {
		model.addAttribute("uid", uid);
		new ScreenInfoDeleteCommand().execute(model);
		return "board/deleteOk";
	}
	
	
}

















