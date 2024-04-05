console.log("Reply New Button --> Modal window Load.............")

$(function(){
	var modal=$(".modal");

		var modalInputReply=modal.find("input[name='reply']");
		var modalInputReplyer=modal.find("input[name='replyer']");
		var modalInputReplyDate=modal.find("input[name='replyDate']");
		
		var modalModBtn=$("#modalModBtn");
		var modalRemoveBtn=$("#modalRemoveBtn");
		var modalRegisterBtn=$("#modalRegisterBtn");
		
		$("#addReplyBtn").on("click", function(e){
			
			modal.find("input").val("");
			modalInputReplyDate.closest("div").hide();
			modal.find("button[id!='modalCloseBtn']").hide();
			
			modalRegisterBtn.show();
			
			$(".modal").modal("show");
		});
		
		$("#modalCloseBtn").on("click", function(e){
			
			modal.modal('hide')
		});
		
		
//		var bnoValue='<c:out value="${board.bno}"/>';             //이코드는 왜 쓰면 안되는거지?
		var bnoValue=$("#operForm").find("#bno").val();            //이부분 이해안됨 왜 이코드로 바꿨지
		
		var replyUL=$(".chat");
		
		var pageUI=$(".panel-footer");
		
		
//		alert("bnoValue : ",bnoValue);             //여기에 확인할 땐 bnoValue에 아무것도 없는걸로 나오는데 제대로 작동한다....
		modalRegisterBtn.on("click", function(e){
			
			var reply={
						reply:modalInputReply.val(),
						replyer:modalInputReplyer.val(),
						bno:bnoValue
					  };
//			alert(bno);
			replyService.add(reply, function(result){
				
				alert(result);
				
				modal.find("input").val("");
				modal.modal("hide");
				
//				showList(1);

				replyList.showList(1, bnoValue, replyUL, pageUI);
			});
		});
	
});