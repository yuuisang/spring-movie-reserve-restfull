$(function () {
    $(window).on('scroll', function () {
        if ( $(window).scrollTop() > 10 ) {
            $('.navbar').addClass('active');
        } else {
            $('.navbar').removeClass('active');
        }
    });
});

var page = 1;
var pageRows = 10;
var viewItem = undefined;   //  가장 최근에 view 한 글의 데이터
var data_shw;
var data_scr_mov;
var saveTime = new Array();
saveTime[0] = 7;
saveTime[1] = 11;
saveTime[2] = 15;
saveTime[3] = 19;
saveTime[4] = 23;

let today = new Date();

let year = today.getFullYear(); // 년도
let month = today.getMonth() + 1;  // 월
let date = today.getDate();  // 날짜



let hours = today.getHours(); // 시
let minutes = today.getMinutes();  // 분
let seconds = today.getSeconds();  // 초
let milliseconds = today.getMilliseconds(); // 밀리초



$(document).ready(function(){
	
    // 페이지 최초 로딩되면 1페이지 분량 읽어오기
    loadPage(page);
    
    // 모달 대화상자 close 버튼 눌리면
    $(".modal .close").click(function(){
    	//loadPage(1);
    	todayTemp = new Date();
    	let yearTemp = todayTemp.getFullYear(); // 년도
    	let monthTemp = todayTemp.getMonth() + 1;  // 월
    	let dateTemp = todayTemp.getDate();  // 날짜
    	date = dateTemp;
        $(this).parents(".modal").hide();
    });
    
    
    

    // 이전날
    $(document).on("click","#btnBack",function(event){
    	//$(".modal .close").trigger("click");
    	
    	// 비교할 실제로컬 날짜
    	todayChk = new Date();
    	let yearChk = todayChk.getFullYear(); // 년도
    	let monthChk = todayChk.getMonth() + 1;  // 월
    	let dateChk = todayChk.getDate();  // 날짜
    	var tempdate = date * 1; // date 넘버타입으로 바꿈
    	
    	if(date > dateChk){
    		tempdate = tempdate - 1;
    		date = tempdate;
    		setPopup(data_shw); 
    	}else{
    		alert('스케줄 설정은 오늘기준 내일/모레 까지 가능합니다.');
    		date = today.getDate();
    		setPopup(data_shw);
    	}
    	
    });
    
    
    // 다음날
    $(document).on("click","#btnNext",function(event){
    	//$(".modal .close").trigger("click");
    	
    	// 비교할 실제로컬 날짜
    	todayChk = new Date();
    	let yearChk = todayChk.getFullYear(); // 년도
    	let monthChk = todayChk.getMonth() + 1;  // 월
    	let dateChk = todayChk.getDate();  // 날짜 기본 넘버타입
    	var tempdate = date * 1; // date 넘버타입으로 바꿈
    	
    	if(tempdate <= dateChk + 1){
    		tempdate = tempdate + 1;
    		date = tempdate;
    		setPopup(data_shw);    		
    	}else{
    		alert('스케줄 설정은 오늘기준 내일/모레 까지 가능합니다.');
    		date = today.getDate();
    		setPopup(data_shw); 
    	}
    });
    
    
    
    
    // 스케줄 등록버튼클릭
    $(document).on("click",".btnRegistInit",function(event){
		//alert($("#" + $(this).parents().attr('id')).attr('value4') <= hours);
		let tt = new Date();
		let year1 = tt.getFullYear(); // 년도
		let month1 = tt.getMonth() + 1;  // 월
		let date1 = tt.getDate();  // 날짜
		
		if(($(this).attr('value1') == year1+"-"+month1+"-"+date1) && ($("#" + $(this).parents().attr('id')).attr('value4') <= hours)){
			alert("시간이 지났으므로 스케줄 등록이 불가능합니다.");
			return;
		}
		
		var selectBoxId = $(this).parents().children("select[class='selectClass']").attr('value');			
		
		var ttt = "";
		ttt = "shw_movieNum="+$("#" + selectBoxId + " option:selected").attr('value1');
		ttt += "&shw_movieName="+$("#" + selectBoxId + " option:selected").attr('value2');
		ttt += "&shw_date="+$("#"+$(this).attr('id')).attr('value1');
		ttt += "&shw_screenNum="+$("#"+$(this).attr('id')).attr('value2');
		ttt += "&shw_screenName="+$("#"+$(this).attr('id')).attr('value3');
		ttt += "&shw_time="+$("#"+$(this).attr('id')).attr('value4');
		ttt += "&shw_seatRow="+$("#"+$(this).attr('id')).attr('value5');		
		ttt += "&shw_seatLine="+$("#"+$(this).attr('id')).attr('value6');
		ttt += "&shw_seatCnt="+($("#"+$(this).attr('id')).attr('value5')) * ($("#"+$(this).attr('id')).attr('value6'));
		ttt += "&shw_expireFlag=0";
		//ttt += "$shw_regDate=" + sysdate.format('{yyyy}-{MM}-{dd} {hh}:{mm}:{ss}');
		
		var k = $("#"+$(this).attr('id')).attr('value7');
		var i = $("#"+$(this).attr('id')).attr('value8');
		var j = $("#"+$(this).attr('id')).attr('value9');
		//alert(i);
		//alert(j);
		
		// 리로드 파라미터값으로 체크
		var mov_num = $("#" + selectBoxId + " option:selected").attr('value1');
		var mov_name = $("#" + selectBoxId + " option:selected").attr('value2');
		var scr_num = $("#"+$(this).attr('id')).attr('value2');
		var scr_name = $("#"+$(this).attr('id')).attr('value3');
		var shw_date = $("#"+$(this).attr('id')).attr('value1');
		var shw_time = $("#"+$(this).attr('id')).attr('value4');
		
		
		$.ajax({
			url : "./",
			type : "POST",
			data : ttt,
			cache : false,
			success : function(data, status){
				if(status == "success"){
					alert('스케줄 등록에 성공했습니다.');
					// 부분리로딩
					
					initReload(i,j,mov_num,mov_name,scr_num,scr_name,shw_date,shw_time);
					
				}else{
					alert("실패: " + data.message);
				}
			}
		})
	}); // end registonclick()
    
    
    
    
    
    // 스케줄 수정 버튼클릭
    $(document).on("click",".btnUpdate",function(event){
		var i = $(this).parents().attr('value1');
		var j = $(this).parents().attr('value2');
		var k = $(this).parents().attr('value3'); //셀렉박스아이디 : selectBox7 이런식 << 이게k
		
		//alert('i:'+i + ' / j:'+j); // td 의 행열 정확함
		
		//해당 td의 value1 = i, value2 = j;
		//btnUpdatei_j(this)의  value1='" + shw_num + "' value2='" + shw_date"' value3='" + scr_name + "' value4='" + shw_time
		//alert( $("#"+updateBtnId).attr('value1') )//shwnum 부정확함X 그냥this로찍는게 value 주입시점이 제일정확함 
		//alert("shw_num : " + $(this).attr('value1') )//정확함
		//alert("shw_date : " + $(this).attr('value2') )//정확함
		//alert("scr_name : " + $(this).attr('value3') )//정확함
		//alert("shw_time : " + $(this).attr('value4') )//정확함
		
		
		var shw_num = $(this).attr('value1');
		var shw_date = $(this).attr('value2');
		var scr_name = $(this).attr('value3');
		var shw_time = $(this).attr('value4');
		var data = data_scr_mov;
		
		// 해당 스케줄에 예약한 사람이있으면 수정,삭제 불가능하게 처리
		for(var chk=0; chk<data_scr_mov.res_shwInfo.length; chk++){
			if(scr_name == data_scr_mov.res_shwInfo[chk].res_screenName
			&& shw_date == data_scr_mov.res_shwInfo[chk].res_date
			&& shw_time == data_scr_mov.res_shwInfo[chk].res_time
			){
				alert('해당 스케줄은 이미 예약된 고객이 있어 수정이 불가능합니다');
				return false;
			}
		}
		
		
		var result = "<br><br><br><select id='selectBox"+ k +"' class='selectClassOk' value='selectBox" + k + "'>";
		result += "<option value='noChoice'>영화선택</option>";
		
		var chk_today = year+"-"+month+"-"+date;
		
		for(var p=0;p<data.mov_numTitle.length;p++){
			if(data.mov_numTitle[p].mov_openDate.split("-")[0] <= chk_today.split("-")[0]
			&&data.mov_numTitle[p].mov_openDate.split("-")[1] <= chk_today.split("-")[1]
			&&data.mov_numTitle[p].mov_openDate.split("-")[2] <= chk_today.split("-")[2]
			){
				result += "<option value1='" + data.mov_numTitle[p].mov_num + "' value2='" + data.mov_numTitle[p].mov_title + "'>" 
				+ "번호 : " + data.mov_numTitle[p].mov_num + " / 제목 : " + data.mov_numTitle[p].mov_title + "</option>";				
			}
		}
		
		result += "</select><br><br><br>";
		
		result += "<button type='button' class='btnUpdateOk' id='btnUpdateOk" + k + "'>수정</button>"
		
		
		$("#td"+ i +"행"+ j +"열").html(result);
		
		
		$(".btnUpdateOk").click(function(){
			//alert(shw_num);
			//alert($(this).attr('id'));
			//alert($(this).parents().attr('id'));
			var tdsid = $(this).parents().attr('id');
			
			var selectBoxId = $("#"+tdsid).children("select[class='selectClassOk']").attr('value');
			//alert($("#" + selectBoxId + " option:selected").attr('value1'));
			//alert($("#" + selectBoxId + " option:selected").attr('value2'));
			var mov_num = $("#" + selectBoxId + " option:selected").attr('value1');
			var mov_name = $("#" + selectBoxId + " option:selected").attr('value2');
			
			
			$.ajax({
				url : "./",
				type : "PUT",
				data : "shw_num=" + shw_num + "&shw_movieNum=" + mov_num + "&shw_movieName=" + mov_name,
				cache : false,
				success : function(data, status){
					if(status == "success"){
						alert('스케줄 수정에 성공했습니다.');
						
						// 부분리로딩						
						var init = "";
						init +="상영번호 : " + shw_num + "<br>"
							+ "상영날짜 : " + shw_date + "<br>"
							+ "상영관명 : " + scr_name + "<br>"
							+ "상영시간 : " + shw_time + "<br>"
							+ "영화제목 : " + mov_name + "<br>"
							//+ "FLAG : " + 0 + "<br>"
							+ "<button type='button' class='btnUpdate' id='btnUpdate" + i + "_" + j 
								+ "' value1='" + shw_num + "' value2='" + shw_date
								+ "' value3='" + scr_name + "' value4='" + shw_time
								+ "'>수정</button>&nbsp"
							+ "<button type='button' class='btnDelete' id='btnDelete" + i + "_" + j
								+ "' value='" + shw_num 
								+ "' value1='" + shw_date 
								+ "' value2='" + scr_name 
								+ "' value3='" + shw_time 
								+ "'>삭제</button>"
							;
						
						
						$("#td"+ i +"행"+ j +"열").html(init);
						
					}else{
						alert("실패: " + data.message);
					}
				}
			})
			
		})
		
	}); // end update
    
    
    
    
    
  //스케줄 삭제버튼클릭
	//$(".btnDelete").click(function(){
    $(document).on("click",".btnDelete",function(event){
		
		var i = $(this).parents().attr('value1');
		var j = $(this).parents().attr('value2');
		var k = $(this).parents().attr('value3'); //셀렉박스아이디 : selectBox7 이런식 << 이게k
		
		//alert('i:'+i + ' / j:'+j + ' / k:' + k); // td 의 행열 정확함
		
		//해당 td의 value1 = i, value2 = j;
		//alert("shw_num : " + $(this).attr('value') )//정확함
		//alert("shw_date : " + $(this).attr('value1') )//정확함
		//alert("scr_name : " + $(this).attr('value2') )//정확함
		//alert("shw_time : " + $(this).attr('value3') )//정확함
		
		var shw_num = $(this).attr('value');
		var shw_date = $(this).attr('value1');
		var scr_name = $(this).attr('value2');
		var shw_time = $(this).attr('value3');
		
		
		// 해당 스케줄에 예약한 사람이있으면 수정,삭제 불가능하게 처리
		for(var chk=0; chk<data_scr_mov.res_shwInfo.length; chk++){
			if(scr_name == data_scr_mov.res_shwInfo[chk].res_screenName
			&& shw_date == data_scr_mov.res_shwInfo[chk].res_date
			&& shw_time == data_scr_mov.res_shwInfo[chk].res_time
			){
				alert('해당 스케줄은 이미 예약된 고객이 있어 삭제가 불가능합니다');
				return false;
			}
		}
		
		
		// 읽어오기		
		$.ajax({
			url : "./",
			type : "DELETE",
			data : "shw_num=" + shw_num,
			cache : false,
			success : function(data, status){
				if(status == "success"){
					if(data.status == "OK"){
						alert("스케줄 삭제를 완료했습니다.");
						
						$.ajax({
							url : "./",
							type : "GET",
							cache : false,
							success : function(data2, status){
								if(status == "success"){
									
									var result = "";	       			
									
					    			result += 	shw_date + '/'
					        					+ scr_name +  '/'
					        					+ shw_time + "<br><br> " 
					        					+ "<select id='selectBox"+ k +"' class='selectClass' value='selectBox" + k + "'>";
									
					    			result += "<option value='noChoice'>영화선택</option>";
					    			
					    			var chk_today = year+"-"+month+"-"+date;
					    			
									for(var q=0; q<data2.mov_numTitle.length; q++){
										if(data2.mov_numTitle[q].mov_openDate.split("-")[0] <= chk_today.split("-")[0]
										&&data2.mov_numTitle[q].mov_openDate.split("-")[1] <= chk_today.split("-")[1]	
										&&data2.mov_numTitle[q].mov_openDate.split("-")[2] <= chk_today.split("-")[2]	
										){
											result += "<option value1='" + data2.mov_numTitle[q].mov_num + "' value2='" + data2.mov_numTitle[q].mov_title + "'>" 
											+ "번호 : " +data2.mov_numTitle[q].mov_num + " / 제목 : " + data2.mov_numTitle[q].mov_title + "</option>";										
										}
									}
									
									result += "</select>"
					        		+ "<button type='button' class='btnRegistInit' id='btnRegist" + k + "'" 
					        				+ " value1='" + shw_date + "' value2='" + data2.scr_shwInfo[i].scr_num
											+ "' value3='" + scr_name + "' value4='" + shw_time 
											+ "' value5='" + data2.scr_shwInfo[i].scr_seatRow + "' value6='" + data2.scr_shwInfo[i].scr_seatLine
											+ "' value7='" + k
											+ "' value8='" + i
											+ "' value9='" + j
									+ "'>등록</button>"
					        		;
									
									$("#td"+i+"행"+j+"열").html(result);
									$("#td"+i+"행"+j+"열").css('background-color', 'rgba(135,206,240,0.4'); //색바꾸기
									

								}
							}
						})
						
					} else {
						alert("실패: " + data.message);
					}
				}
			}
		}); // end $.ajax()
		
		
	}); // end deleteOk()
    
    
    
    
});




