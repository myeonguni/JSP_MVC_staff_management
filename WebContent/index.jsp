<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<form action="index.html" method="post" onsubmit="return formCheck();">
	직급 <select name="position">
		<option selected value="1">사원</option>
		<option value="2">대리</option>
		<option value="3">과장</option>
		<option value="4">차장</option>
		<option value="5">부장</option>
		<option value="6">임원</option>
		<option value="6">대표</option>
	</select><br /> 이름 <input type="text" name="name" placeholder="홍길동" /><br />
	전화번호 <input type="tel" name="phone" placeholder="010-1234-5678" /><br />
	이메일 <input type="email" name="email" placeholder="test@test.com" /><br />
	<input type="submit" />
</form>

<script>
	function formSubmit() {
		var params = jQuery("#formname1").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
		jQuery.ajax({
			url : '샘플ajax.php',
			type : 'POST',
			data : params,
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'html',
			success : function(result) {
				if (result) {
					// 데이타 성공일때 이벤트 작성
				}
			}
		});
	}
</script>
</script>