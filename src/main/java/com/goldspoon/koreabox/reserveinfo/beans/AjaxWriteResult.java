package com.goldspoon.koreabox.reserveinfo.beans;

import lombok.Data;

@Data
public class AjaxWriteResult {
	int count;	// 카운터 개수
	String status;	// 처리결과(성공 실패)
	String message; 	// 결과 메세지
}
