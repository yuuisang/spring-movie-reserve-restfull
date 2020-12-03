package com.goldspoon.koreabox.reserveuser.beans;

import java.util.ArrayList;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class ReserveUserAjaxWriteList extends ReserveUserAjaxWriteResult {

	@JsonProperty("data")
	List<ReserveUserDTO> list;	// 데이터 목록
	
	int mov_num;  // 선택한 영화 #
	
	ArrayList<String> chk_date;	// 중복제거된 date
	
	int reserveCntAll;	// tb_reserve의 총 개수
	
	String hour;
	
	String todaydate;

}
