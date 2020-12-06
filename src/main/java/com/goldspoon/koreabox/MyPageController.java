package com.goldspoon.koreabox;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.goldspoon.koreabox.mypage.MyPageQuery;


@Controller
@RequestMapping("/mypage")
public class MyPageController {
	
	
	// MyBatis
	private SqlSession sqlSession;
	
	@Autowired
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
		MyPageQuery.sqlSession = sqlSession;
	}
	
	
	@RequestMapping("/resManage")
	public void resManage() {}

	@RequestMapping("/userInfo")
	public void userInfo() {}
	
	
}

















