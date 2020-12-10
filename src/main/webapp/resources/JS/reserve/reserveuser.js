var data_aa;	// ajax reserveuser (showinfo tb)
var seatbtn_bool = 1;

$(document).ready(function(){
	loadPage(mov_num);
	
	// 모달 대화상자 close 버튼 눌리면
	$(".modal .close").click(function() {
		$(this).parents(".modal").hide();
	});
	
	$(".seatModal .close").click(function() {
		$(this).parents(".seatModal").hide();
	});
	
	$("#seatdone").on("click",function(){
		if(seatbtn_bool > 1){
			$("#seatnumplus").remove();
		}
		var selectseat = "";
		var count = $("input[type='checkbox']:checked").length;	// 좌석 선택한 갯수
		var peoplenum = $("#mov_peoplecnt").val();	// 앞에서 선택한 인원수
		if(count==peoplenum){	// 선택한 좌석 갯수와 선택한 인원수가 일치하면
			$(".seatModal").hide();
			$("input[type='checkbox']:checked").each(function(index){
				if(index != 0){
					selectseat += ',';
				}
				selectseat += $(this).attr('value')
			});
			var result = "<span id='seatnumplus'>";
			result += selectseat + "</span>"
			$("#seat").append(result);
			seatbtn_bool++;
			success();
		} else if(count!=peoplenum){	// 일치가 안되면 선택하라고 하기 모달 안꺼줌
			alert('인원에 맞게 좌석을 선택 하지 않았습니다.\n나머지 좌석을 선택해주세요');
		}
	});
});



// page번째 목록 읽어오기
function loadPage(mov_num){
	$.ajax({
		// url : "view.ajax?uid=" + $(this).attr('data-uid'),
		url : "../reserveuser/" + mov_num,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				
				 if(updateList(data)){
	                    addViewEvent();
	                }
				
			}
		}
	}); // end $.ajax()
} // end loadPage()


function updateList(jsonObj){
    result = "";  // 최종 결과물
    movieimg = "";	// 영화포스터 경로
    
    
    if(jsonObj.status == "OK"){

        var chk_date = jsonObj.chk_date;	// 중복되지 않는 date 값
        var items = jsonObj.data;  // 글 배열
        
        var i;
        for(i = 0; i < chk_date.length; i++){
            result += "<button class='dateChkbtn' value='"+ chk_date[i]+"'>"+chk_date[i]+"</button><br>"
            
        }

        movieimg = "<img alt='' src='" + path + "/resources/upload/"+mov_poster+"' width='350px' height='350px'/>" + "<br>"+
        		"<span>"+ items[0].shw_movieName +"</span>"
        
        $(".btn_group_write").html(result);   // 날짜 버튼 목록 업데이트
        $("#movieimg").html(movieimg);
       
        return true;
    } else {
        alert("등록된 영화 상영 스케줄이 없습니다.");
        return false;
    }
}


function addViewEvent(){
	$(".dateChkbtn").click(function(){		// 날짜 선택을 하면
		$(this).parents(".modal").hide(); // 모달창을 내려주고
		$('#selectdate').text(this.value); // 날짜에 버튼을 누른 날짜 띄워주기
		
		movie_time(this.value);
	});
	



}

function movie_time(chkdate){
	
	$.ajax({
		url : "../reserveuser/" + mov_num,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				data_aa = data;
				time(chkdate);
			}
		}
	}); // end $.ajax()
} // end movie_time()

function time(chkdate){
	mov_time = "";	// 영화 시간
	
	mov_time += "<select id='mov_time' onchange='movie_time_chk()'>";
    mov_time += "<option value=''>시간선택</option>";
    
    
    for(i = 0; i < data_aa.data.length; i++){
    	if(data_aa.data[i].shw_date.replace(/-/g,"") == data_aa.todaydate  && data_aa.data[i].shw_time > data_aa.hour && data_aa.data[i].shw_date == chkdate){
    		mov_time += "<option id='mov_time' value='"+ data_aa.data[i].shw_screenName +"' value2='"+  data_aa.data[i].shw_time +"' value3='"+ chkdate +"'>"+ data_aa.data[i].shw_screenName+ "관 " + data_aa.data[i].shw_time +"시</option>";    		
    	} else if(data_aa.data[i].shw_date.replace(/-/g,"") != data_aa.todaydate && data_aa.data[i].shw_date == chkdate) {
    		mov_time += "<option id='mov_time' value='"+ data_aa.data[i].shw_screenName +"' value2='"+  data_aa.data[i].shw_time +"' value3='"+ chkdate +"'>"+ data_aa.data[i].shw_screenName+ "관 " + data_aa.data[i].shw_time +"시</option>";
    	}
    }
    
    mov_time += "</select>\n";
    	
    $("#movietime").html(mov_time);
}

