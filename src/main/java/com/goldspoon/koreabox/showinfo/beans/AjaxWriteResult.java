package com.goldspoon.koreabox.showinfo.beans;

import lombok.Data;

@Data
public class AjaxWriteResult {
	int count;  //  데이터 개수
	String status;  // 처리 결과
	String message;  // 결과 메세지
	
	int shw_num;	// shw_num 값 체크필요
}
