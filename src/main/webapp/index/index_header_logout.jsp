<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">

<title>Insert title here</title>
</head>
<body>
	<div class="text-box">
		<span class="header-menu" onclick="changeView1(0)">HOME</span>
		<span class="header-menu" onclick="changeView1(1)">ABOUT US</span>
		<span class="header-menu" onclick="changeView1(2)">MENU</span>
		<span class="header-menu" onclick="changeView1(4)">Q&A</span>
		<span class="header-menu" onclick="changeView1(5)">REVIEW</span>
	</div>
	
	<!-- 2022.02.28 ���� : ��ٱ��� Ŭ�� �� �α��� �䱸 -->
	<div class="logo-box">
		<a class="cart"><img class="cart-log" alt="shopping cart" src="./../images/shopping_cart.png" class="cart-log" style="cursor: pointer;" onclick="alert('�α����� �ʿ��� �����Դϴ� :)');"></a>
		<a class="man" href="../login/login.jsp"><img alt="ma
		n" src="./../images/man.png" class="man-log"></a>
	</div>
</body>
</html>