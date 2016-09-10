package com.staff.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.staff.beans.staff;
import com.staff.controller.CommandAction;
import com.staff.dao.staffDao;

public class ListSearchAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		request.setCharacterEncoding("utf-8");
		String category = request.getParameter("category");
		String searchTxt = request.getParameter("searchTxt");
		ArrayList<staff> StaffList = staffDao.getInstance().getStaffListSearch(category, searchTxt);
		request.setAttribute("StaffList", StaffList); // 셋팅된 직원 리스트를 뷰에 포워드
		return "list.jsp";
	}
}
