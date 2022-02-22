package com.project.dao;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;

import com.project.dto.*;

public class CartDAO {

	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs;

	//mysql 연결정보
	private String jdbc_driver = "com.mysql.cj.jdbc.Driver";
	private String jdbc_url = "jdbc:mysql://mydbinstance.ctvgpvyuejsa.ap-northeast-2.rds.amazonaws.com:3306/myShoppingmallDB?serverTimezone=UTC";

	private String id = "shun04321";
	private String pw = "awstbs421!";

	public CartDAO() {}

	//DB 연결 method
	void connect() {
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pw);
		}catch (Exception e) {
			System.out.println(e);
		}
	}

	void disconnect() {
		if(pstmt != null) {
			try{
				pstmt.close();
			}catch(Exception ignored){}
		}
		if(conn != null) {
			try{
				conn.close();
			}catch(Exception ignored){}
		}
	}

	public int getNext() {
		String sql = "select cart_id from cart order by cart_id desc";
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
		return -1; //데이터베이스 오류
	}

	public int isinCart(CartDTO cart){
		String sql = "select COUNT(*) from cart where user_id = ? and product_id = ?";
		int flag = -1;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, cart.getUser_id());
			pstmt.setInt(2, cart.getProduct_id());
			rs = pstmt.executeQuery();


			while(rs.next()) {
				flag=rs.getInt(1);
			}

			return flag; // 0 반환 = 해당 메뉴 cart에 없음 
		} catch(Exception e) {
			e.printStackTrace();
		}
		return flag;  // 데이터베이스 오류
	}

	// cart에 해당 메뉴가 없는 경우 실행할 함수
	public void CartInsert(CartDTO cart) throws SQLException {
		connect();

		int flag = isinCart(cart);
		
		if(flag==0)
			CartUpdate(cart);  

		try {
			int cartId = getNext();
			String sql = "insert into cart values(?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cartId);
			pstmt.setString(2, cart.getUser_id());
			pstmt.setInt(3, cart.getProduct_id());
			pstmt.setInt(4, cart.getProduct_qty());

			int update = pstmt.executeUpdate();

			if(update == 0) System.out.println("DB 업데이트 실패");
			else System.out.println("DB 업데이트 성공");

		}catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		finally {
			disconnect();
		}
	}

	// cart에 해당 메뉴가 있는 경우 실행할 함수
	public void CartUpdate(CartDTO cart) {
		connect();
		
		// 실제로 수정후 장바구니 페이지에도 변화 반영되는지 체크하기
		String sql = "update cart set product_qty = ? where user_id = ? and product_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, cart.getProduct_qty());
			pstmt.setString(2, cart.getUser_id());
			pstmt.setInt(3,  cart.getProduct_id());
			rs = pstmt.executeQuery();
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	// cart 테이블의 모든 레코드를 반환하는 함수
	public List<CartDTO> cartList(String userId){
		try {
			Class.forName(jdbc_driver);
			conn = DriverManager.getConnection(jdbc_url, id, pw);

			String sql = "select product_id, product_name, grade, review_content, user_id, review_date from review as r join product as p where r.product_id=p.product_id and review_id =?;";
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
}
