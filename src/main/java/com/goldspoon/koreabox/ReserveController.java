package com.goldspoon.koreabox;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

// 뷰페이지 설정

@Controller
@RequestMapping("/reserve")
public class ReserveController {

	//Mybatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@RequestMapping("/reserveinfo")
	public void reserveinfo() {}
	
	
	@RequestMapping("/reserveuser")
	public void reserveuser() {}
//		System.out.println("컨트롤러단 -- mov_num : " + mov_num);
//		model.addAttribute("mov_num", mov_num);
//		new ReserveUserListCommand().execute(model);
	
	
	@RequestMapping("/test")
	public void test() {}
	
}
