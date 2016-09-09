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
        String sql = "select * from stafflist order by stafflist_name desc";
        rs = openConnection().executeQuery(sql); // sql�� �����ϱ����� ������ ���� ������ �����ϰ� rs�� ��ȯ�մϴ�.
        ArrayList<staff> StaffList = new ArrayList<staff>();// Board�� �迭��ü�� ����
 
        while (rs.next()) { 
        	staff Staff = new staff();// �����͵��� ������� Board��ü�� �޸𸮸� �Ҵ�
			Staff.setIndex(rs.getString("stafflist_index"));
			Staff.setName(rs.getString("stafflist_name"));
			Staff.setPosition(rs.getString("stafflist_position"));
			Staff.setTel(rs.getString("stafflist_tel"));
			Staff.setEmail(rs.getString("stafflist_email"));     
            StaffList.add(Staff);// ���õ� ���� ����Ʈ�� �߰��մϴ�.
        }
        closeConnection(); // ������ �� �ݾ��ݽô�.
        return StaffList;
    }

	/* ���� �߰� */
	public boolean getStaffAdd(staff Staff) throws SQLException {
		ResultSet rs = null;
		System.out.println("�׽�Ʈ"+"'"+Staff.getName()+"','"+Staff.getPosition()+"','"+Staff.getTel()+"','"+Staff.getEmail()+"'");
	    String sql = "INSERT INTO STAFFLIST VALUES(LPAD(STAFFLIST_INDEX_SEQ.NEXTVAL,3,'0'),'"+Staff.getName()+"','"+Staff.getPosition()+"','"+Staff.getTel()+"','"+Staff.getEmail()+"')";
	    System.out.println(sql);
	    rs = openConnection().executeQuery(sql); // sql�� �����ϱ����� ������ ���� ������ �����ϰ� �����(true or false)�� rs�� ��ȯ�մϴ�.
	    return rs.next();
	}
}