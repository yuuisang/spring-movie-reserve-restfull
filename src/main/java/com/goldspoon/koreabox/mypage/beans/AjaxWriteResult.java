package com.goldspoon.koreabox.mypage.beans;

import lombok.Data;

@Data
public class AjaxWriteResult {
	int count;  //  데이터 개수
	String status;  // 처리 결과
	String message;  // 결과 메세지
	
}
