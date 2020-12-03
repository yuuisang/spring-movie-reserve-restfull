package com.goldspoon.koreabox.reserveuser.beans;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;


@Getter
@Setter
public class ReserveUserDTO {
	
	private int shw_num;
	private int shw_movieNum;
	private String shw_movieName;
	private int shw_screenNum;
	private String shw_screenName;
	private String shw_date;
	private int shw_time;
	private int shw_seatCnt;
	private int shw_seatRow;
	private int shw_seatLine;
	private int shw_expireFlag;
	
	public ReserveUserDTO() {
		super();
	}

	public ReserveUserDTO(int shw_num, int shw_movieNum, String shw_movieName, int shw_screenNum, String shw_screenName,
			String shw_date, int shw_time, int shw_seatCnt, int shw_seatRow, int shw_seatLine, int shw_expireFlag) {
		super();
		this.shw_num = shw_num;
		this.shw_movieNum = shw_movieNum;
		this.shw_movieName = shw_movieName;
		this.shw_screenNum = shw_screenNum;
		this.shw_screenName = shw_screenName;
		this.shw_date = shw_date;
		this.shw_time = shw_time;
		this.shw_seatCnt = shw_seatCnt;
		this.shw_seatRow = shw_seatRow;
		this.shw_seatLine = shw_seatLine;
		this.shw_expireFlag = shw_expireFlag;
	}


	
	
	
}
