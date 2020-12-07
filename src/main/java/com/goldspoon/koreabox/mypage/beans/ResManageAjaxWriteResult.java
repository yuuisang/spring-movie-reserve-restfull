package com.goldspoon.koreabox.mypage.beans;

import lombok.Data;

@Data
public class ResManageAjaxWriteResult {
	
	int count;	// 카운터 개수
	String status;	// 처리결과(성공 실패)
	String message; 	// 결과 메세지
	
}
