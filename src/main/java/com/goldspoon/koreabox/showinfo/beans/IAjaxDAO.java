package com.goldspoon.koreabox.showinfo.beans;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.goldspoon.koreabox.movie.beans.MovieAdminDTO;
import com.goldspoon.koreabox.showinfo.beans.ShowInfoDTO;

@MapperScan
public interface IAjaxDAO {
	
	/**
	 * 페이징용 SELECT
	 * @param from : 몇번째 row 부터
	 * @param pageRows : 몇개의 데이터(게시글)
	 * @return  DTO 의 List
	 */
	public List<ShowInfoDTO> selectFromRow(
			@Param("from") int from,
			@Param("pageRows") int pageRows
			);
	
	
	// 상영관리 테이블 칼럼조회(전체 shw_num)
	public List<ShowInfoDTO> selectAllInfo();
	
	// 전체 상영스케쥴 개수
	public int countAll();
	
	
	// 상영스케쥴 등록
	public int insert(
		 int shw_movieNum,  
		 String shw_movieName,
		 int shw_screenNum,
		 String shw_screenName,
		 String shw_date,
		 int shw_time,
		 int shw_seatCnt,
		 int shw_seatRow,
		 int shw_seatLine,
		 int shw_expireFlag
		);
	
	// 스케줄 수정
	public int updateOk(ShowInfoDTO dto);
	
	// 특정 uid 상영스케쥴 삭제 하기
	public int deleteByNum(ShowInfoDTO dto);
	
	// scr_name get
	public List<ScreenInfoDTO> selectAllScreenInfo();
	
	// mov_title get
	public List<MovieInfoDTO> selectAllMovieNumTitle();
	
	// res info get
	public List<ReserveInfoDTO> selectAllReserveInfo();

}



















