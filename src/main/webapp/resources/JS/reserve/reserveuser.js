var selectdate="";

$(document).ready(function(){
	// 모달 대화상자 close 버튼 눌리면
    $(".modal .close").click(function(){
        $(this).parents(".modal").hide();
    });
    
    $(".dateChkbtn").click(function(){
    	$(this).parents(".modal").hide();
    });
    
    $('#dateselect').text('#dd');
    
});

