package com.goldspoon.koreabox.mypage.command;

import java.util.List;


import org.springframework.ui.Model;

import com.goldspoon.koreabox.mypage.MyPageQuery;
import com.goldspoon.koreabox.mypage.beans.ResManageDAO;
import com.goldspoon.koreabox.mypage.beans.ResManageDTO;

public class ResManageListCommand implements UserInfoCommand {

	
	@Override
	public void execute(Model model) {
		
		
		ResManageDAO dao = MyPageQuery.sqlSession.getMapper(ResManageDAO.class);
		
		List<ResManageDTO> list = null;
		
		int page = 1;
		int writePages = 10;
		int pageRows = 8;
		int totalPage = 0;
		int totalCnt = 0;
		int res_memberUid = 0;
		
		
		page = (Integer)model.getAttribute("page");
		System.out.println(page);
		pageRows = (Integer)model.getAttribute("pageRows");
		System.out.println(pageRows);
		res_memberUid = (Integer)model.getAttribute("res_memberUid");
		System.out.println(res_memberUid);

		
		StringBuffer message = new StringBuffer();
		String status = "FAIL";
		
		try {
			// 예약 전체 개수
			totalCnt = dao.countAll(res_memberUid);
			
			// 총 몇페이지 분량?
			totalPage = (int)Math.ceil(totalCnt / (double)pageRows);
			
			// 몇번째 row 부터?
			int fromRow = (page - 1) * pageRows + 1;
			
			list = dao.selectFromRow(fromRow, pageRows, res_memberUid);
			
			if(list == null) {
				message.append("[리스트할 데이터가 없습니다]");
			} else {
				status = "OK";
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			message.append("[트랜잭션 에러: " + e.getMessage() + "]");
		}
		
		model.addAttribute("status", status);
		model.addAttribute("message", message.toString());
		model.addAttribute("list", list);
		
		model.addAttribute("page", page);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("writePages", writePages);
		model.addAttribute("pageRows", pageRows);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("res_memberUid", res_memberUid);

	}

}
