<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>

	console.log("============");
	console.log("AJAX TEST");
	
	var bnoValue='<c:out value="${board.bno}"/>';
	
	//1. 댓글 목록 테스트
// 	replyService.getList(
// 			{bno:bnoValue, page:1}
// 			,
// 			function(list){
// 				console.log("리플 에이젝스 테스트의 getList부분 실행됨");
// 				for(var i=0, len = list.length||0; i<len; i++){
// 					console.log(list[i]);
// 				}
// 			}
// 	);
	
	//2. 댓글 입력 테스트
// 	replyService.add(
// 						{reply:"테스트 댓글 123", replyer: "강개토", bno:bnoValue}
// 						,
// 						function(result){
// 							alert("RESULT: "+ reulst);
// 						}
// 	)
	
	//3. 댓글 수정 테스트
// 	replyService.update(
// 			{rno : 26, bno : bnoValue, reply : "수정테스트!!!"}
// 			,function(result){
// 				alert("수정완료...");
// 			}
// 	)

	//4. 댓글 삭제 테스트
// 	replyService.remove(
// 			25
// 			,
// 			function(count){
// 				console.log(count);
// 				if(count==="success"){
// 					alert("REMOVED");
// 				}
// 			}
// 			,
// 			function(err){
// 				alert('ERROR...');
// 			}
// 	)
	//5. 댓글 1개 조회 테스트
// 	replyService.get(
// 			26
// 			,
// 			//콜백 함수를 만든다   매개변수는 적당히 count라고 짓는다
// 			function(count){
// 				console.log("==============",count,"==============");
// 				alert("get만 성공 (count가 success가 아니여도 실행됨)");
// 				if(count==="success"){
// 					alert("get 성공 (count도 success!!!)");        // 어째선지 count가 success로 안 나온다...
// 				}
// 			}
// 			,
// 			function(err){
// 				alert('ERROR...');
// 			}
// 	)
	
</script>




