package com.goldspoon.koreabox.mypage.command;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;

import com.goldspoon.koreabox.mypage.MyPageQuery;
import com.goldspoon.koreabox.mypage.beans.IAjaxDAO;
import com.goldspoon.koreabox.mypage.beans.UserInfoDTO;

public class UserInfoListCommand implements UserInfoCommand {

	@Override
	public void execute(Model model) {
		// MyBatis 사용
		IAjaxDAO dao = MyPageQuery.sqlSession.getMapper(IAjaxDAO.class);

		int uid = (int) model.getAttribute("uid");

		List<UserInfoDTO> list = null;

		// response 에 필요한 값들
		StringBuffer message = new StringBuffer();
		String status = "FAIL";

		try {
			list = dao.selectByNum(uid);

			if (list == null) {
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

	}

}
