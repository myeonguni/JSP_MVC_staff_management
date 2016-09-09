package com.staff.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.staff.beans.staff;

public class staffDao extends CommonDao {
	public static staffDao getInstance() {
		staffDao _instance = new staffDao();
		return _instance;
	}
	
	/* ���� ����Ʈ ��ȸ */
	public ArrayList<staff> getStaffList() throws SQLException {
        ResultSet rs = null;
        String sql = "select * from stafflist order by stafflist_name asc";
        rs = openConnection().executeQuery(sql); // sql�� �����ϱ����� ������ ���� ������ �����ϰ� rs�� ��ȯ
        ArrayList<staff> StaffList = new ArrayList<staff>();// staff�� �迭��ü�� ����
 
        while (rs.next()) { 
        	staff Staff = new staff();// �����͵��� ������� staff��ü�� �޸𸮸� �Ҵ�
			Staff.setIndex(rs.getString("stafflist_index"));
			Staff.setName(rs.getString("stafflist_name"));
			Staff.setPosition(rs.getString("stafflist_position"));
			Staff.setTel(rs.getString("stafflist_tel"));
			Staff.setEmail(rs.getString("stafflist_email"));     
            StaffList.add(Staff);// ���õ� ���� ����Ʈ�� �߰�
        }
        closeConnection();
        return StaffList;
    }

	/* ���� �߰� */
	public boolean getStaffAdd(staff Staff) throws SQLException {
		ResultSet rs = null;
		String sql = "INSERT INTO STAFFLIST VALUES(LPAD(STAFFLIST_INDEX_SEQ.NEXTVAL,3,'0'),'"+Staff.getName()+"','"+Staff.getPosition()+"','"+Staff.getTel()+"','"+Staff.getEmail()+"')";
	    rs = openConnection().executeQuery(sql);
	    boolean result = rs.next();
	    closeConnection();
	    return result;
	}

	/* ���� ���� */
	public boolean getStaffEdit(String index, staff Staff) throws SQLException {
		ResultSet rs = null;
		String sql = "UPDATE STAFFLIST SET STAFFLIST_NAME='"+Staff.getName()+"', STAFFLIST_POSITION='"+Staff.getPosition()+"', STAFFLIST_TEL='"+Staff.getTel()+"', STAFFLIST_EMAIL='"+Staff.getEmail()+"' WHERE STAFFLIST_INDEX='"+index+"'";
		rs = openConnection().executeQuery(sql);
		boolean result = rs.next();
	    closeConnection();
	    return result;
	}

	/* ���� ���� */
	public boolean getStaffDelete(String index) throws SQLException {
		ResultSet rs = null;
		String sql = "DELETE FROM STAFFLIST WHERE STAFFLIST_INDEX='"+index+"'";
		rs = openConnection().executeQuery(sql);
		boolean result = rs.next();
	    closeConnection();
	    return result;
	}
}