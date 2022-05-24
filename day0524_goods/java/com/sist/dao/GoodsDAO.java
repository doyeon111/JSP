package com.sist.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.sist.db.ConnectionProvider;
import com.sist.vo.GoodsVO;

public class GoodsDAO {
	
	public GoodsVO getGoods(int no) {
		GoodsVO g = null;
		String sql = "select * from goods where no = ?";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				g = new GoodsVO(rs.getInt(1), rs.getString(2), rs.getInt(3), rs.getInt(4), rs.getString(5));
			}
			
			ConnectionProvider.close(rs, pstmt, conn);
		}catch(Exception e) {
			System.out.println("예외발생: " + e.getMessage());
		}
		
		return g;
	}
	
	
	public int deleteGoods(int no) {
		int re = -1;
		String sql = "delete goods where no = ?";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);
			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(null, pstmt, conn);
			
			
		} catch(Exception e) {
			System.out.println("예외발생: " + e.getMessage());
		}
		
		return re;
	}
	
	
	public int updateGoods(GoodsVO g) {
		int re = -1;
		String sql = "update goods set item=?, qty=?, price=?, fname=? where no = ?";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, g.getItem());
			pstmt.setInt(2, g.getQty());
			pstmt.setInt(3, g.getPrice());
			pstmt.setString(4, g.getFname());
			pstmt.setInt(5, getNextNo());
			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(null, pstmt, conn);
			
		} catch(Exception e) {
			System.out.println("예외발생: " + e.getMessage());
		}
		
		return re;
	}
	
	public int getNextNo() {
		int no = 0;
		String sql = "select nvl(max(no), 0)+1 from goods";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				no = rs.getInt(1);
			}
			
			ConnectionProvider.close(rs, stmt, conn);
			
		}catch(Exception e) {
			System.out.println("예외발생: " + e.getMessage());
		}
		return no;
	}
	
	
	public ArrayList<GoodsVO> listGoods() {
		ArrayList<GoodsVO> list = new ArrayList<GoodsVO>();
		String sql = "select * from goods order by no";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				int no = rs.getInt(1);
				String item = rs.getString(2);
				int qty = rs.getInt(3);
				int price = rs.getInt(4);
				String fname = rs.getString(5);
				
				GoodsVO g = new GoodsVO();
				g.setNo(no);
				g.setItem(item);
				g.setQty(qty);
				g.setPrice(price);
				g.setFname(fname);
				
				list.add(g);
			}
			
			ConnectionProvider.close(rs, stmt, conn);
					
		} catch(Exception e) {
			System.out.println("예외발생: " + e.getMessage());
		}
		
		return list;
	}
	
	public int insertGoods(GoodsVO g) {
		int re = -1;
		String sql = "insert into goods(no, item, qty, price, fname) values(?,?,?,?,?)";
		
		try {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, getNextNo());
			pstmt.setString(2, g.getItem());
			pstmt.setInt(3, g.getQty());
			pstmt.setInt(4, g.getPrice());
			pstmt.setString(5, g.getFname());
			re = pstmt.executeUpdate();
			
			ConnectionProvider.close(null, pstmt, conn);
			
		} catch(Exception e) {
			System.out.println("예외발생: " + e.getMessage());
		}
		
		return re;
	}
}
