<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<form action="index.html" method="post" onsubmit="return formCheck();">
	���� <select name="position">
		<option selected value="1">���</option>
		<option value="2">�븮</option>
		<option value="3">����</option>
		<option value="4">����</option>
		<option value="5">����</option>
		<option value="6">�ӿ�</option>
		<option value="6">��ǥ</option>
	</select><br /> �̸� <input type="text" name="name" placeholder="ȫ�浿" /><br />
	��ȭ��ȣ <input type="tel" name="phone" placeholder="010-1234-5678" /><br />
	�̸��� <input type="email" name="email" placeholder="test@test.com" /><br />
	<input type="submit" />
</form>

<script>
	function formSubmit() {
		var params = jQuery("#formname1").serialize(); // serialize() : �Էµ� ���Element(��)�� ���ڿ��� �����Ϳ� serialize �Ѵ�.
		jQuery.ajax({
			url : '����ajax.php',
			type : 'POST',
			data : params,
			contentType : 'application/x-www-form-urlencoded; charset=UTF-8',
			dataType : 'html',
			success : function(result) {
				if (result) {
					// ����Ÿ �����϶� �̺�Ʈ �ۼ�
				}
			}
		});
	}
</script>
</script>