package com.goldspoon.koreabox.movie.beans;

import java.sql.Date;

import lombok.Data;

@Data
public class ShowInfoDTO {
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
	private Date shw_regDate;
	private int shw_expireFlag;
}
