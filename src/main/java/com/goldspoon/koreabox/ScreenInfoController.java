package com.goldspoon.koreabox;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.goldspoon.koreabox.screeninfo.ScreenInfoQuery;
import com.goldspoon.koreabox.screeninfo.command.ScreenInfoCommand;

@Controller
@RequestMapping("/screen")
public class ScreenInfoController {
   
   
   // MyBatis
   private SqlSession sqlSession;
   
   @Autowired
   public void setSqlSession(SqlSession sqlSession) {
      this.sqlSession = sqlSession;
      ScreenInfoQuery.sqlSession = sqlSession;
   }
   
   
   @RequestMapping("/screeninfo")
   public void screenInfo() {}
   
   
}
















