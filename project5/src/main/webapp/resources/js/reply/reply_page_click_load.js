console.log("Reply Page Num Click");

$(function(){
	
	var pageUI = $(".panel-footer");
	
	var pageNumReply = $("input#pageNumReply");
	
	pageUI.on("click", "li a", function(e){
		
		e.preventDefault();
		console.log("page num click");
		
		var pageNum=$(this).attr("href");
		
		pageNumReply.val(pageNum);
		
		console.log("targetPageNum : "+pageNum);
		
		var bnoValue=$("#operForm").find("#bno").val();
		var replyUL=$(".chat");
		
		replyList.showList(pageNum, bnoValue, replyUL, pageUI);
	});
});