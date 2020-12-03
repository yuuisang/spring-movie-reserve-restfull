package com.goldspoon.koreabox.showinfo.beans;

import lombok.Data;


@Data
public class ScreenInfoDTO {
	// 상영관 고유번호
	private int scr_num;
	
	// 상영관 이름
	private String scr_name;
	
	// 상영관 남은 좌석 row
	private int scr_seatRow;
	
	// 상영관 남은 좌석 Line
	private int scr_seatLine;
	
}



















