<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html5>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>본격! 게시판 - 게시글 리스트</title>
	<!-- BootStrap, JQuery load -->
	<link rel="stylesheet"
		href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-sm-1"></div>
			<div class="col-sm-10">
				<!-- 직원 추가 -->
				<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#myModal">
					<span class="glyphicon glyphicon-plus"></span> Add
				</button>
					<!-- 직원 리스트 -->
					<div style="height: 700px; overflow: auto">
						<table class="table table-hover">
							<tr>
								<th>직원번호</th>
								<th>직급</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th class="text-center">수정</th>
								<th class="text-center">삭제</th>
							</tr>
							<c:forEach items="${StaffList}" var="Staff">
								<tr>
									<!-- jstl의 표현식은 스크립트릿과 속성이 같아서 어디에쓰나 우선됨 -->
									<td>${Staff.index}</td>
									<td>${Staff.position}</td>
									<td>${Staff.name}</td>
									<td>${Staff.tel}</td>
									<td>${Staff.email}</td>
									<td class="text-center">
										<button type="button" class="btn btn-default btn-sm">
								        	<span class="glyphicon glyphicon-edit"></span>
								        </button>
							        </td>
									<td class="text-center">
										<button type="button" class="btn btn-default btn-sm">
								        	<span class="glyphicon glyphicon-remove"></span>
								        </button>
							        </td>
								</tr>
							</c:forEach>
						</table>
					</div>
			</div>
			<div class="col-sm-1"></div>
		</div>
	</div>
	
	
	<!-- 직원 추가 Modal-->
	<div id="myModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">직원 추가하기</h4>
				</div>
				<div class="modal-body">
					<iframe src="http://localhost:8080/staff_mng/event/addStaff.jsp" width="100%" height="370px" style="border:0 solid #FFFFFF;"></iframe>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		/* 직원추가 종료: iframe(자식페이지)에서 부모의 함수를 호출하기 위함=parent.staffAddModalClose() */
		function staffAddModalClose() {
			   $('#myModal').modal('toggle');
			   //추가된 직원까지 새로 로드
			   location.href='http://localhost:8080/staff_mng/list.do';
		}
	</script>
</body>
</html>