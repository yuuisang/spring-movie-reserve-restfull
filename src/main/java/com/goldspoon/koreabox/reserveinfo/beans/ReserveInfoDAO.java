package com.goldspoon.koreabox.reserveinfo.beans;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface ReserveInfoDAO {

	/**
	 * 	페이징용 SELECT
	 * @param from	: 몇번째 row 부터
	 * @param pageRows	: 몇개의 데이터(게시글)
	 * @return	: DTO 의 List
	 */
	public List<ReserveInfoDTO> selectFromRow(
			@Param("from") int from,
			@Param("pageRows") int pageRows
			);
	
	public int countAll();	// 목록에 보여줄 전체글 개수
	
//	public List<ReserveInfoDTO> selectReserve(int uid);	// 정보 읽어오기
	
	public int deleteReserve(int res_num);
	
}