//page번째 목록 읽어오기
function loadPage(page){
  $.ajax({
      url : "./" + page + "/" + window.pageRows,
      type : "GET",
      cache : false,
      success : function(data, status){
          if(status == "success"){
        	  data_shw = data;
              if(updateList(data)){
                  // 화면 업데이트 후, 페이지 정보 업데이트 
              	
                  // 업데이트된 list 의 이벤트 동작...
                  addViewEvent();
              	
              }
          }
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
            result += "<td>" + items[i].shw_time + " 시</td>\n";
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
function setPopup(jsonObj){	
	resultDef = "";  // 최종 결과물
	resultBefore = "";
	resultAfter = "";
	
	//month = today.getMonth() + 1;  // 월
	//date = today.getDate();  // 날짜
	
	if(month < 10){
		month = "0" + month;
	}
	if(date < 10){
		date = "0" + date;
	}
	
	var chk_today = year+"-"+month+"-"+date;
	
    if(jsonObj.status == "OK"){
    	
    	$.ajax({
			url : "./",
			type : "GET",
			cache : false,
			success : function(data, status){
				if(status == "success"){
					if(data.scr_shwInfo.length == 0){
			        	alert('등록된 상영관이 없어 상영 스케줄을 설정할 수 없습니다.');
			        	return;
			        }else{
			        	// mov_num, mov_title, mov_openDate 포함
			        	data_scr_mov = data;
			        	
			        	var topResult = "";
			        		topResult += "<br><br><button type='button' id='btnBack'>Back</button>&nbsp&nbsp&nbsp"
			        					+ "<span>"+ chk_today + " 상영시간표</span>&nbsp&nbsp&nbsp"
			        					+ "<button type='button' id='btnNext'>Next</button><br><br>";

			        	
						$("#showScheduleTitle").html(topResult);
						makeDefTable(chk_today);
						
						if(data.scr_shwInfo.length != 0){
							for(var aa=0; aa<data.scr_shwInfo.length; aa++){
								for(var bb=0; bb<6; bb++){
									if(bb != 0){
										$("#td"+aa+"행"+bb+"열").css('background-color', 'rgba(135,206,240,0.4'); //색바꾸기
									}else{
										$("#td"+aa+"행"+bb+"열").css('font-size', '30px'); //글자크기바꾸기
									}
								}
							}						
						}
						
						makeAfterTable();
			        	
			    		$("#dlg_write").show();
			    		
			        }// end if
					

				}else{
					alert("실패: " + data.message);
				}
			}
		}); // end $.ajax()
    	
    	
    	
        
        
        
		
		
    } else {
        alert("내용이 없습니다");
    }
    

	
} // end setPopup()







//등록 후 부분 리로드
function initReload(i, j, mov_num, mov_name, scr_num, scr_name, shw_date, shw_time){
	
	var row = i;
	var column = j;
	
	$.ajax({
		url : "./",
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){	
				
				//alert('getajax i:'+ row + '/ j:' + column);
				
				var shw_num = 0;
				var shw_expireFlag = "";
				for(var i=0; i<data.data.length; i++){
					if(data.data[i].shw_movieNum == mov_num && data.data[i].shw_movieName == mov_name
						&& data.data[i].shw_screenNum == scr_num && data.data[i].shw_screenName == scr_name
						&& data.data[i].shw_date == shw_date && data.data[i].shw_time == shw_time
					){
						//alert("일치하는 상영번호:"+data.data[i].shw_num);
						shw_num = data.data[i].shw_num;
						shw_expireFlag = data.data[i].shw_expireFlag;
						
						var init = "";
						init +="상영번호 : " + shw_num + "<br>"
							+ "상영날짜 : " + shw_date + "<br>"
							+ "상영관명 : " + scr_name + "<br>"
							+ "상영시간 : " + shw_time + "<br>"
							+ "영화제목 : " + mov_name + "<br>"
							//+ "FLAG : " + shw_expireFlag + "<br>"
							+ "<button type='button' class='btnUpdate' id='btnUpdate" + row + "_" + column 
								+ "' value1='" + shw_num + "' value2='" + shw_date
								+ "' value3='" + scr_name + "' value4='" + shw_time
								+ "'>수정</button>&nbsp"
							+ "<button type='button' class='btnDelete' id='btnDelete" + i + "_" + j
							+ "' value='" + shw_num 
							+ "' value1='" + shw_date 
							+ "' value2='" + scr_name 
							+ "' value3='" + shw_time 
							+ "'>삭제</button>"
							;
						
						
						$("#td"+ row +"행"+ column +"열").html(init);
						$("#td"+ row +"행"+ column +"열").css('background-color', 'rgba(100,220,100,0.3'); //색바꾸기
					}
				}
				
				
				
			}else{
				alert("실패: " + data.message);
			}
		}
	})
	
}




// 함수화해야 ajax() 동작순서 안꼬임
function makeDefTable(chk_today){	// 디폴트로 넣어주는 div들
	
	var k = 0;

	// 행(줄)은 등록된 상영관 수 만큼
	
    for(var i = 0; i < data_scr_mov.scr_shwInfo.length; i++){
    	
    	resultDef += "<tr id='tr" + i + "'>\n";

    	// 열(칸)은 지정 타임만큼(7,11,15,19,23시 총 5칸 + 맨앞에 영화관명 1칸)
    	for(var j = 0; j < 6; j++){
    		
        	// 스케줄도 안정해져있고, 시간도 안지났을때 기준(디폴트)
    		if(j==0){ // 상영관명 첫칸에 고정 
    			resultDef += "<form id='frmRegist'><td id='td" + i + "행" + j + "열'>" + data_scr_mov.scr_shwInfo[i].scr_name + "</td>\n";	       			
    		}else{
    			
    			resultDef += "<td class='td" + k + "' id='td" + i + "행" + j + "열' value1='" + i + "' value2='" + j + "' value3='" + k + "' + value4='" + saveTime[j-1] + "'>" 
        					+ year + '-' + month + '-' + date + '/'
        					+ data_scr_mov.scr_shwInfo[i].scr_name +  '/'
        					+ saveTime[j-1] + "<br><br> " 
        					+ "<select id='selectBox"+ k +"' class='selectClass' value='selectBox" + k + "'>";
    						k++;
    			resultDef += "<option value='noChoice'>영화선택</option>";
    			
				for(var aa=0;aa<data_scr_mov.mov_numTitle.length;aa++){
					// 팝업창에 현재 해당날짜까지 이미 개봉된 것만
					if(data_scr_mov.mov_numTitle[aa].mov_openDate.split("-")[0] <= chk_today.split("-")[0]
						&& data_scr_mov.mov_numTitle[aa].mov_openDate.split("-")[1] <= chk_today.split("-")[1]
						&& data_scr_mov.mov_numTitle[aa].mov_openDate.split("-")[2] <= chk_today.split("-")[2]
					){
						// 영화제목이 같은데 다른영화일수있으니, mov_num도있어야함 value1 = movnum value2 = movtitle
						resultDef += "<option value1='" + data_scr_mov.mov_numTitle[aa].mov_num + "' value2='" + data_scr_mov.mov_numTitle[aa].mov_title + "'>" 
									+ "번호 : " + data_scr_mov.mov_numTitle[aa].mov_num + " / 제목 : " + data_scr_mov.mov_numTitle[aa].mov_title + "</option>";
					}
					
				}
    			
				resultDef += "</select>"
        		+ "<button type='button' class='btnRegistInit' id='btnRegist" + k + "'" 
        				+ " value1='" + (year+"-"+month+"-"+date) + "' value2='" + data_scr_mov.scr_shwInfo[i].scr_num 
						+ "' value3='" + data_scr_mov.scr_shwInfo[i].scr_name + "' value4='" + saveTime[j-1] 
						+ "' value5='" + data_scr_mov.scr_shwInfo[i].scr_seatRow + "' value6='" + data_scr_mov.scr_shwInfo[i].scr_seatLine
						+ "' value7='" + k
						+ "' value8='" + i
						+ "' value9='" + j
				+ "'>등록</button>"
        		+ "</td>"
        		+ "<span id='aaa'></span>"
        		+ "</form>"
        		;
				
				//$("#td"+i+"행"+j+"열").css('background-color', 'rgba(135,206,240,0.4'); //색바꾸기	
				
    		} // end if
            
        } // end for(v=j)
    	
    		resultDef += "</tr>\n";     
    	
    } // end for(v=i);
    

    
    let changeHeight = data_scr_mov.scr_shwInfo.length * 17 +"%";
    if(data_scr_mov.scr_shwInfo.length <= 4){
    	$(".modal .modal-content").css('height','80%');	// 행개수에맞게 css height 유동적으로변경    	    	
    }else{
    	//alert(data_scr_mov.scr_shwInfo.length);
    	$(".modal .modal-content").css('height',changeHeight);	// 행개수에맞게 css height 유동적으로변경
    }
    $("#showScheduleTableModal tbody").html(resultDef);   // 목록 업데이트

    
    
    
} // end makeDefTable()





function makeAfterTable(){
	var y = 0; // td카운트
	var items = data_scr_mov.data;
	// 행(줄)은 등록된 상영관 수 만큼

	var chk_today = year+"-"+month+"-"+date;
	

    for(var i = 0; i < data_scr_mov.scr_shwInfo.length; i++){
    	var chkDateList = new Array();
		var cntDate = 0;
		for(var u=0; u<data_scr_mov.data.length; u++){
			if(data_scr_mov.data[u].shw_date == chk_today){ // 일단 스케줄이 오늘인거찾기
				chkDateList[cntDate] = u;
				cntDate++;
			}
		}
		
		
		// 열(칸)은 지정 타임만큼(7,11,15,19,23시 총 5칸 + 맨앞에 영화관명 1칸)
    	for(var j = 0; j < 6; j++){
    		
    		if(j==0){ // 상영관명 첫칸에 고정 
    			//resultBefore += "<td id='td" + i + "행" + j + "열'>" + scr_name[i] + "</td>\n";	       			
    		}else{
    			
    			
    			for(var t=0; t<chkDateList.length; t++){ // chkDateList << items[이자리] 그니까 오늘총스케줄갯수
    				
    				var value = "";
    				//
    				function beforeTd(){
						value += "상영번호 : " + items[chkDateList[t]].shw_num + "<br>"
								+ "상영날짜 : " + items[chkDateList[t]].shw_date + "<br>"
								+ "상영관명 : " + items[chkDateList[t]].shw_screenName + "<br>"
								+ "상영시간 : " + items[chkDateList[t]].shw_time + "<br>"
								+ "영화제목 : " + items[chkDateList[t]].shw_movieName + "<br>"
								//+ "FLAG : " + items[chkDateList[t]].shw_expireFlag
								;
						
						return value;
    				}
    				
    				function afterTd(){
						value += "상영번호 : " + items[chkDateList[t]].shw_num + "<br>"
								+ "상영날짜 : " + items[chkDateList[t]].shw_date + "<br>"
								+ "상영관명 : " + items[chkDateList[t]].shw_screenName + "<br>"
								+ "상영시간 : " + items[chkDateList[t]].shw_time + "<br>"
								+ "영화제목 : " + items[chkDateList[t]].shw_movieName + "<br>"
								//+ "FLAG : " + items[chkDateList[t]].shw_expireFlag + "<br>"
								+ "<button type='button' class='btnUpdate' id='btnUpdate" + i + "_" + j 
									+ "' value1='" + items[chkDateList[t]].shw_num 
									+ "' value2='" + items[chkDateList[t]].shw_date 
									+ "' value3='" + items[chkDateList[t]].shw_screenName 
									+ "' value4='" + items[chkDateList[t]].shw_time
									+ "'>수정</button>&nbsp"
									+ "<button type='button' class='btnDelete' id='btnDelete" + i + "_" + j
									+ "' value='" + items[chkDateList[t]].shw_num        
									+ "' value1='" +items[chkDateList[t]].shw_date       
									+ "' value2='" +items[chkDateList[t]].shw_screenName 
									+ "' value3='" +items[chkDateList[t]].shw_time       
									+ "'>삭제</button>"
									;
						
						return value;
    				}
    				
    				
    				let ttt = new Date();
    				let year2 = ttt.getFullYear();
    				let month2 = ttt.getMonth() + 1;  // 월
    		    	let date2 = ttt.getDate();
    				
    				if(items[chkDateList[t]].shw_date == year2+"-"+month2+"-"+date2 && items[chkDateList[t]].shw_time <= hours){ 
    					// && items[chkDateList[t]].shw_screenName == $("#td"+i+"행"+"0열").text()
    					// 이미 지났을때 
    					
    					if(items[chkDateList[t]].shw_time == saveTime[0] && items[chkDateList[t]].shw_screenName == $("#td"+i+"행"+"0열").text() ){ //7시상영일때
    						beforeTd();    						
    						$("#td"+ i +"행1열").html(value);
    						$("#td"+ i +"행1열").css('background-color', 'rgba(200,150,100,0.3'); //색바꾸기
    						 
    					}if(items[chkDateList[t]].shw_time == saveTime[1] && items[chkDateList[t]].shw_screenName == $("#td"+i+"행"+"0열").text()){ // 11시
    						beforeTd();    						
    						$("#td"+ i +"행2열").html(value);
    						$("#td"+ i +"행2열").css('background-color', 'rgba(200,150,100,0.3'); //색바꾸기
    						 
    					}if(items[chkDateList[t]].shw_time == saveTime[2] && items[chkDateList[t]].shw_screenName == $("#td"+i+"행"+"0열").text()){ // 15시
    						beforeTd();    						
    						$("#td"+ i +"행3열").html(value);
    						$("#td"+ i +"행3열").css('background-color', 'rgba(200,150,100,0.3'); //색바꾸기
    						 
    					}if(items[chkDateList[t]].shw_time == saveTime[3] && items[chkDateList[t]].shw_screenName == $("#td"+i+"행"+"0열").text()){ // 19시
    						beforeTd();    						
    						$("#td"+ i +"행4열").html(value);
    						$("#td"+ i +"행4열").css('background-color', 'rgba(200,150,100,0.3'); //색바꾸기
    						 
    					}if(items[chkDateList[t]].shw_time == saveTime[4] && items[chkDateList[t]].shw_screenName == $("#td"+i+"행"+"0열").text()){ // 23시
    						beforeTd();    						
    						$("#td"+ i +"행5열").html(value);
    						$("#td"+ i +"행5열").css('background-color', 'rgba(200,150,100,0.3'); //색바꾸기
    						 
    					}        
    				}else{
    					// 아직 안지났을때
    					
    					if(items[chkDateList[t]].shw_time == saveTime[0] && items[chkDateList[t]].shw_screenName == $("#td"+i+"행"+"0열").text()){ //7시상영일때
    						afterTd();    						
    						$("#td"+ i +"행1열").html(value);
    						$("#td"+ i +"행1열").css('background-color', 'rgba(100,220,100,0.3'); //색바꾸기
    						 
    					}if(items[chkDateList[t]].shw_time == saveTime[1] && items[chkDateList[t]].shw_screenName == $("#td"+i+"행"+"0열").text()){ // 11시
    						afterTd();    						
    						$("#td"+ i +"행2열").html(value);
    						$("#td"+ i +"행2열").css('background-color', 'rgba(100,220,100,0.3'); //색바꾸기
    						 
    					}if(items[chkDateList[t]].shw_time == saveTime[2] && items[chkDateList[t]].shw_screenName == $("#td"+i+"행"+"0열").text()){ // 15시
    						afterTd();    						
    						$("#td"+ i +"행3열").html(value);
    						$("#td"+ i +"행3열").css('background-color', 'rgba(100,220,100,0.3'); //색바꾸기
    						 
    					}if(items[chkDateList[t]].shw_time == saveTime[3] && items[chkDateList[t]].shw_screenName == $("#td"+i+"행"+"0열").text()){ // 19시
    						afterTd();    						
    						$("#td"+ i +"행4열").html(value);
    						$("#td"+ i +"행4열").css('background-color', 'rgba(100,220,100,0.3'); //색바꾸기
    						 
    					}if(items[chkDateList[t]].shw_time == saveTime[4] && items[chkDateList[t]].shw_screenName == $("#td"+i+"행"+"0열").text()){ // 23시
    						afterTd();    						
    						$("#td"+ i +"행5열").html(value);
    						$("#td"+ i +"행5열").css('background-color', 'rgba(100,220,100,0.3'); //색바꾸기
    						 
    					}        
    				}
    				
										
				} // end for(v=t)
    		} // end if
    	} // end for(v=j)
		
		
    } // end for(v=i)
    
    
} // end makeBeforeTable()



function addViewEvent(){
	
	$("#btnRegist").click(function(){
		setPopup(data_shw);
		//$("#dlg_write").show();
	});
	
} // addViewEvent()



