<!-- 인나현, 정채원 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.project.dto.ProductDTO"%>
<%@ page import="com.project.dao.ProductDAO"%>
<%
	ProductDAO product_dao = new ProductDAO();
	
	String product_id = request.getParameter("product_id");
	ProductDTO product_dto = product_dao.getProduct(Integer.parseInt(product_id));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Menu 상세페이지</title>
<link href="../css/index.css" rel="stylesheet" type="text/css" />
<link href="../css/product.css?after" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="./../js/product.js"></script>
</head>
<body>

	<header class="detail-header">
		<div class="header-nav">
			<% 
				String id = (String)session.getAttribute("id");
				if(id == null) {
			%>
			<jsp:include page="detail_header_logout.jsp" />
			<%} else {%>
			<jsp:include page="detail_header_login.jsp" />
			<%}%>
		</div>
	</header>
	
	<div class="menu-detail-container">
		<form class="detail-form">
			
			<!-- cart_action에 값을 전달해주기 위해 hidden 사용 -->
			<input type="hidden" name="menu_id" value="<%=product_dto.getProductID()%>"> <!-- 바뀐부분 -->
		
			<div class="menu-detail-img-box">
				<img class="menu-img" alt="menu" src="./../images/<%=product_dto.getProductIMG() %>">
			</div>
			
			<div class="menu-detail-info-box">
				<div id="menu-detail-name"><%=product_dto.getProductNAME() %>
					<hr class="hr_1">
				</div>
				<div class="detail-price"><%=product_dto.getProductPRICE() %>원</div>
				<div class="detail-intro"><%=product_dto.getProductINTRO() %></div>
				<div class="detail-quantity">
					수량 선택: <input class="input-number" type="number" min="1" max="<%=product_dto.getProductSTOCK()%>" name="menu_qty"> <!-- 바뀐부분 -->
					<hr class="hr_2">
				</div>
				<div class="detail-btn">
					<% 
						if(id == null) {
					%>
					<input class="detail-submit" type="button" value="CART" onclick="location.href='./../login/login.jsp';"> <!-- 바뀐부분 -->
					<%} else {%>
					<input class="detail-submit" type="submit" value="CART" onclick="javascript: form.action='../cart/cart_insert_action.jsp';">
					<%}%>
					
					<!-- 2022-02-22 하단 부분 추가 -->
					<% 
						if(id == null) {
					%>
					<input class="detail-submit" type="button" value="ORDER" onclick="location.href='./../login/login.jsp';"> <!-- 바뀐부분 -->
					<%} else {%>
					<input class="detail-submit" type="submit" value="ORDER" onclick="javascript: form.action='../order/order_insert_action.jsp';">
					<%}%>
				</div>
			</div>
		</form>
	</div>
</body>
</html>