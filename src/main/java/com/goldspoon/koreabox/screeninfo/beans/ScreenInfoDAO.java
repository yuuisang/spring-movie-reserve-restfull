package com.goldspoon.koreabox.screeninfo.beans;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface ScreenInfoDAO {
	public List<ScreenInfoDTO> select();
	public int insert(ScreenInfoDTO dto);
	public int insert(String subject, String content, String name);
	//public List<BWriteDTO> readByUid(int uid);
	public List<ScreenInfoDTO> selectByUid(int uid);
	//public BWriteDTO selectByUid(int uid);  // 한개의 row만 리턴하는 경우는 이와 같이 가능
	//public int update(BWriteDTO dto);
	public int update(int uid, @Param("a") ScreenInfoDTO dto);
	
	public int deleteByUid(int uid);
	
	public int incViewCnt(int uid);  // 조회수 증가
	
	
	public ScreenInfoDTO searchBySubject(String subject);
}







