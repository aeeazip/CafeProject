<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.project.dto.*" %>
<%@ page import="com.project.dao.*" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
    int reviewId = Integer.parseInt(request.getParameter("reviewId"));
	
	ReviewDAO review_dao = new ReviewDAO();
	List<ReviewDTO> newList = new ArrayList<ReviewDTO>();
	newList = review_dao.showReview(reviewId);
	request.setAttribute("newList", newList);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	.individualReview{
		margin-top: 20px;
		width: 60%;
	}
	.individualReview, .individualReview tr{
		border: 1px solid black;
		border-collapse: collapse;
		text-align: center;
	}
</style>
<body>
	<center>
	<br>
	<table class="individualReview">
		<c:forEach var="list" items="${newList}">
			<tr height="40" style="background-color: #F9F9F9;">
				<td style="background-color: #EEEEEE;">�����ȣ</td>
				<td>${list.reviewID}</td>
			</tr>
			<tr height="40" style="background-color: #F9F9F9;">
				<td style="background-color: #EEEEEE;">�ۼ���</td>
				<td>${list.userID}</td>
			</tr>
			<tr height="40" style="background-color: #F9F9F9;">
				<td style="background-color: #EEEEEE;">�ۼ�����</td>
				<td>${list.date}</td>
			</tr>
			<tr height="40" style="background-color: #F9F9F9;">
				<td style="background-color: #EEEEEE;">�޴�</td>
				<td>${list.productName}</td>
			</tr>
			<tr height="40" style="background-color: #F9F9F9;">
				<td style="background-color: #EEEEEE;">����</td>
				<td>${list.grade}</td>
			</tr>
			<tr height="40" style="background-color: #F9F9F9;">
				<td style="background-color: #EEEEEE;">����</td>
				<td>${list.review_content}</td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<input type="button" value="����" onclick="history.go(-1)">
	<br><br>
	</center>
</body>
</html>