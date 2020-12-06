package com.goldspoon.koreabox.user.beans;

import org.apache.ibatis.annotations.Param;

public interface UserDAO {
	
	public int signUpInsert(UserDTO dto);
	public UserDTO login(@Param("id") String mem_id, @Param("pw") String mem_pw);
	public String idSearch(String mem_name, String mem_phone);
	public String pwSearch(String mem_id, String mem_name, String mem_email);
	public String idCheck(String mem_id);
	public String phoneCheck(String mem_phone);
	public String emailCheck(String mem_email);
}
