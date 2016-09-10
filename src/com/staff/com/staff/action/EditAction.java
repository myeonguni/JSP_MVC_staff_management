package com.staff.action;

import java.sql.*;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.staff.beans.staff;
import com.staff.controller.CommandAction;
import com.staff.dao.staffDao;

public class EditAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		boolean result;
		
		request.setCharacterEncoding("utf-8");
		String index = request.getParameter("index");
		String name = request.getParameter("name");
		String position = request.getParameter("position");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		//유효성 체크 : null & 이메일 & 휴대폰 체크
		if(!isNull(name)){
			result = false;
		}else if(!isNull(position)){
			result = false;
		}else if(!isNull(tel)){
			result = false;
		}else if(!isTel(tel)){
			result = false;
		}else if(!isNull(email)){
			result = false;
		}else if(!isEmail(email)){
			result = false;
		}else{
			staff Staff = new staff();
			Staff.setName(name);
			Staff.setPosition(position);
			Staff.setTel(tel);
			Staff.setEmail(email);   
			result = staffDao.getInstance().getStaffEdit(index, Staff);
		}

		request.setAttribute("result", result);
		return "editStaffAjax.jsp";
	}
	
	private static boolean isNull(String str){
		if(str == "" || str == null) {
			return false;
		}
		return true;
	}
	
	private static boolean isEmail(String str) {
	    return Pattern.matches("[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$", str);
	}
	
	private static boolean isTel(String str) {
	    return Pattern.matches("^\\d{2,3}-\\d{3,4}-\\d{4}$", str);
	}
}
