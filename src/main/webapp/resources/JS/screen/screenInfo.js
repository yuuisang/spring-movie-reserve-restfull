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

// 페이지 최초 로딩되면 게시글 목록 첫페이지분 로딩
// [이전] 버튼 눌렀을때 -> 이전 페이지 게시글목록 로딩
// [다음] 버튼 눌렀을때 -> 다음 페이지 게시글목록 로딩


$(document).ready(function(){
    // 페이지 최초 로딩되면 1페이지 분량 읽어오기
    loadPage(page);
       
});


// page번째 목록 읽어오기
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
        }

    });
} // end loadPage()

function addViewEvent(){
	
	// 상영관 등록 
	$("#btnRegist").click(function(){
    	chkWrite();
    });
	
	// 해당 상영관 삭제
	$("#screenTable button").click(function(){
		var td = $(this).parent();
		var tr = td.parent();
		var td1 = tr.children(".scr_num");
		
		var scr_num = td1.text();
		var bool = true;
		
		$.ajax({
	        url : "./" + page + "/" + window.pageRows,
	        type : "GET",
	        cache : false,
	        async : false,
	        success : function(data, status){
	        	
	            if(status == "success"){
	            	if(data.list2.length >= 1){
	            		outer : for(var chk=0; chk<data.list2.length; chk++){
	            			if(data.list2[chk].shw_screenNum == scr_num){
	            				alert('해당상영관은 상영스케줄이 예약되어 있으므로 삭제가 불가능합니다.');
	            				bool=false;
	            				break outer;
	            				//return false;
	            			} else {
	            				bool = true;
	            			}
	            		}//end for
	            		
	            	}// end if
	            
	            	// 선택한 영화관 고유번호 파라미터로 실어보냄
        			deleteUid(scr_num,bool);
	        		
	            }
	       
	        }

	    });
		
		
	});
}

function updateList(jsonObj){
    result = "";  // 최종 결과물

    if(jsonObj.status == "OK"){
        var count = jsonObj.count;

        window.page = jsonObj.page;
        window.pageRows = jsonObj.pagerows; 

        var items = jsonObj.data;  // 상영관 배열

        var i;
        for(i = 0; i < count; i++){

            result += "<tr>\n";
            result += "<td class='scr_num'>" + items[i].scr_num + "</td>\n";
            result += "<td>" + items[i].scr_name + "</td>\n";
            result += "<td>" + items[i].scr_seatRow + "</td>\n";
            result += "<td>" + items[i].scr_seatLine + "</td>\n";
            result += "<td><button type='submit' class='btn btn-secondary btn-sm' id='btnDelete"+ items[i].scr_num +"'>삭제</button>" + "</td>\n";
            result += "</tr>\n";
        }
        $("#screenTable tbody").html(result);   // 목록 업데이트

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
        
        var pagination = buildPagination(jsonObj.writepages, jsonObj.totalpage, jsonObj.page, jsonObj.pagerows);
        $("#pagination").html(pagination);

    	
    	
        return true;
    } else {
        alert("내용이 없습니다");
        return false;
    }
}

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


// 영화관 등록
function chkWrite(){
	// 특정 form 의 name 달린 form element 들의 value들을 string 타입으로 묶기
    // ex) name=aaa&subject=bbb&content=ccc   <-- string 타입
    var data = $("#frmRegist").serialize();
    //alert(data);
    $.ajax({
        url: ".",
        type: "POST",
        cache: false,
        data: data,
        success: function(data, status){
        	if(status == "success"){
                if(data.status == "OK"){
                	//alert("INSERT 성공 " + data.count + "개:" + data.status);
                	alert("상영관 등록이 완료되었습니다");
                }else {
                    alert("INSERT 실패 " + data.status + " : " + data.message);
                } 
            }
        }
    });
    
    // request 후, 기존에 입력된 내용 지우기
    $('#frmRegist')[0].reset();
    loadPage(1);
    
    return false;
}




// 특정 uid 의 글 삭제하기
function deleteUid(scr_num,bool){
	
	if(bool){
		if(!confirm("해당 상영관을 삭제하시겠습니까?")) return false;
		
		// POST 방식
		$.ajax({
			url : ".",
			type : "DELETE",
			data : "scr_num=" + scr_num,
			cache : false,
			async : false,
			success : function(data, status){
				if(status == "success"){
					if(data.status == "OK"){						
						//alert("DELETE성공 " + data.count + "개:");  // 설사 이미 지워져서 0개를 리턴해도 성공이다.
						loadPage(window.page);  // 현제페이지 로딩
					} else {
						//alert("DELETE실패 " + data.message);
						//return false;
					}
				}
			}
		});
	}

	
	//return true;
} // end deleteUid(uid)

