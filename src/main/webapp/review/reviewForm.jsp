<!-- 작성폼 -->
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.project.dto.*" %>
<%@ page import="com.project.dao.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
	String id = (String)session.getAttribute("id");
	if(id==null){
		pageContext.forward("../login/login.jsp");
	}
	
	String productName = request.getParameter("product");
	ProductDAO product = new ProductDAO();
	String image = product.imageSrc(productName);
	String intro = product.productIntro(productName);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link href="../css/reviewForm.css" rel="stylesheet" type="text/css" />
<style>
	.reviewProduct{
		margin-top: 20px;
		width: 100%;
		height: 370px;
		background-color: #325446;
		font-weight: bold;
		font-size: 30px;
		color: white;
	}
	
	.intro{
		font-weight: bold;
		font-size: 17px;
		color: white;
	}
	
	.reviewTable{
		width: 98%;
		margin: 20px;
	}
</style>
<body>
	<center>
	<div class="reviewProduct">
		<!-- order_detail에 리뷰를 쓰지 않은 같은 이름의 상품이 여러 개일 때 order_id가 제일 작은 것이 선택되도록 함 -->
		<img src="<%=image%>" width="370px" height="300px" style="margin: 10px;">
		<%=request.getParameter("product") %>
		<br>
		<div class="intro"><%=intro%></div>
	</div>
	<form name="writeForm" method="get" action="../review/reviewDB.jsp">
		<table align="center" class="reviewTable" height="600px">
			<tr>
				<td>작성자</td>
				<td style="font-size: 30px;">&nbsp;${sessionScope.id}님</td>
			</tr>
			<tr>
				<td>상품</td>
				<td style="font-size: 30px;">&nbsp;<%=request.getParameter("product") %></td>
			</tr>
			<tr>
				<td>별점</td>
				<td>
					<div class="star-rating space-x-4 mx-auto">
						<input type="radio" id="5-stars" name="rating" value="5" v-model="ratings" checked/>
						<label for="5-stars" class="star pr-4">★</label>
						<input type="radio" id="4-stars" name="rating" value="4" v-model="ratings"/>
						<label for="4-stars" class="star">★</label>
						<input type="radio" id="3-stars" name="rating" value="3" v-model="ratings"/>
						<label for="3-stars" class="star">★</label>
						<input type="radio" id="2-stars" name="rating" value="2" v-model="ratings"/>
						<label for="2-stars" class="star">★</label>
						<input type="radio" id="1-star" name="rating" value="1" v-model="ratings" />
						<label for="1-star" class="star">★</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea id="reviewContent" name="reviewContent" rows="25" cols="200" placeholder="후기를 남겨주세요.."></textarea>
				</td>
			</tr>
		</table>
		<input type="hidden" name="productName" value="<%=productName%>">
		<input type="submit" value="등록" style="width:80pt; height:60pt; background-color:#325446; color:white; font-weight:bold; font-size:25px;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="reset" value="취소" style="width:80pt;height:60pt; font-size:25px;">
		<br><br><br>
	</form>
	</center>
</body>
</html>