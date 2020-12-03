package com.goldspoon.koreabox.reserveuser.beans;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.goldspoon.koreabox.reserveinfo.beans.ReserveInfoDTO;

@MapperScan
public interface ReserveUserDAO {
	
	public List<ReserveUserDTO> tb_showinfo(int mov_num);
	
	public int reserveCntAll();	// reserve tb 에 있는 총 글의 갯수
	
	public int insert_tb_reserve(ReserveInfoDTO dto);
	
}
