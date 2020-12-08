package com.goldspoon.koreabox.user.beans;

import java.sql.Date;

import lombok.Data;

@Data
public class UserDTO {
	private int mem_uid;
	private String mem_id;
	private String mem_pw;
	private String mem_name;
	private String mem_birth;
	private String mem_phone;
	private String mem_email;
	private Date mem_regDate;
}
