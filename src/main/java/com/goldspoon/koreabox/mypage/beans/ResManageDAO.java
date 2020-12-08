package com.goldspoon.koreabox.mypage.beans;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;


@MapperScan
public interface ResManageDAO {
	
	public List<ResManageDTO> selectFromRow(
			@Param("from") int from,
			@Param("pageRows") int pageRows,
			@Param("res_memberUid") int res_memberUid
			);
	
	public int countAll(int res_memberUid);	// 목록에 보여줄 전체글 개수
	
	//public int countAll(@Param("res_memberUid") int res_memberUid);	// 목록에 보여줄 전체글 개수
	
	public int deleteReserve_user(int res_num);
	
}
