package com.staff.action;

import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.staff.beans.staff;
import com.staff.controller.CommandAction;
import com.staff.dao.staffDao;

public class DownAction implements CommandAction {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String extension = request.getParameter("extension");
		HttpSession session = request.getSession();
		ArrayList<staff> StaffList = staffDao.getInstance().getStaffListAll();
		switch (extension) {
		case "csv":
			response.setHeader("Content-type", "application/csv; charset=MS949");
			response.setHeader("Content-disposition", "inline; filename=staffList.csv");
			
		    response.getWriter().println("직원번호, 직급, 이름, 전화번호, 이메일");
			for(int i=0; i < StaffList.size(); i++){
				response.getWriter().println(StaffList.get(i).getIndex()+","+StaffList.get(i).getPosition()+","+StaffList.get(i).getName()+","+StaffList.get(i).getTel()+","+StaffList.get(i).getEmail());
			}
			break;
		case "xls":
			response.setHeader("Content-Disposition", "attachment; filename=staffList.xls"); 
		    response.setHeader("Content-Description", "JSP Generated Data"); 
		    response.setContentType("application/vnd.ms-excel; charset=KSC5601");
		    response.getWriter().print("<table border=\"1\" cellpadding=\"3\" bordercolor='black'");
		    response.getWriter().print("<tr><td>직원번호</td><td>직급</td><td>이름</td><td>전화번호</td><td>이메일</td></tr>");
		    for(int i=0; i < StaffList.size(); i++){
				response.getWriter().print("<tr><td>"+StaffList.get(i).getIndex()+"</td><td>"+StaffList.get(i).getPosition()+"</td><td>"+StaffList.get(i).getName()+"</td><td>"+StaffList.get(i).getTel()+"</td><td>"+StaffList.get(i).getEmail()+"</td></tr>");
		    }
			response.getWriter().print("</table>");
		   break;
		case "xlsx":
			//미지원
			break;
		default:
			break;
		}
		response.getWriter().flush();
		response.getWriter().close();
		return null;
	}

}