function movie_time_chk(){
	mov_peoplecnt = "";	// 영화 인원선택
	
	mov_peoplecnt += "<select id='mov_peoplecnt' onchange='people_chk()'>\n";
	mov_peoplecnt += "<option value=''>인원선택</option>";
	mov_peoplecnt += "<option value='1'>1</option>";
	mov_peoplecnt += "<option value='2'>2</option>";
	mov_peoplecnt += "<option value='3'>3</option>";
	mov_peoplecnt += "<option value='4'>4</option>";
	mov_peoplecnt += "<option value='5'>5</option>";
	mov_peoplecnt += "</select>\n";
	
	$("#peopleCnt").html(mov_peoplecnt);
	
	
}

function paychk(){
	var result = $("#mov_peoplecnt").val()*9000;
	$("#pay").html(result+"원");
}

function people_chk(){
	mov_seat = ""; // 영화 좌석 선택
	paychk()
	mov_seat += "<button id='seatbtn' onclick='seat_chk()' >좌석보기</button>";
	mov_seat += "<span>"+ $("#mov_time option:selected").text() +"</span>";
	
	$("#seat").html(mov_seat);
	
}

function seat_chk(){
	
	if($("#mov_time option:selected").attr('value') == null || $("#mov_time option:selected").attr('value2') == null
	|| $("#mov_peoplecnt option:selected").attr('value') == null || $("#mov_time option:selected").attr('value') == '' 
		|| $("#mov_time option:selected").attr('value2') == '' || $("#mov_peoplecnt option:selected").attr('value') == ''){
		alert('상영시간과 인원을 선택해주세요.');
	} else {
	
	var items = data_aa.data;
	var seatline; // 칸
	var seatrow;  // 줄(행)
	var result;	
	var cnt = 1;	// 좌석 번호
	
	

	
	for(var i = 0; i < items.length; i++){	// 선택된 관이름과 시간으로 좌석 row와 line 가져옴(이미
											// 들어올떄 mov_num으로 선택해서 값을 가져온거라서 그건
											// 체크 안해도됨)
		if(items[i].shw_screenName == $("#movietime option:selected").attr('value')){
			if(items[i].shw_time == $("#movietime option:selected").attr('value2')){
				if(items[i].shw_date == $("#movietime option:selected").attr('value3')){
					seatline = items[i].shw_seatLine;
					seatrow = items[i].shw_seatRow;
				}
				
			}
		}
	}
	
	for (var i = 0; i < seatrow; i++) {
		result += "<tr>";
		for(var j = 0; j < seatline; j++){
			result += "<td><input type='checkbox' class='seatbox' id='box"+ cnt +"번' value='"+ cnt +"번'><label for='box"+ cnt +"번'>"+ cnt +"번</label></td>";
			cnt ++;
		}
		result += "</tr>";
	}
	
	$("#table").html(result);
	$(".seatModal").show(); // 좌석 선택 모달창 보여주기
	
	$.ajax({
		url : "../reserveuser/" + mov_num,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				var reserveCnt = data.reserveCntAll;
				modalseat(reserveCnt)
				
			}
		}
	}); // end $.ajax()
	
	
	
	
	$("input[type='checkbox']").on("click",function(){		// 체크박스(좌석선택) 선택한 인원
															// 이상 선택하면 비활성화 시키기
		var peoplenum = $("#mov_peoplecnt").val()
		var count = $("input[type='checkbox']:checked").length;
		if(count > peoplenum-1){	// 체크한 인원 이상 선택했을시
			$(":checkbox:not(:checked)").attr("disabled", "disabled");
		}else {
			$("input[type='checkbox']:checkbox").removeAttr("disabled");
        }
	});
	
	}
}

function modalseat(reserveCnt){
	var leavecnt = 0;	// 예약된 좌석수
	$.ajax({	// tb_reserve의 정보가 들어있는 url 연결
		url : "../reserveinfo/1/" + reserveCnt,
		type : "GET",
		cache : false,
		success : function(data, status){
			if(status == "success"){
				for (var i = 0; i < reserveCnt; i++) {
					if(data.data[i].res_totalPeople == 1 && data.data[i].res_screenName == $("#movietime option:selected").attr('value')
							&& data.data[i].res_time == $("#movietime option:selected").attr('value2') && data.data[i].res_date == $("#movietime option:selected").attr('value3')){
						$("#box"+data.data[i].res_seat).attr("disabled", "disabled");
						$("#box"+data.data[i].res_seat).attr("type", "hidden")
						leavecnt++;
					} else if(data.data[i].res_totalPeople != 1 && data.data[i].res_screenName == $("#movietime option:selected").attr('value')
							&& data.data[i].res_time == $("#movietime option:selected").attr('value2') && data.data[i].res_date == $("#movietime option:selected").attr('value3')){
						var seatArr = data.data[i].res_seat.split(",");
						for (var j = 0; j < seatArr.length; j++) {
							$("#box"+seatArr[j]).attr("disabled", "disabled");
							$("#box"+seatArr[j]).attr("type", "hidden")
							leavecnt++;
						}
					}
				}
				if($("#mov_peoplecnt option:selected").attr('value') > (seatline*seatrow)-leavecnt){
					alert('남아있는 좌석의 개수가 ' + ((seatline*seatrow)-leavecnt) + '자리 있습니다. 현재인원수는 예약이 불가합니다.')
					$(".seatModal").hide();
				}
			}
		}
	}); // end $.ajax()
}
	
