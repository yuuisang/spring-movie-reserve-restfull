package com.goldspoon.koreabox.reserveuser.beans;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface ReserveUserDAO {
	
	public List<ReserveUserDTO> tb_showinfo(int mov_num);
	
}
