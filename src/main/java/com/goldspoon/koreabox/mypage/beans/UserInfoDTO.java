package com.goldspoon.koreabox.mypage.beans;


import java.sql.Timestamp;

import lombok.Data;


@Data
public class UserInfoDTO {
	private int mem_uid;
	//회원 아이디
	private String mem_id; 
	// 회원 비밀번호 
	private String mem_pw;
	//회원 이름  
	private String mem_name;
	//회원 생년월일    
	private String mem_birth; 
	// 회원 전화번호 
	private String mem_phone;
	// 회원 이메일  
	private String mem_email;
	// 회원 등록일  
	private Timestamp mem_regDate;
	
}