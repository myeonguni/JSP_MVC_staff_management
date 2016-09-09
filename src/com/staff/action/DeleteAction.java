package com.staff.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.staff.beans.staff;
import com.staff.controller.CommandAction;
import com.staff.dao.staffDao;

public class DeleteAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		boolean result;
		
		request.setCharacterEncoding("utf-8");
		String index = request.getParameter("index");
		
		result = staffDao.getInstance().getStaffDelete(index);
		request.setAttribute("result", result); // 직원 삭제 결과값을 뷰에 포워드
		return "deleteStaffAjax.jsp";
	}
}

