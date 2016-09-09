<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="com.staff.beans.staff"%>
<%@ page import="java.util.ArrayList"%>







<c:forEach items="${articleList}" var="article">
	<tr>
		<td>${article.idx}</td>
		<!-- jstl�� ǥ������ ��ũ��Ʈ���� �Ӽ��� ���Ƽ� ��𿡾��� �켱�� -->
		<td><a href='content.jsp?idx=${article.idx}'>${article.title}</a></td>
		<td>${article.writer}</td>
		<td>${article.regdate}</td>
		<td>${article.count}</td>
	</tr>
</c:forEach>






<script>
	function formSubmit() {
		var params = jQuery("#formname1").serialize(); // serialize() : �Էµ� ���Element(��)�� ���ڿ��� �����Ϳ� serialize �Ѵ�.
		jQuery.ajax({
			url : 'adStaff.php',
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
<%@ page import="java.sql.*"%>
<%
	try {
		String driverName = "oracle.jdbc.driver.OracleDriver"; //�����ͺ��̽��� �����ϱ����� ����̹��� �ε��մϴ�.
		String url = "jdbc:oracle:thin:@localhost:1521:XE"; //���� URL������ ��Ʈ��ȣ(oracle��Ʈ), sid(oracle����)
		Class.forName(driverName);
		Connection con = DriverManager.getConnection(url, "system", "1234"); // getCo... : �������� url, id, pw
		out.println("Oracle �����ͺ��̽� db�� ���������� �����߽��ϴ�");
		Statement stmt = con.createStatement(); // SQL ������ ���������� Statement ��ü ����
		String sql = "INSERT INTO BOARD " + "(IDX, TITLE, WRITER, REGDATE, COUNT, CONTENT) " + "VALUES (" + 2
				+ ", '" + title + "', '" + writer + "', '" + regdate + "', '1', '" + content + "')";
		stmt.executeUpdate(sql);
		con.close();
	} catch (Exception e) {
		out.println("Oracle �����ͺ��̽� db ���ӿ� ������ �ֽ��ϴ�. <hr>");
		out.println(e.getMessage());
		e.printStackTrace();
	}
%>
</script>