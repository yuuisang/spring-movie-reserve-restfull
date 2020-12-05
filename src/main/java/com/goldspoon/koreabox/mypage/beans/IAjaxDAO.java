package com.goldspoon.koreabox.mypage.beans;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.mybatis.spring.annotation.MapperScan;

import com.goldspoon.koreabox.showinfo.beans.ShowInfoDTO;

@MapperScan
public interface IAjaxDAO {
   
   /**
    * 페이징용 SELECT
    * @param from : 몇번째 row 부터
    * @param pageRows : 몇개의 데이터(게시글)
    * @return  DTO 의 List
    */
   public List<UserInfoDTO> selectFromRow(
         @Param("from") int from,
         @Param("pageRows") int pageRows
         );
      
   	// 개인정보 수정
	public int updateOk(UserInfoDTO dto);
	
	// 회원탈퇴
	public int deleteByNum(UserInfoDTO dto);
   
}


















