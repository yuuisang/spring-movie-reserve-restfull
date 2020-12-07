package com.goldspoon.koreabox.mypage.beans;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ResManageDTO {

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
	
	// 기본 생성자
	public ResManageDTO() {
		super();
	}

	// 매개변수 받는 생성자
	public ResManageDTO(int res_num, int res_movieNum, String res_movieName, int res_screenNum, String res_screenName,
			String res_date, int res_time, String res_seat, int res_totalPeople, int res_memberUid, String res_memberId,
			Timestamp res_paytime, int res_pay, String res_code) {
		super();
		this.res_num = res_num;
		this.res_movieNum = res_movieNum;
		this.res_movieName = res_movieName;
		this.res_screenNum = res_screenNum;
		this.res_screenName = res_screenName;
		this.res_date = res_date;
		this.res_time = res_time;
		this.res_seat = res_seat;
		this.res_totalPeople = res_totalPeople;
		this.res_memberUid = res_memberUid;
		this.res_memberId = res_memberId;
		this.res_paytime = res_paytime;
		this.res_pay = res_pay;
		this.res_code = res_code;
	}
	
	
}
