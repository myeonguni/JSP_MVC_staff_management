<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!-- jQuery 원격 Lib address load -->
<script src="https://code.jquery.com/jquery-1.10.2.js"></script>

<!-- 직원 추가 양식 -->
<form>
	직급 <select id="position" name="position"> 
		<option selected value="1">사원</option>
		<option value="2">대리</option> 
		<option value="3">과장</option>
		<option value="4">차장</option>
		<option value="5">부장</option>
		<option value="6">임원</option>
		<option value="6">대표</option>
	</select><br />
	이름 <input type="text" id="name" name="name" placeholder="홍길동" /><br />
	전화번호 <input type="tel" id="tel" name="tel" placeholder="010-1234-5678"/><br />
	이메일 <input type="email" id="email" name="email" placeholder="test@test.com"/><br />
	<input type="button" value="추가하기" onclick="formCheck()" />
</form>

<script>
	/* 폼 입력 값 유효성 체크 */
	function formCheck() {
		// 입력 값 유효성 체크1: 값을 입력하였는지 → 아래 루프 코드 참고
		for(var i = 0; i < document.forms[0].length-1; i++){ // submit 제외 모든 input 태그의 갯수만큼 루프를 돌면서
		    if(document.forms[0][i].value == null || document.forms[0][i].value == ""){
		        alert(document.forms[0][i].name + "을/를 입력하여 주세요."); // 경고창을 띄우고
		        document.forms[0][i].focus(); // null인 태그에 포커스를 줌
		        return false;
		    }
		}
		// 입력 값 유효성 체크2: 전화번호, 이메일주소 정규표현식 사용하여 유효성 검사 진행(RegExp 객체의 match 메소드 사용)
		var regTel = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/;
		var regEmail = /[0-9a-zA-Z][_0-9a-zA-Z-]*@[_0-9a-zA-Z-]+(\.[_0-9a-zA-Z-]+){1,2}$/;
        if(!$("#tel").val().match(regTel)){
        	alert("전화번호 형식을 확인하여 다시 입력해주세요.");
        	$("#tel").focus();
        }else if(!$("#email").val().match(regEmail)){
        	alert("이메일 형식을 확인하여 다시 입력해주세요.");
        	$("#email").focus();
        }else{
    		// 유효성 체크에 이상이 없을 경우 ajax를 이용한 비동기통신 함수 호출
    		formSubmit();
        }
	}
	
	/* 직원 추가 이벤트에 따른 비동기통신 실시 */
	function formSubmit() {
		var params = {
				name : $("#name").val(),
				position : $("#position").val(),
				tel : $("#tel").val(),
				email : $("#email").val()
		}
		$.ajax({
			url : 'addStaffEvent.jsp',
			type : 'POST',
			data : params,
			success : ajaxSuccess,
			error : ajaxError
		});
	}
	
	/* 직원 추가 이벤트에 따른 비동기통신이 성공일 경우 */
	function ajaxSuccess(resdata){
		if (resdata) {
			alert(resdata);
			// 데이타 성공일때 이벤트 작성
		}
    }

	/* 직원 추가 이벤트에 따른 비동기통신이 실패일 경우 */
    function ajaxError(){
        alert("Error");
    }
</script>