package com.goldspoon.koreabox.user.beans;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface AdminUserDAO {
	
//	public List<AdminUserDTO> userList(
//			@Param("from") int from	//Param = xml 파일의 파라미터값명
//			);
	public List<AdminUserDTO> userList();
	public int userDelete(int mem_uid);
	public AdminUserDTO memberRead(int mem_uid);
	public int userUpdate(AdminUserDTO dto);
	
	public List<Integer> commentList();
	public List<Integer> reserveList();
	
	public int commentUpdate(int mem_uid, String mem_id);
	public int reserveUpdate(int mem_uid, String mem_id);
	
	public List<Integer> commentNumSearch(int mem_uid);
	public int movieNumSearch(int cmt_num);
	public int starRatingSearch(int mem_uid, int cmt_num);
	
	public int commentDelete(int mem_uid);
	public int starRatingDelete(int mov_num, int cmt_star);
	public int starCntDelete(int mov_num);
	
	public String idCheck(String mem_id);
	public String phoneCheck(String mem_phone);
	public String emailCheck(String mem_email);
}
