var page = 1;
var pageRows = 10;
var viewItem = undefined;   //  가장 최근에 view 한 글의 데이터

// 페이지 최초 로딩되면 게시글 목록 첫페이지분 로딩
// [이전] 버튼 눌렀을때 -> 이전 페이지 게시글목록 로딩
// [다음] 버튼 눌렀을때 -> 다음 페이지 게시글목록 로딩


$(document).ready(function(){
    // 페이지 최초 로딩되면 1페이지 분량 읽어오기
    loadPage(page);
    
    // 모달 대화상자 close 버튼 눌리면
    $(".modal .close").click(function(){
        $(this).parents(".modal").hide();
    });

    /* 
    // 글 작성 폼 submit 되면
    $("#frmWrite").submit(function(){
        $(this).parents(".modal").hide(); 
        return chkWrite();
    });
    
    
    // 글 읽기 (view) 대화상자에서 삭제버튼 누르면 해당 글 (uid) 삭제 진행
	$("#viewDelete").click(function(){
		//var uid = $("#dlg_write input[name='uid']").val();
		var uid = viewItem.uid;
		if(deleteUid(uid)){  
			$(this).parents(".modal").hide();  // 삭제 성공하면 대화상자 닫기
		}
	});
	
	// 글 읽기 (view) 대화상자에서 수정버튼 누르면
	$("#viewUpdate").click(function(){
		//alert('hh');
		
		setPopup("update")
    
	});
	*/
    
});




//page번째 목록 읽어오기
function loadPage(page){
  $.ajax({
      url : "./" + page + "/" + window.pageRows,
      type : "GET",
      cache : false,
      success : function(data, status){
          if(status == "success"){
              if(updateList(data)){
                  // 화면 업데이트 후, 페이지 정보 업데이트 
              	
                  // 업데이트된 list 의 이벤트 동작...
                  addViewEvent();
              	
              }
          }
      },
      error : function(request,status,error) {
			alert("loadPage() --> 에러코드 : "+request.status+"\n\n"+"에러메세지 : "+request.responseText+"\n\n"+"에러 : "+error);
			
		}

  });
} // end loadPage()





function updateList(jsonObj){
    result = "";  // 최종 결과물

    if(jsonObj.status == "OK"){
        var count = jsonObj.count;

        window.page = jsonObj.page;
        window.pageRows = jsonObj.pagerows; 

        var items = jsonObj.data;  // 상영스케줄 배열

        var i;
        for(i = 0; i < count; i++){

            result += "<tr>\n";
            result += "<td class='shw_num'>" + items[i].shw_num + "</td>\n";
            result += "<td>" + items[i].shw_movieName + "</td>\n";
            result += "<td>" + items[i].shw_screenName + "</td>\n";
            result += "<td>" + items[i].shw_date + "</td>\n";
            result += "<td>" + items[i].shw_time + "</td>\n";
            result += "<td>" + items[i].shw_regDate + "</td>\n";
            result += "<td><button type='button' id='btnManagement' data-uid='" + items[i].shw_num + "'>설정</button>" + "</td>\n";
            result += "</tr>\n";
        }
        $("#showScheduleTable tbody").html(result);   // 목록 업데이트

        // 페이지 정보 업데이트
        $("#pageinfo").text(jsonObj.page + "/" + jsonObj.totalpage + "페이지, " + jsonObj.totalcnt +"개의 글");

        // pageRows
        var txt = "<select id='rows' onchange='changePageRows()'>\n";
        txt += "<option " + ((window.pageRows == 10) ? "selected" : "") + " value='10'>10개씩</option>\n";
        txt += "<option " + ((window.pageRows == 20) ? "selected" : "") + " value='20'>20개씩</option>\n";
        txt += "<option " + ((window.pageRows == 50) ? "selected" : "") + " value='50'>50개씩</option>\n";
        txt += "<option " + ((window.pageRows == 100) ? "selected" : "") + " value='100'>100개씩</option>\n";
        txt += "</select>\n";
        $("#pageRows").html(txt);

        // 페이징 정보 업데이트
        var pagination = buildPagination(jsonObj.writepages, jsonObj.totalpage, jsonObj.page, jsonObj.pageRows);
        $("#pagination").html(pagination);

        return true;
    } else {
        alert("내용이 없습니다");
        return false;
    }
} //end updateList()










