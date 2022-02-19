<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="com.project.dto.*" %>
<%@ page import="com.project.dao.*" %>

<%
	String id = (String)session.getAttribute("id");
	if(id==null){
		pageContext.forward("../login/login.jsp");
	}
	
	// order_detail ���̺��� �α����� ���� ���̵�� ���� ���� write_review�� 0�� ���ڵ尡 �ִ��� �˻�
	//(������ reviewList.jsp�� �̵� / ������ �������� product_id �� �ϳ� �����ؼ� �� �ۼ��� �� �ֵ��� �ϱ�)
	OrderDAO order_dao = new OrderDAO();
	int flag = order_dao.isBought(id);
	
	if(flag==-1 || flag==0){
%>
	<script>
		alert('���並 �ۼ��� �� �����ϴ�.');
		history.back();
	</script>
<%
	}
	
	List<OrderDetailDTO> list = new ArrayList<OrderDetailDTO>();
	list = order_dao.orderList(id); // write_review 0�� �ֹ��� ��ȯ
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
	.chooseProduct{
	 height: 150px;
	}
	
	.selectProduct{
		font-size: 20px;
		font-weight: bold;
		color: #325446;
	}
</style>
<body>
	<center>
	<div class="chooseProduct">
	<br>
		<p class="selectProduct">���並 �ۼ��� ��ǰ�� �����ϼ��� :)</p><br>
	<form name="chooseProduct" method="post" action="../index/index.jsp?contentPage=../review/reviewForm.jsp">
		<select name="product" style="width:200px;height:30px;">
			<%
				int orderId=0;
				for(OrderDetailDTO o : list){
					String productName = order_dao.findProductName(o.getProductID());
					out.println("<option>" + productName + "</option>"); 	
				}
			%>
		</select>
		<input type="submit" value="�����ۼ�">
	</form>
	</div>
	</center>
</body>
</html>