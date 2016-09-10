package com.staff.action;

import java.sql.*;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.staff.beans.staff;
import com.staff.controller.CommandAction;
import com.staff.dao.staffDao;

public class AddAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		boolean result;
		
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String position = request.getParameter("position");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");
		
		//��ȿ�� üũ : null & �̸��� & �޴��� üũ
		if(!isNull(name)){
			result = false;
		}else if(!isNull(position)){
			result = false;
		}else if(!isNull(tel)){
			result = false;
		}else if(!isTel(tel)){ //���� ǥ������ ����� ��ȭ��ȣ ���� �˻�
			result = false;
		}else if(!isNull(email)){
			result = false;
		}else if(!isEmail(email)){ //���� ǥ������ ����� �̸��� ���� �˻�
			result = false;
		}else{ //��ȿ�� �˻縦 ����� ���
			staff Staff = new staff();// ���� �߰��� ���� �����͵��� ������� Staff ��ü�� �޸𸮸� �Ҵ�
			Staff.setName(name);
			Staff.setPosition(position);
			Staff.setTel(tel);
			Staff.setEmail(email);   
			result = staffDao.getInstance().getStaffAdd(Staff);
		}

		request.setAttribute("result", result); // ���� �߰� ������� �信 �������մϴ�.
		return "addStaffAjax.jsp";
	}
	
	
	/* ��ȿ�� �˻� ���� �Լ�: isNull, isEmail, isTel
	 * html�� javascript���� �̷������ ��ȿ�� �˻�� �ᱹ Ŭ���̾�Ʈ �������� �̷������ ������
	 * �󸶵��� ���� Ȥ�� ��ȿȭ�� �����ϴ�. ���� �ӽù��� ������ �ʴ�. �̿� ���� ������ �Ұ����� JSP�ܿ��� �ѹ� �� ��ȿ�� �˻縦 �ǽ��Ͽ� �ְڴ�.
	 */
	
	/* �� �������� ���� �˻�
	 * �� ���� null Ȥ�� "" �̾ �ȵȴ�.
	 */
	private static boolean isNull(String str){
		if(str == "" || str == null) {
			return false;
		}
		return true;
	}
	
	/* �̸��� ���������� ���� �˻�
	 * "���̵�@������"�� ������ �����ؾ� �Ѵ�.
	 */
	private static boolean isEmail(String str) {
	    return Pattern.matches("[0-9a-zA-Z]+(.[_a-z0-9-]+)*@(?:\\w+\\.)+\\w+$", str);
	}
	
	/* ��ȭ��ȣ������ ���� ���� �˻�
	 * �� ����δ� "-"�� ���еǾ�� �Ѵ�. �� �κп� ���� �ڸ����� �������Ѿ� �Ѵ�. "-"�� ������� �ʴ´�.
	 */
	private static boolean isTel(String str) {
	    return Pattern.matches("^\\d{2,3}-\\d{3,4}-\\d{4}$", str);
	}
}
