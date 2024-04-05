$(document).ready(function(){
	console.log("get_Reply Module......");
	
	var bnoValue='<c:out value="${board.bno}"/>';
//	var bnoValue='100';
	var replyUL=$(".chat");
	
	showList(1);
	
	function showList(page){
		console.log("get_Reply에서의 showList함수 실행......");
		
		replyService.getList({bno:bnoValue,page : page || 1}, function(list){
			console.log("get_Reply에서의 showList함수 안쪽 실행......");
			
			var str = "";
			if(list == null || list.length == 0){
				replyUL.html("");
				
				return;
			}
			for(var i =0, len = list.length || 0; i<len; i++){
				str += "<li class  = 'left clearfix' data-rno = '"+list[i].rno+"'>";
				str += "	<div><div class = 'header'><strong class = 'primary-font'>"+list[i].replyer+"</strong>";
				str += "		<small class = 'pull-right text-muted'>"+list[i].replyDate+"</small></div>";
				str += "			<p>"+list[i].reply+"</p></div></li>";
			}
			replyUL.html(str);
		}); // end function
	} // end showList
	
	//생략된 부분
	
	var PageNum=1;
	
	var replyPageFooter=$(".panel-footer");
	
	function showReplyPage(replyCnt){ //생략
	}
	
	replyPageFooter.on("click","li a",function(e){
		//생략
	})
	
	var modal=$(".modal");
	var modalInputReply=modal.find("input[name='reply']");
	var modalInputReplyer=modal.find("input[name='replyer']");
	var modalInputReplyDate=modal.find("input[name='replyDate']");
	
	var modalModBtn=$("#modalModBtn");
	var modalRemoveBtn = $("#modalRemoveBtn");
	var modalRegisterBtn = $("#modalRegisterBtn");
	
	$("#modalCloseBtn").on("click", function(e){
		//생략
	});
	
	$("#addReplyBtn").on("click", function(e){
		//생략
	});
	
	modalRegisterBtn.on("click",function(e){
		//생략
	});
	
	$(".chat").on("click",function(e){
		//생략
	});
	
	modalModBtn.on("click",function(e){
		//생략
	});
	
	modalRemoveBtn.on("click",function(e){
		//생략
	});
});

