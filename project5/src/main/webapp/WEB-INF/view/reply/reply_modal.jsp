<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>



<script>
	$(function(){
		
// 		//showList 코드 시작
// 		var bnoValue='<c:out value="${board.bno}"/>';
// //	 	var bnoValue='100';
// 		var replyUL=$(".chat");
		
// 		showList(1);
		
// 		function showList(page){
			
			
// 			replyService.getList({bno:bnoValue,page : page || 1}, function(list){
				
// 				var str = "";
// 				if(list == null || list.length == 0){
// 					replyUL.html("");
					
// 					return;
// 				}
// 				for(var i =0, len = list.length || 0; i<len; i++){
// 					str += "<li class  = 'left clearfix' data-rno = '"+list[i].rno+"'>";
// 					str += "	<div><div class = 'header'><strong class = 'primary-font'>"+list[i].replyer+"</strong>";
// 					str += "		<small class = 'pull-right text-muted'>"+replyService.displayTime(list[i].replyDate)+"</small></div>";
// 					str += "			<p>"+list[i].reply+"</p></div></li>";
// 				}
// 				replyUL.html(str);
				
				
// 			}); // end function
// 		} // end showList 끝
		
		
		
		
		
		
		
		
// 		//댓글 조회 클릭 이벤트 처리
// 		$(".chat").on("click", "li", function(e){
			
// 			var rno=$(this).data("rno");
			
// 			replyService.get(rno, function(reply){
				
// 				modalInputReply.val(reply.reply);
// 				modalInputReplyer.val(reply.replyer);
// 				modalInputReplyDate.val(replyService.displayTime(reply.replyDate))
// 									.attr("readonly", "readonly");
// 				modal.data("rno", reply.rno);
				
// 				modal.find("button[id !='modalCloseBtn']").hide();
// 				modalModBtn.show();
// 				modalRemoveBtn.show();
				
// 				$(".modal").modal("show");
// 			});
// 		});
		
// 		modalModBtn.on("click", function(e){
// 			var reply={
// 					   rno:modal.data("rno"), 
// 					   reply: modalInputReply.val()
// 					   };
			
// 			replyService.update(reply, function(result){
				
// 				alert(result);
// 				modal.modal("hide");
// 				showList(1);
				
// 			});
// 		});
		
// 		modalRemoveBtn.on("click", function(e){
			
// 			var rno = modal.data("rno");
// 			modal.modal("hide");
// 			replyService.remove(rno, function(result){
				
// 				alert(result);
// // 				modal.modal("hide");    //여기서 하면 이미 제거되어있는걸 실행하게 돼서 에러가 남 그래서 위로 옮김
// 				showList(1);
				
// 			});
// 		});
	});
</script>




