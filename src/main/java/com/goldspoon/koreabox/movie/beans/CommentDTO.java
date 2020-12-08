package com.goldspoon.koreabox.movie.beans;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentDTO {
	private int cmt_num;
	private int cmt_star;
	private String cmt_content;
	private Date cmt_regDate;
	private int cmt_movieNum;
	private String cmt_movieName;
	private int cmt_memberUid;
	private String cmt_memberId;
}
