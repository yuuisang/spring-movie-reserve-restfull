package com.goldspoon.koreabox.movie.beans;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface MovieUserDAO {
   public List<MovieUserDTO> select();
   public List<MovieUserDTO> openBeforeList();
   public List<ShowInfoDTO> openMovieNum();
   public List<MovieUserDTO> openMovieList(int [] showInfoListArr);
   public List<CommentDTO> commentList(int mov_num, @Param("from") int fromRow);
   
   public MovieUserDTO read(int mov_num);
   
   public int commentWrite(@Param("cwdto") CommentDTO dto);
   public int commentDelete(int cmt_num, int cmt_movieNum);
   public int starRatingSearch(int cmt_num);
   public int starRatingDelete(int cmt_star, int cmt_movieNum);
   public int starCntDelete(int cmt_movieNum);
   
   public int starRatingUpdate(CommentDTO dto);
   public int starRatingCnt(int mov_num);
   public int commentUpdate(String cmt_content, int cmt_num);
   
   
   public int updateRating(@Param("mov_num") int mov_num, @Param("star_rating") int star_rating);
   public int ratingCnt(int mov_num);
   public int countAllComment(int mov_num);
   
   public Integer commentUserChk(int cmt_movieNum, int cmt_memberUid);
}