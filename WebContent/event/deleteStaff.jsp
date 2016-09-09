<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>

<!-- BootStrap, JQuery load -->
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<div class="text-center">
	<h4>정말 삭제하시겠습니까?</h3>
	<button onclick="formSubmit()" class="btn btn-default">YES</button>&nbsp;&nbsp;&nbsp;
	<button onclick="parent.staffDeleteModalClose()" class="btn btn-default">NO</button>
</div>

<script>
	var del_index; //삭제 될 직원 index 값 저장 변수
	
	/* 삭제 직원 index 초기 값 로드 */
	function deleteInit(index) {
		del_index = index;
	}
	
	/* 직원 삭제 이벤트에 따른 비동기통신 실시 */
	function formSubmit() {
		var param = { // JSON 포맷으로 생성 
			index : del_index
		}
		$.ajax({
			url : 'http://localhost:8080/staff_mng/event/deleteStaffAjax.do',
			type : 'POST',
			data : param,
			success : ajaxSuccess,
			error : ajaxError
		});
	}

	/* 직원 삭제 이벤트에 따른 비동기통신이 성공일 경우 */
	function ajaxSuccess(resdata) {
		if (resdata == "true") {
			// 데이타 성공일때 이벤트 작성
			alert("삭제 되었습니다.");
			parent.staffAddModalClose();
		} else { //false일 경우
			alert("유효하지 않은 요청입니다. 확인 후 다시 요청하여주세요.");
		}
	}

	/* 직원 삭제 이벤트에 따른 비동기통신이 실패일 경우 */
	function ajaxError() {
		alert("유효하지 않은 요청입니다. 확인 후 다시 요청하여주세요.");
	}
</script>
	