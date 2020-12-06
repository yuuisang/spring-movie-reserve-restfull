package com.goldspoon.koreabox.movie.beans;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;


@MapperScan
public interface MovieAdminDAO {
	public List<MovieAdminDTO> select();
	public MovieAdminDTO read(int mov_num);
//	public int insert(MovieDTO dto);
	public int insert(
			String mov_title,
			String mov_director,
			String mov_actors,
			String mov_genre,
			int mov_runtime,
			String mov_openDate,
			String mov_grade,
			String mov_intro,
			String mov_poster,
			String mov_still1,
			String mov_still2,
			String mov_still3
			);
	
	public int updateShowInfo(int mov_num, String mov_title);
	public int updateReserve(int mov_num, String mov_title);
	public List<Integer> showInfoList();
	public List<Integer> reserveList();
	
	public int update(@Param("updateDto") MovieAdminDTO dto, int mov_num, @Param("poster") String mov_poster, @Param("still1") String mov_still1, @Param("still2") String mov_still2, @Param("still3") String mov_still3);
	public int delete(int mov_num);
	
	
	/**
	 * 페이징용 SELECT
	 * @param from : 몇번째 row 부터
	 * @param pageRows : 몇개의 데이터(게시글)
	 * @return DTO 의 List
	 */
	public List<MovieAdminDTO> selectFromRow();
	
	// 전체 글의 개수
	public int countAll();
}
