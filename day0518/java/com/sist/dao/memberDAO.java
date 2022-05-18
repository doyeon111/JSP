package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.sist.vo.memberVO;

public class memberDAO {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@192.168.35.4:1521:XE";
	String user="c##scott";
	String dbPwd="tiger";
	
	
	public memberVO isMember(String id, String pwd) {
		String sql = "select * from member where id = ? and pwd=?";
		
		memberVO m = null;
		
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, user, dbPwd);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) { //�˻��� ���ڵ尡 �ֳ���? id�� pwd�� �´� ����� �ֳ���?
				//m = new memberVO(rs.getString(1), rs.getString(2), rs.getString(3));
				m = new memberVO();
				String userId = rs.getString(1);
				String userPW = rs.getString(2);
				String userName = rs.getString(3);
				
				m.setId(userId);
				m.setPwd(userPW);
				m.setName(userName);
			} else {
				
			}
			
		} catch (Exception e) {
			System.out.println("���ܹ߻�: " + e.getMessage());
		}
		
		
		
		
		return m;
		
	}
}
