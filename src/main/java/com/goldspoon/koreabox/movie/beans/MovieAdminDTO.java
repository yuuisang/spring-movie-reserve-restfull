package com.goldspoon.koreabox.movie.beans;

import java.sql.Date;

import lombok.Data;

@Data
public class MovieAdminDTO {
	
	private int mov_num;
	private String mov_title;
	private String mov_director;
	private String mov_actors;
	private String mov_genre;
	private int mov_runtime;
	private String mov_openDate;
	private String mov_grade;
	private String mov_intro;
	private int mov_totalStar;
	private int mov_countStar;
	private int mov_showFlag;
	private Date mov_regDate;
	private String mov_poster;
	private String mov_still1;
	private String mov_still2;
	private String mov_still3;

	 
	 
}
