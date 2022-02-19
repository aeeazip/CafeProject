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

	// 리뷰 번호(review_id) 부여 메소드
	public int getNext() {
		//현재 리뷰 게시판을 내림차순으로 조회하여 가장 마지막 글의 번호를 구한다
		String sql = "select review_id from review order by review_id desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1; //첫 번째 게시물인 경우
		}catch (Exception e) {
			e.printStackTrace();
		}
		return 1; //데이터베이스 오류
	}

	// 리뷰 등록 메소드
	 public void write(ReviewDTO review, String userID) { // 같은 user_id product_id에 리뷰 쓴 상품 order_detail write_review 1로 만들기	
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
	
	// 리뷰 목록 보기 용 리스트 반환
	public List<ReviewDTO> reviewList(){		
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pw);
			
			String sql = "select review_id, product_name, grade, user_id, review_date from review as r join product as p where r.product_id=p.product_id order by review_id desc;";
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
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
	
	// 개별 리뷰 반환
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