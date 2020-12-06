package com.goldspoon.koreabox.mypage.beans;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface IAjaxDAO {
   
	// 기존값 조회
	public List<UserInfoDTO> selectByNum(@Param("uid") int uid);
	
   	// 개인정보 수정
	public int updateOk(UserInfoDTO dto);
	
	// 회원탈퇴
	public int deleteByNum(UserInfoDTO dto);
   
	// 회원탈퇴시 예약삭제
	public int deleteResByNum(UserInfoDTO dto);
	
	// 회원탈퇴시 댓글삭제
	public int deleteCommByNum(UserInfoDTO dto);
}
