var dataSave;

$(document).ready(function(){
   
   getUserInfo(uid);
   
   // 수정버튼 클릭
   $(document).on("click","#btnSubmit",function(event){
      updateUserInfo();
   })
   
   
   // 탈퇴버튼 클릭
   $(document).on("click","#btnDelete",function(event){
      deleteUserInfo();
   })
   
});


function getUserInfo(uid){
   
   $.ajax({
         url : "./" + uid,
         type : "GET",
         cache : false,
         success : function(data, status){
             dataSave = data;
             
             makeInfoDiv();
          }
         

     });
   
}


function makeInfoDiv(){
   
   var arr = dataSave.data[0].mem_phone.split("-");
   
   var result = "";
   result += "<div class='memInfo' id='mem_id'>아이디 : " + dataSave.data[0].mem_id + "</div>"
         + "<div class='memInfo' id='mem_name'>이름 : " + dataSave.data[0].mem_name + "</div>"
         + "<div class='memInfo' id='mem_birth'>생년월일 : " + dataSave.data[0].mem_birth + "</div>"
         + "<div class='memInfo' id='mem_email'>이메일 : " + dataSave.data[0].mem_email + "</div>"
         + "<div class='memInfo' id='mem_pw'>비밀번호 : <input type='password' class='form-control' id='inputPw' value='" + dataSave.data[0].mem_pw + "'></div>"
         + "<div class='memInfo' id='mem_pwChk'>비밀번호 확인 : <input type='password' class='form-control' id='inputPwChk' value='" + dataSave.data[0].mem_pw + "'></div>"
         + "<div class='memInfo' id='mem_phone'>핸드폰 번호 : " 
            + "<input type='text' class='form-control' id='inputPhone1' value='" + arr[0] + "'>" 
            + "<input type='text' class='form-control' id='inputPhone2' value='" + arr[1] + "'>" 
            + "<input type='text' class='form-control' id='inputPhone3' value='" + arr[2] + "'>"             
         + "</div>"
         + "<div class='memInfo' id='submitDiv'>" 
            + "<button type='button' class='btn btn-primary' id='btnSubmit'>수정</button>"
         + "</div>"
         ;
   
   $("#initUpdate").html(result);
   
   
   
   var resultDelete = "";
   resultDelete += "<div class='memDelete'>비밀번호 인증 성공시 모든 회원정보와 예매한 영화는 <br>환불이 불가하오니 확인 부탁드립니다.</div>"
            + "<div class='memDelete'>"
               + "비밀번호 : <input type='password' class='form-control' id='deleteChk'>"
            + "</div>"
            + "<div class='memDelete' id='deleteDiv'>"
               + "<button type='button' class='btn btn-danger' id='btnDelete'>탈퇴</button>"
            + "</div>"
            ;
   
   
   $("#initDelete").html(resultDelete);
}



function updateUserInfo(){
   
   var finalPhone = $("#inputPhone1").val() + "-" + $("#inputPhone2").val() + "-" + $("#inputPhone3").val();
   
   var serialize = "mem_uid=" + uid
            + "&mem_pw=" + $("#inputPw").val()
            + "&mem_phone=" + finalPhone
            ;
   if($("#inputPw").val() != $("#inputPwChk").val()){
      alert('비밀번호 확인이 일치하지 않습니다. 다시 확인 후 시도해주세요');
      getUserInfo(uid);
      return;
   }
   
   $.ajax({
         url : "./",
         type : "PUT",
         data : serialize,
         cache : false,
         success : function(data, status){
             if(status == "success"){
                alert('수정완료');
                getUserInfo(uid);
             }
         }

     }); // end ajax
    
} // end updateUserInfo()




function deleteUserInfo(){
   
   if($("#deleteChk").val() == null || $("#deleteChk").val() == ""  || $("#deleteChk").val() != dataSave.data[0].mem_pw){
      alert('정확한 비밀번호를 입력해주세요');
      return;
   }
   
   var serialize = "mem_uid=" + uid;
   
   $.ajax({
         url : "./",
         type : "DELETE",
         data : serialize,
         cache : false,
         success : function(data, status){
             if(status == "success"){
                alert('회원탈퇴완료!');
                location.href = path + "/logOut";
                // 예약, 댓글 테이블에 접근해서 커맨드에서 삭제까지완료
                // 여기서 메인페이지로 보내면 됨
                
             }
         }

     }); // end ajax
    
} // end updateUserInfo()

