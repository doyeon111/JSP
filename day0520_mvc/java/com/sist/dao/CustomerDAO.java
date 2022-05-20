package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.sist.vo.CustomerVO;

public class CustomerDAO {
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@192.168.35.4:1521:XE";
	private String username="c##sist";
	private String password="sist";
	
	public ArrayList<CustomerVO> listCustomer() {
		ArrayList<CustomerVO> list = new ArrayList<CustomerVO>();
		String sql = "select * from customer order by custid";
		
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, username, password);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int custid = rs.getInt(1);
				String name = rs.getString(2);
				String address = rs.getString(3);
				String phone = rs.getString(4);
				
				CustomerVO c = new CustomerVO();
				c.setCustid(custid);
				c.setName(name);
				c.setAddress(address);
				c.setPhone(phone);
				
				list.add(c);
				
			}
			if(rs != null) {
				rs.close();
			}
			
			if(stmt != null) {
				stmt.close();
			}
			
			if(conn != null) {
				conn.close();
			}
			
		} catch(Exception e) {
			System.out.println("예외발생: " + e.getMessage());
		}
		
		return list;
		
	}
}