function addViewEvent(){
	
	// 해당 상영스케줄의 uid를 가지고 스케줄표를 열때
	$("#showScheduleList #btnManagement").click(function(){
		//alert($(this).text() + " : " + $(this).attr('data-uid')); // 확인해보자, 커스텀 데이터 사용 가능.
		
		// 읽어오기		
		$.ajax({
			//url : "view.ajax?uid=" + $(this).attr('data-uid'),
			url : "./" + $(this).attr('data-uid'),
			type : "GET",
			cache : false,
			success : function(data, status){
				if(status == "success"){
					if(data.status == "OK"){	
						var chk = 1;
						 if(setPopup(data, chk)){
			                  // 화면 업데이트 후, 페이지 정보 업데이트 
			              	
			              	
			              }
						// 성공하면 내부 데이터 세팅하고 다이얼로그 보여주기
						viewItem = data.data[0];

						
						$("#dlg_write").show();
						
						
					} else {
						alert("실패: " + data.message);
					}
				}
			}
		}); // end $.ajax()
				
	});
	
	
	// 선택된 스케줄 없이 기본 스케줄 등록시
	$("#btnRegist").click(function(){
		
		// 읽어오기		
		$.ajax({
			url : ".",
			type : "GET",
			cache : false,
			success : function(data, status){
				if(status == "success"){
					if(data.status == "OK"){
						var chk = 0;
						 if(setPopup(data, chk)){
			                  // 화면 업데이트 후, 페이지 정보 업데이트 
			              }
						// 성공하면 내부 데이터 세팅하고 다이얼로그 보여주기
						viewItem = data.data[0];

						
						$("#dlg_write").show();
						
						
					} else {
						alert("실패: " + data.message);
					}
				}
			}
		}); // end $.ajax()
				
	});
	
	
} // showView()








// 페이징 생성
// 한페이징에 표시될 페이지수 --> writePages
// 총 페이지수 --> totalPage
// 현재 페이지 --> curPage

function buildPagination(writePages, totalPage, curPage, pageRows){
	var str = "";   // 최종적으로 페이징에 나타날 HTML 문자열 <li> 태그로 구성
	
	// 페이징에 보여질 숫자들 (시작숫자 start_page ~ 끝숫자 end_page)
    var start_page = ( (parseInt( (curPage - 1 ) / writePages ) ) * writePages ) + 1;
    var end_page = start_page + writePages - 1;

    if (end_page >= totalPage){
    	end_page = totalPage;
    }
    
  //■ << 표시 여부
	if(curPage > 1){
		str += "<li><a onclick='loadPage(" + 1 + ")' class='tooltip-top' title='처음'><i class='fas fa-angle-double-left'></i></a></li>\n";
	}
	
  	//■  < 표시 여부
    if (start_page > 1) 
    	str += "<li><a onclick='loadPage(" + (start_page - 1) + ")' class='tooltip-top' title='이전'><i class='fas fa-angle-left'></i></a></li>\n";
    
    //■  페이징 안의 '숫자' 표시	
	if (totalPage > 1) {
	    for (var k = start_page; k <= end_page; k++) {
	        if (curPage != k)
	            str += "<li><a onclick='loadPage(" + k + ")'>" + k + "</a></li>\n";
	        else
	            str += "<li><a class='active tooltip-top' title='현재페이지'>" + k + "</a></li>\n";
	    }
	}
	
	//■ > 표시
    if (totalPage > end_page){
    	str += "<li><a onclick='loadPage(" + (end_page + 1) + ")' class='tooltip-top' title='다음'><i class='fas fa-angle-right'></i></a></li>\n";
    }

	//■ >> 표시
    if (curPage < totalPage) {
        str += "<li><a onclick='loadPage(" + totalPage + ")' class='tooltip-top' title='맨끝'><i class='fas fa-angle-double-right'></i></a></li>\n";
    }

    return str;
} // end buildPagination





// <select> 에서  pageRows 값 변경할때마다
function changePageRows(){
    window.pageRows = $("#rows").val();
    loadPage(window.page);
}





//대화상자 셋팅
function setPopup(jsonObj, defaultChk){	
	
	// 디폴트 설정일때
	if(defaultChk == 0){
		
	}
	else{
		//특정 shw_num 의 설정일때
		
	}
	
	result = "";  // 최종 결과물

    if(jsonObj.status == "OK"){
        var count = jsonObj.count;
        for(var i=0; i<count; i++){
        	alert("jsonObj.data[i] : " +jsonObj.data[i].shw_screenName);        	
        	alert("jsonObj.data[i] : " +jsonObj.data[i].shw_num);        	
        }

        var items = jsonObj.data;  // 상영스케줄 배열

        var i;
        let today = new Date();   

        let year = today.getFullYear(); // 년도
        let month = today.getMonth() + 1;  // 월
        let date = today.getDate();  // 날짜

        
        for(i = 0; i < count; i++){
        	
        	// 스케줄도 안정해져있고, 시간도 안지났을때 박스
            result += "<tr>\n";
            result += "<td>" + items[i].shw_screenName + "</td>\n";	// 상영관명 고정
            result += "<td>" + year + '-' + month + '-' + date + '/'
            		+ items[i].shw_screenName + '/ 시간' + "<br><br> <input type='text'/>"
            		+ "<button type='button' id='btnManagement' data-uid='" + items[i].shw_num + "'>설정</button>"
            		+ "</td>\n";
            result += "</tr>\n";
        }
        $("#showScheduleTableModal tbody").html(result);   // 목록 업데이트

       

        return true;
    } else {
        alert("내용이 없습니다");
        return false;
    }
	
	
	

} // end setPopup()
