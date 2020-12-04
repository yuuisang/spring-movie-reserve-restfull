package com.goldspoon.koreabox.screeninfo.beans;


import java.sql.Timestamp;

import lombok.Data;


@Data
public class ShowInfoDTO {
	// 상영 고유번호
		private int shw_num;
		// 상영관리 해당 영화 고유번호
		private int shw_movieNum;  
		// 상영 영화 제목
		private String shw_movieName;
		// 상영관리 해당상영관 고유번호
		private int shw_screenNum;
		// 상영관 명
		private String shw_screenName;
		// 상영 일자
		private String shw_date;
		// 상영 시간
		private int shw_time;
		// 남은 좌석수
		private int shw_seatCnt;
		// 상영관의 좌석 행
		private int shw_seatRow;
		// 상영관의 좌석 열
		private int shw_seatLine;
		// 상영 등록일(default : sysdate)
		private Timestamp shw_regDate;
		// 상영 만료 플래그(1이면 상영만료)
		private int shw_expireFlag;
		 

}