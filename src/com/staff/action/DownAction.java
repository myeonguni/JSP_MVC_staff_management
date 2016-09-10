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
		switch (extension) {
		case "csv":
			response.setHeader("Content-type", "application/csv");
			response.setHeader("Content-disposition", "inline; filename=staffList.csv");
			break;
		case "xls":
			response.setHeader("Content-Disposition", "attachment; filename=staffList.xls"); 
		    response.setHeader("Content-Description", "JSP Generated Data"); 
		    response.setContentType("application/vnd.ms-excel");
		   break;
		case "xlsx":
			//¹ÌÁö¿ø
			break;
		default:
			break;
		}
		PrintWriter out = response.getWriter();
		/* ArrayList<staff> StaffList = staffDao.getInstance().getStaffListAll();
		 * for(int i=0; i>=StaffList.size(); i++){
		 * 	out.println(StaffList.get(i).getIndex()+","+StaffList.get(i).getPosition()+","+StaffList.get(i).getName()+","+StaffList.get(i).getTel()+","+StaffList.get(i).getEmail());
		 * }
		*/
		out.println("test");
		out.flush();
		out.close();
		return "list.jsp";
	}

}
