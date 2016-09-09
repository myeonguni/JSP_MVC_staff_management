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
	
	/* 직원 리스트 조회 */
	public ArrayList<staff> getStaffList() throws SQLException {
        ResultSet rs = null;
        String sql = "select * from stafflist order by stafflist_name desc";
        rs = openConnection().executeQuery(sql); // sql을 실행하기위해 연결을 열어 쿼리를 실행하고 rs에 반환합니다.
        ArrayList<staff> StaffList = new ArrayList<staff>();// Board형 배열객체를 선언
 
        while (rs.next()) { 
        	staff Staff = new staff();// 데이터들을 담기위해 Board객체에 메모리를 할당
			Staff.setIndex(rs.getString("stafflist_index"));
			Staff.setName(rs.getString("stafflist_name"));
			Staff.setPosition(rs.getString("stafflist_position"));
			Staff.setTel(rs.getString("stafflist_tel"));
			Staff.setEmail(rs.getString("stafflist_email"));     
            StaffList.add(Staff);// 셋팅된 빈을 리스트에 추가합니다.
        }
        closeConnection(); // 연결을 꼭 닫아줍시다.
        return StaffList;
    }

	/* 직원 추가 */
	public boolean getStaffAdd(staff Staff) throws SQLException {
		ResultSet rs = null;
		System.out.println("테스트"+"'"+Staff.getName()+"','"+Staff.getPosition()+"','"+Staff.getTel()+"','"+Staff.getEmail()+"'");
	    String sql = "INSERT INTO STAFFLIST VALUES(LPAD(STAFFLIST_INDEX_SEQ.NEXTVAL,3,'0'),'"+Staff.getName()+"','"+Staff.getPosition()+"','"+Staff.getTel()+"','"+Staff.getEmail()+"')";
	    System.out.println(sql);
	    rs = openConnection().executeQuery(sql); // sql을 실행하기위해 연결을 열어 쿼리를 실행하고 결과값(true or false)을 rs에 반환합니다.
	    return rs.next();
	}
}