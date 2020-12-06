package com.goldspoon.koreabox.mypage.beans;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Data;

@Data
public class AjaxWriteList extends AjaxWriteResult {
   
   @JsonProperty("data")
   List<UserInfoDTO> list;  // 데이터 목록
      
}











