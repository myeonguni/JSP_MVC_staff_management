package com.staff.action;

import java.sql.*;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.staff.beans.staff;
import com.staff.controller.CommandAction;
import com.staff.dao.staffDao;

public class ListAllAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		ArrayList<staff> StaffList = staffDao.getInstance().getStaffListAll();
		request.setAttribute("StaffList", StaffList); // ���õ� ���� ����Ʈ�� �信 ������
		return "list.jsp";
	}
}
