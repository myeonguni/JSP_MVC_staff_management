<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html5>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<title>�� �÷��� ��� �������� ��</title>
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
				<hr>
				<!-- ���� �߰� -->
				<button type="button" class="btn btn-default btn-sm" data-toggle="modal" data-target="#staffAddModal">
					<span class="glyphicon glyphicon-plus"></span> Add
				</button>
				<hr>
				<!-- ���� ����Ʈ -->
				<div style="height: 700px; overflow: auto">
					<table class="table table-hover">
						<tr>
							<th>������ȣ</th>
							<th>����</th>
							<th>�̸�</th>
							<th>��ȭsds��ȣ</th>
							<th>�̸���</th>
							<th class="text-center">����</th>
							<th class="text-center">����</th>
						</tr>
						<c:forEach items="${StaffList}" var="Staff">
							<tr>
								<!-- jstl�� ǥ������ ��ũ��Ʈ���� �Ӽ��� ���Ƽ� ��𿡾��� �켱�� -->
								<td>${Staff.index}</td>
								<td>${Staff.position}</td>
								<td>${Staff.name}</td>
								<td>${Staff.tel}</td>
								<td>${Staff.email}</td>
								<td class="text-center">
									<button type="button" class="btn btn-default btn-sm" onClick="staffEditOpen('${Staff.index}','${Staff.position}','${Staff.name}','${Staff.tel}','${Staff.email}')">
							        	<span class="glyphicon glyphicon-edit"></span>
							        </button>
						        </td>
								<td class="text-center" id="${Staff.index}">
									<button type="button" class="btn btn-default btn-sm" onClick="staffDeleteOpen('${Staff.index}')">
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
	
	
	<!-- ���� �߰� Modal-->
	<div id="staffAddModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Adds Staff</h4>
				</div>
				<div class="modal-body">
					<iframe name="add" src="http://localhost:8080/staff_mng/event/addStaff.jsp" width="100%" height="370px" style="border:0 solid #FFFFFF;"></iframe>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ���� ���� Modal-->
	<div id="staffEditModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Edit Staff</h4>
				</div>
				<div class="modal-body">
					<iframe name="edit" src="http://localhost:8080/staff_mng/event/editStaff.jsp" width="100%" height="370px" style="border:0 solid #FFFFFF;"></iframe>
				</div>
			</div>
		</div>
	</div>
	
	<!-- ���� ���� Modal-->
	<div id="staffDeleteModal" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Delete Staff</h4>
				</div>
				<div class="modal-body" style="height:120px">
					<iframe name="del" src="http://localhost:8080/staff_mng/event/deleteStaff.jsp" width="100%" height="100px" style="border:0 solid #FFFFFF;"></iframe>
				</div>
			</div>
		</div>
	</div>
	
	<script>
		/* �����߰� ����: iframe(�ڽ�������)���� �θ��� �Լ��� ȣ���ϱ� ����=parent.staffAddModalClose() */
		function staffAddModalClose() {
			$('#staffAddModal').modal('toggle');
			//�߰��� ������ ���� ���ε�
			location.href='http://localhost:8080/staff_mng/list.do';
		}
		
		function staffEditOpen(index, position, name, tel, email) {
			edit.editInit(index, position, name, tel, email);
			$('#staffEditModal').modal('toggle');
		}
		
		function staffEditModalClose() {
			$('#staffEditModal').modal('toggle');
			//������Ʈ�� ������ ���� ���ε�
			location.href='http://localhost:8080/staff_mng/list.do';
		}

		function staffDeleteOpen(index) {
			del.deleteInit(index);
			$('#staffDeleteModal').modal('toggle');
		}
		
		function staffDeleteModalClose() {
			$('#staffDeleteModal').modal('toggle');
			//������ ������ ���� ���ε�
			location.href='http://localhost:8080/staff_mng/list.do';
		}
	</script>
</body>
</html>