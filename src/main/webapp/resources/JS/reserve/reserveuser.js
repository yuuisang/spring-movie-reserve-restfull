var selectdate = ""; // 선택한 날짜(버튼을 누른 날짜에 value 값)
var moviename = ""; // 선택한 영화 이름
var list = new Array();

$(document).ready(function() {
	// 모달 대화상자 close 버튼 눌리면
	$(".modal .close").click(function() {
		$(this).parents(".modal").hide();
	});

	$(".dateChkbtn").click(function() { // 날짜 선택을 하면
		$(this).parents(".modal").hide(); // 모달창을 내려주고
		selectdate = this.value;
		$('#selectdate').text(this.value); // 날짜에 버튼을 누른 날짜 띄워주기

		moviename = $('#moviename').text(); // 선택된 영화 이름 변수에 담아줌
		list = $("#aaa").val();

		//alert(selectdate);
		//alert(moviename);
		//alert(list);

		for (var i = 0; i < list.length; i++) {
			alert(list[i]);
		}

		//    	$.each(list, function(index,item){
		//    		var result = "index : " + index + " / item : " + item.shw_num;
		//    		
		//    		alert(result);
		//    	});

	});

});
