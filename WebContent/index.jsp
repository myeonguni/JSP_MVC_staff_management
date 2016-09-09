<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.staff.beans.staff"%>
<%@ page import="java.util.ArrayList"%>







<c:forEach items="${articleList}" var="article">
	<tr>
		<td>${article.idx}</td>
		<!-- jstl의 표현식은 스크립트릿과 속성이 같아서 어디에쓰나 우선됨 -->
		<td><a href='content.jsp?idx=${article.idx}'>${article.title}</a></td>
		<td>${article.writer}</td>
		<td>${article.regdate}</td>
		<td>${article.count}</td>
	</tr>
</c:forEach>






<script>
	function formSubmit() {
		var params = jQuery("#formname1").serialize(); // serialize() : 입력된 모든Element(을)를 문자열의 데이터에 serialize 한다.
		jQuery.ajax({
			url : 'adStaff.php',
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
<%@ page import="java.sql.*"%>
<%
	try {
		String driverName = "oracle.jdbc.driver.OracleDriver"; //데이터베이스에 접속하기위한 드라이버를 로드합니다.
		String url = "jdbc:oracle:thin:@localhost:1521:XE"; //접속 URL정보와 포트번호(oracle포트), sid(oracle버전)
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, "system", "1234"); // getCo... : 계정정보 url, id, pw
		out.println("Oracle 데이터베이스 db에 성공적으로 접속했습니다");
		Statement stmt = con.createStatement(); // SQL 쿼리를 날리기위한 Statement 객체 생성
		String sql = "INSERT INTO BOARD " + "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) " + "VALUES (" + 2
				+ ", '" + title + "', '" + writer + "', '" + regdate + "', '1', '" + content + "')";
		stmt.executeUpdate(sql);
		con.close();
	} catch (Exception e) {
		out.println("Oracle 데이터베이스 db 접속에 문제가 있습니다. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
</script>