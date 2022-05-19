package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.sist.vo.BookVO;

public class BookDAO {
	private String driver="oracle.jdbc.driver.OracleDriver";
	private String url="jdbc:oracle:thin:@192.168.35.4:1521:XE";
	private String username="c##sist";
	private String password="sist";
	

	
	public int getNextBookId() {
		int no = 0;
		
		String sql = "select nvl(max(bookid), 0)+1 from book";
		
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, username, password);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			if(rs.next()) {
				no = rs.getInt(1);
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
		
		
		return no;
		
		
	}
	
	
	public int insertBook(BookVO b) {
		int re = -1;
		String sql = "insert into book values(?,?,?,?)";
		
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, username, password);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, b.getBookid());
			pstmt.setString(2, b.getBookname());
			pstmt.setString(3, b.getPublisher());
			pstmt.setInt(4, b.getPrice());
			re = pstmt.executeUpdate();
			
			if(pstmt != null) {
				pstmt.close();
			}
			
			if(conn != null) {
				conn.close();
			}
			
		} catch(Exception e) {
			System.out.println("예외발생: " + e.getMessage());
		}
		
		
		return re;
	}
	
	
	public ArrayList<BookVO> listBook() {
		ArrayList<BookVO> list = new ArrayList<BookVO>();
		String sql = "select * from book order by bookid";
		
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, username, password);
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int bookid = rs.getInt(1);
				String bookname = rs.getString(2);
				String publisher = rs.getString(3);
				int price = rs.getInt(4);
				
				BookVO b = new BookVO();
				b.setBookid(bookid);
				b.setBookname(bookname);
				b.setPublisher(publisher);
				b.setPrice(price);
				
				list.add(b);
				
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
	
	
	public BookVO getBook(int bookid) {
		BookVO b = null;
		String sql = "select * from book where bookid = ?";
		
		try {
			Class.forName(driver);
			Connection conn = DriverManager.getConnection(url, username, password);
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bookid);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				int dbbookid = rs.getInt(1);
				String bookname = rs.getString(2);
				String publisher = rs.getString(3);
				int price = rs.getInt(4);
				
				b = new BookVO();
				
				b.setBookid(dbbookid);
				b.setBookname(bookname);
				b.setPublisher(publisher);
				b.setPrice(price);
			}
			
			if(rs != null) {
				rs.close();
			}
			
			if(pstmt != null) {
				pstmt.close();
			}
			
			if(conn != null) {
				conn.close();
			}
			
		} catch(Exception e) {
			System.out.println("예외발생: " + e.getMessage());
		}
		
		
		return b;
		
	}
	
	

	
	
}
