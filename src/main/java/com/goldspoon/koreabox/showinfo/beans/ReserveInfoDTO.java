package com.goldspoon.koreabox.showinfo.beans;

import java.sql.Timestamp;

import lombok.Data;


@Data
public class ReserveInfoDTO {
	
	private int res_num;	// 예약 고유번호
	private int res_movieNum;	// 영화 고유번호
	private String res_movieName;	// 영화제목
	private int res_screenNum;	// 상영관 고유번호
	private String res_screenName;	// 상영관 이름
	private String res_date;	// 영화상영 날짜
	private int res_time;	// 영화상영 시간
	private String res_seat;	// 예약 좌석 번호
	private int res_totalPeople;	// 한번에 예약한 총인원수
	private int res_memberUid;	// 회원 고유번호
	private String res_memberId;	// 회원 아이디
	private Timestamp res_paytime;	// 결제된 시간
	private int res_pay;	// 결제된 금액
	private String res_code;	// 예약 코드(예약번호)
	
}



















