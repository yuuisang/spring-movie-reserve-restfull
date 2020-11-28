package com.goldspoon.koreabox;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.goldspoon.koreabox.showinfo.ShowInfoQuery;

@Controller
@RequestMapping("/show")
public class ShowInfoController {
	
	
	// MyBatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		ShowInfoQuery.sqlSession = sqlSession;
	}
	
	
	@RequestMapping("/showinfo")
	public void screenInfo() {}
	
	
}

















