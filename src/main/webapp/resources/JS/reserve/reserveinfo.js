var page = 1;
var pageRows = 10;
var viewItem = undefined;   //  가장 최근에 view 한 글의 데이터


$(document).ready(function(){
    loadPage(page);
});


//page번째 목록 읽어오기
function loadPage(page){
    $.ajax({
        url : "../reserveinfo/" + page + "/" + window.pageRows,
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

function updateList(jsonObj){
    result = "";  // 최종 결과물

    if(jsonObj.status == "OK"){
        var count = jsonObj.count;

        window.page = jsonObj.page;
        window.pageRows = jsonObj.pagerows;

        var items = jsonObj.data;  // 글 배열

        var i;
        for(i = 0; i < count; i++){
            var date = new Date(items[i].res_paytime);

            result += "<tr>\n";
            result += "<td class='res_num'>" + items[i].res_num + "</td>\n";
            result += "<td>" + items[i].res_code + "</td>\n";
            result += "<td>" + items[i].res_memberId + "</td>\n";
            result += "<td>" + items[i].res_movieName + "</td>\n";
            result += "<td>" + items[i].res_screenName + "</td>\n";
            result += "<td>" + items[i].res_date + "</td>\n";
            result += "<td>" + items[i].res_time + "</td>\n";
            result += "<td>" + items[i].res_seat + "</td>\n";
            result += "<td>" + items[i].res_pay + "</td>\n";
            result += "<td>" + date.getFullYear() + "/" + (date.getMonth() + 1) + "/" + date.getDate() + "</td>\n";
            result += "<td>" + "<div class='d01'>"+"<div class='left'>"+"<button type='button' class='btnCancel btn danger'>"+"취소"+"</button>"+"</div>"+"</div>" + "</td>"
            result += "</tr>\n";
        }

        $("#list tbody").html(result);   // 글 목록 업데이트

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
}



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


function addViewEvent(){
	// 취소 버튼을 눌렀을때 event
	 $(".btnCancel").click(function(){
	 		var res_num = $(this).parent().parent().parent().parent().children(".res_num").text();
	 		deleteUid(res_num);
	 });
}


//특정 uid 의 글 삭제하기
function deleteUid(res_num){
        
    if(!confirm(res_num + "번 예매를 삭제하시겠습니까?")) return false;
    
    // POST 방식
    $.ajax({
        //url : "deleteOk.ajax",
        url : "../reserveinfo",
        type : "DELETE",
        data : "res_num=" + res_num,            
        cache : false,
        success : function(data, status){
            if(status == "success"){
                if(data.status == "OK"){                        
                    alert("DELETE성공 " + data.count + "개:");  // 설사 이미 지워져서 0개를 리턴해도 성공이다.
                    loadPage(window.page);  // 현제페이지 로딩
                } else {
                    alert("DELETE실패 " + data.message);
                    return false;
                }
            }
        }
    });
    
    return true;
} // end deleteUid(res_num)




   
