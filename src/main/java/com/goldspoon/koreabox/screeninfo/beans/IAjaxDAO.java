package com.goldspoon.koreabox.screeninfo.beans;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

@MapperScan
public interface IAjaxDAO {
   
   /**
    * 페이징용 SELECT
    * @param from : 몇번째 row 부터
    * @param pageRows : 몇개의 데이터(게시글)
    * @return  DTO 의 List
    */
   public List<ScreenInfoDTO> selectFromRow(
         @Param("from") int from,
         @Param("pageRows") int pageRows
         );
   
   public List<ShowInfoDTO> selectAllShowInfo();
   
   // 전체 상영관 개수
   public int countAll();
   
   
   // 상영관 등록
   public int insert(
         String scr_name,
         int scr_seatRow,
         int scr_seatLine
         );
   
   
   // 특정 uid 상영관 삭제 하기
   public int deleteByNum(int scr_num);

}


















