<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 삭제, 등록 확인 Modal-->
    <div class="modal fade" id="confirmModal" tabindex="-1" role="dialog" aria-labelledby="confirmModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmModalLabel">확인</h5>
                    <button class
                    ="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">처리가 완료 되었습니다.</div>
                <div class="modal-footer">
                    <button class="btn btn-default" type="button" data-dismiss="modal">Close</button>
                    <button class="btn btn-primary" type="button">Save Change</button>
                </div>
            </div>
        </div>
    </div>

	<script type="text/javascript">
		$(function(){
			const result='<c:out value="${result}"/>';
			
			checkModal(result);
			
			history.replaceState({},null,null);
			
			function checkModal(result){
				if (result===''||history.state){
					return;
				}
								
				if(parseInt(result)>0){
					$(".modal-body").html(
							"게시글"+parseInt(result)+" 번이 등록되었습니다.");
				}	
					$("#confirmModal").modal("show");
				
			}
			
			var actionForm=$("#actionForm");
			
			$(".page-item a").on(
					"click",
					function(e){
						
						e.preventDefault();
						
						console.log('click');
						
						actionForm.find("input[name='pageNum']")
								.val($(this).attr("href"));
						actionForm.submit();
					});
			$(".move").on(
					"click",
					function(e){
						
						e.preventDefault();
						actionForm.append("<input type='hidden' name='bno' value='"
								+$(this).attr("href")+"'>");
						actionForm.attr("action","/board/get");
						actionForm.submit();
					});
		
		
		var searchForm = $("#searchForm");
		
		$("#searchForm button").on(
				"click",
				function(e){
					
					if(!searchForm.find("option:selected")
							.val()){
						alert("검색종류를 선택하세요");
						return false;
					}
					
					if(!searchForm.find(
							"input[name='keyword']").val()){
						alert("키워드를 입력하세요");
						return false;
					}
					
					searchForm.find("input[name='pageNum']")
							.val("1");
					e.preventDefault();
					
					searchForm.submit();
				});
		});
	</script>