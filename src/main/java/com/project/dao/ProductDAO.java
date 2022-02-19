package com.project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.project.dto.*;

public class ProductDAO {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs;
	
	private String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	private String jdbc_url = "jdbc:mysql://mydbinstance.ctvgpvyuejsa.ap-northeast-2.rds.amazonaws.com:3306/myShoppingmallDB?serverTimezone=UTC";
	
	private String id = "shun04321";
	private String pw = "awstbs421!";
	
	public ProductDAO() {
		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pw);
		}
		catch(Exception e) {
			System.out.println(e);
		}
		
	}
	
	public void ProductInsert(ProductDTO product) {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pw);
			
			String sql = "insert into product values(?, ?, ?, ?, ?, (now()), ?)";
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, product.getProductID());
			pstmt.setString(2, product.getProductNAME());
			pstmt.setInt(3, product.getProductPRICE());
			pstmt.setInt(4, product.getProductSTOCK());
			pstmt.setString(5, product.getProductINTRO());
			pstmt.setString(6, product.getProductIMG());
			
			int update = pstmt.executeUpdate();
			
			if(update == 0) System.out.println("DB 업데이트 실패");
			else System.out.println("DB 업데이트 성공");
		}
		catch(Exception e) {
			System.out.println(e);
		}finally{
			try{
				pstmt.close();
			}catch(Exception ignored){}
			try{
				conn.close();
			}catch(Exception ignored){}
		}
	}
	
	public String imageSrc(String productName) {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pw);
			
			String sql = "select product_img from product where productName=?;";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productName);
			rs = pstmt.executeQuery();
			
			String src=null;
			while(rs.next()) {
				src=rs.getString("product_img");
			}
			return src;
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public String productIntro(String productName) {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pw);
			
			String sql = "select product_intro from product where product_name=?;";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productName);
			rs = pstmt.executeQuery();
			
			String intro=null;
			while(rs.next()) {
				intro=rs.getString("product_intro");
			}
			return intro;
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return null;
	}
	
	public int findProductID(String productName) {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pw);
			
			String sql = "select product_id from product where product_name = ?;";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, productName);
			rs = pstmt.executeQuery();
			
			int productId = -1;
			while(rs.next()) {
				productId=rs.getInt("product_id");
			}
			return productId;
		}
		catch(Exception e) {
			System.out.println(e);
		}
		return -1; // 데이터 베이스 오류
	}
}