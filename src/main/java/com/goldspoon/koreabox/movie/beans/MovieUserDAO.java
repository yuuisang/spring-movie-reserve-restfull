package com.goldspoon.koreabox.movie.beans;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MovieUserDAO {
	public List<MovieUserDTO> select();
	public List<MovieUserDTO> openBeforeList();
	public List<ShowInfoDTO> openMovieNum();
	public List<MovieUserDTO> openMovieList(int [] showInfoListArr);
	
	
	public MovieUserDTO read(int mov_num);
	
	public int updateRating(@Param("mov_num") int mov_num, @Param("star_rating") int star_rating);
	public int ratingCnt(int mov_num);
	
}
