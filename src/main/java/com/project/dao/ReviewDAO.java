package com.project.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.*;
import com.project.dto.*;

public class ReviewDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs;

	private String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	private String jdbc_url = "jdbc:mysql://mydbinstance.ctvgpvyuejsa.ap-northeast-2.rds.amazonaws.com:3306/myShoppingmallDB?serverTimezone=UTC";

	private String id = "shun04321";
	private String pw = "awstbs421!";


	public ReviewDAO() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pw);
		}
		catch(Exception e) {
			System.out.println(e);
		}
	}

	// ���� ��ȣ(review_id) �ο� �޼ҵ�
	public int getNext() {
		//���� ���� �Խ����� ������������ ��ȸ�Ͽ� ���� ������ ���� ��ȣ�� ���Ѵ�
		String sql = "select review_id from review order by review_id desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //ù ��° �Խù��� ���
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 1; //�����ͺ��̽� ����
	}

	// ���� ��� �޼ҵ�
	 public void write(ReviewDTO review, String userID) { // ���� user_id product_id�� ���� �� ��ǰ order_detail write_review 1�� �����	
		 try {
				Class.forName(jdbc_driver);
				conn = DriverManager.getConnection(jdbc_url, id, pw);
				
				String sql = "insert into review values(?, ?, ?, ?, ?, ?, ?)";
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setInt(1, getNext());
				pstmt.setInt(2, review.getOrderID());
				pstmt.setInt(3, review.getProductID());
				pstmt.setString(4, userID);
				pstmt.setString(5, review.getReview_content());
				pstmt.setTimestamp(6, review.getDate());
				pstmt.setInt(7, review.getGrade());
				
				int update = pstmt.executeUpdate();
				
				if(update == 0) System.out.println("DB ������Ʈ ����");
				else System.out.println("DB ������Ʈ ����");
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
	
	public void changeStatus(int orderID, String userID, int productID) {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pw);

			String sql = "update order_detail set write_review=1 where order_order_id = ? and order_user_user_id = ? and product_product_id = ?;";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, orderID);
			pstmt.setString(2, userID);
			pstmt.setInt(3, productID);
			
			pstmt.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// ���� ��� ���� �� ����Ʈ ��ȯ
	public List<ReviewDTO> reviewList(int nSizePerPage, int nFirstNcno){		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pw);
			
			String sql = "select review_id, product_name, grade, user_id, review_date from review as r join product as p where r.product_id=p.product_id order by review_id desc limit ? offset ?;";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, nSizePerPage);
			pstmt.setInt(2, nFirstNcno);			
			rs = pstmt.executeQuery();
			
			List<ReviewDTO> list = new ArrayList<ReviewDTO>();
			
			while(rs.next()) {
				ReviewDTO review_dto = new ReviewDTO();
			
				review_dto.setReviewID(rs.getInt("review_id"));
				review_dto.setProductName(rs.getString("product_name"));
				review_dto.setGrade(rs.getInt("grade"));
				review_dto.setUserID(rs.getString("user_id"));
				review_dto.setDate(rs.getTimestamp("review_date"));
				list.add(review_dto);
			}
			return list;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
	// ���� ���� ��ȯ
	public List<ReviewDTO> showReview(int reviewID) {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pw);
			
			String sql = "select review_id, product_name, grade, review_content, user_id, review_date from review as r join product as p where r.product_id=p.product_id and review_id =?;";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, reviewID);
			rs = pstmt.executeQuery();
			
			List<ReviewDTO> list = new ArrayList<ReviewDTO>();
			
			while(rs.next()) {
				ReviewDTO review_dto = new ReviewDTO();
			
				review_dto.setReviewID(rs.getInt("review_id"));
				review_dto.setProductName(rs.getString("product_name"));
				review_dto.setGrade(rs.getInt("grade"));
				review_dto.setReview_content(rs.getString("review_content"));
				review_dto.setUserID(rs.getString("user_id"));
				review_dto.setDate(rs.getTimestamp("review_date"));
				list.add(review_dto);
			}
			return list;
		} catch(Exception e) {
			e.printStackTrace();
		}
		return null;		
	}
}