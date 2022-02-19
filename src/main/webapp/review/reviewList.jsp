<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.project.dto.*"%>
<%@ page import="com.project.dao.*"%>
<%@ page import="java.util.*"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<link href="../css/index.css" rel="stylesheet" type="text/css" />
<script>
	function writeForm(){
		location.href="index.jsp?contentPage=../review/chooseProduct.jsp";
	}
	
	function viewReview(reviewId){
		location.href="../index/index.jsp?contentPage=../review/viewReview.jsp?reviewId="+reviewId;
	}
</script>
<style>
	#bList, #bList tr {
		text-align: center;
		border-collapse: collapse;
		border: 1px solid #EEEEEE;
		width: 800px;
		font-weight: bold;
		font-size: 15px;
	}
	
	.reviewList{
		width: 100%;
		height: 900px;
	}
</style>
<%
	ReviewDAO review_dao = new ReviewDAO();
	List<ReviewDTO> list = new ArrayList<ReviewDTO>();
	list = review_dao.reviewList();
	request.setAttribute("list", list);
%>
<body>
	<center>
	<div class="reviewList">
	<br>
	<!-- 글쓰기 버튼 -->
	<form name="ListForm1" action="">
		<input type="button" value="글쓰기" onclick="writeForm()">
	</form>
	
	<!-- 게시글 목록 부분 -->
	<br>
	<div id="board">
		<table id="bList">
			<tr height="50" style="background-color: #EEEEEE;">
				<td>리뷰번호</td>
				<td>메뉴</td>
				<td>별점</td>
				<td>작성자</td>
				<td>작성일</td>
			</tr>
			<c:forEach var="list" items="${list}">
			<tr height="40" style="background-color: #F9F9F9; cursor:pointer;" onclick="viewReview(${list.reviewID})">
				<td>${list.reviewID}</td>
				<td>${list.productName}</td>
				<td>${list.grade}</td>
				<td>${list.userID}</td>
				<td>${list.date}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
	</div>
	</center>
</body>
</html>