function success(){
	$("#successbtn").html("<button onclick='reserve_sucbtn()'>예매</button>");

}

function reserve_sucbtn(){	// 마지막 예매 버튼을 눌렀을때
	
	
	if($("#mov_time option:selected").attr('value') == null || $("#mov_time option:selected").attr('value2') == null
			|| $("#mov_peoplecnt option:selected").attr('value') == null || $("#seatnumplus").text() == null 
			|| $("#mov_time option:selected").attr('value') == '' || $("#mov_time option:selected").attr('value2') == '' 
			|| $("#mov_peoplecnt option:selected").attr('value') == '' || $("#seatnumplus").text() == ''){
		alert('상영시간, 인원선택, 좌석선택을 해주세요.')
	} else {
		// ajax insert 연결해야댐
		
		$.ajax({
			url : "../reserveuser/" + mov_num,
			type : "GET",
			cache : false,
			success : function(data, status){
				if(status == "success"){
					var reserveCnt = data.reserveCntAll;
					reservenow(reserveCnt);
					
				}
			}
		}); // end $.ajax()
	}
}
	
	

function reservenow(reserveCnt) {
	
	var seatoverlapChk;
	var seatoverlapChk2;
	

	$.ajax({ // tb_reserve의 정보가 들어있는 url 연결
		url : "../reserveinfo/1/" + reserveCnt,
		type : "GET",
		cache : false,
		success : function(data, status) {
			if (status == "success") {
				var final = true;
				outer : for (var i = 0; i < reserveCnt; i++) {
					
					if (data.data[i].res_screenName == $("#movietime option:selected").attr('value')
							&& data.data[i].res_time == $("#movietime option:selected").attr('value2')
							&& data.data[i].res_date == $("#movietime option:selected").attr('value3')
							&& data.data[i].res_movieNum == mov_num) {
						seatoverlapChk = (data.data[i].res_seat.split(","));	// 이미
																				// 예약된좌석들
						seatoverlapChk2 = ($("#seatnumplus").text().split(","))	// 예약하려고
																				// 누른
																				// 좌석
							 for (var k = 0; k < seatoverlapChk.length; k++) {
								for (var j = 0; j < seatoverlapChk2.length; j++) {
									if(seatoverlapChk[k] == seatoverlapChk2[j]){
										alert('예약이 되지 않았습니다. 다시 시도해주세요')
										final = false;
										break outer;
									} else {
										final = true;
									}
								}
							}
					}
					
				}// outer
				if(reserveCnt==0){
					final = true;
					reservefinal(final)
				} else {
					reservefinal(final)
				}
			}
		}
	}); // end $.ajax()
}


function reservefinal(final) {
	var screenNum;
	
	if(final){
		
		for (var i = 0; i < data_aa.data.length; i++) {
			if (data_aa.data[i].shw_movieNum == mov_num
					&& data_aa.data[i].shw_screenName == $(
							"#mov_time option:selected").attr('value')
					&& data_aa.data[i].shw_date == $('#selectdate').text()
					&& data_aa.data[i].shw_time == $("#mov_time option:selected")
							.attr('value2')) {
				screenNum = data_aa.data[i].shw_screenNum;
			}
		}

		var param = "res_movieNum=" + mov_num;
		param += "&res_movieName=" + data_aa.data[0].shw_movieName;
		param += "&res_screenNum=" + screenNum;
		param += "&res_screenName=" + $("#mov_time option:selected").attr('value');
		param += "&res_date=" + $('#selectdate').text();
		param += "&res_time=" + $("#mov_time option:selected").attr('value2');
		param += "&res_seat=" + $("#seatnumplus").text();
		param += "&res_totalPeople="
				+ $("#mov_peoplecnt option:selected").attr('value');
		param += "&res_memberUid=" + mem_uid;
		param += "&res_memberId=" + mem_id;
		param += "&res_pay=" + $("#pay").text().replace("원", "");
		param += "&res_code=" + $("#mov_time option:selected").attr('value')
				+ $('#selectdate').text().replace(/-/g, "")
				+ $("#mov_time option:selected").attr('value2') + 1;

		$.ajax({
			url : "../reserveuser",
			type : "POST",
			cache : false,
			data : param,

			success : function(data, status) {
				if (status == "success") {
					if (data.status == "OK") {
						alert("예약이 완료되었습니다 ");
						location.href = path + "/";
					} else {
						alert("예약이 되지 않았습니다. 다시 시도해주세요.")
						alert("INSERT 실패 " + data.status + " : " + data.message);
					}
				}
			}
		});
	}
}



