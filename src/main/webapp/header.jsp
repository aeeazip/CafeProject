<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Header</title>
</head>
<link href="index.css" rel="stylesheet" type="text/css" />
<body>
	<script>
		function changeView1(value){
			if(value=="0")
				location.href="index.jsp?contentPage=firstview.jsp";
			else if(value=="1")
				location.href="index.jsp?contentPage=test.jsp";
			else if(value=="2")
				location.href="index.jsp?contentPage=test.jsp";
			else if(value=="3")
				location.href="index.jsp?contentPage=test.jsp";
		}
	</script>
	
	<!-- 로그인 변화에 따른 마이페이지, 장바구니 코드 넣고 -->
	<header class="header">
		<div align="center" class="text-box">
			<span class="header-aTag" onclick="changeView1(0)" style="cursor: pointer">카페 HOME</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="header-aTag" onclick="changeView1(1)" style="cursor: pointer">카페 소개</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="header-aTag" onclick="changeView1(2)" style="cursor: pointer">메뉴 소개</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="header-aTag" onclick="changeView1(3)" style="cursor: pointer">게시판</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
		<div class="logo-box">
			<a class="cart" href="./test.jsp"><img alt="shopping cart"
				src="./img/shopping_cart.png" class="cart-log"></a> 
				<a class="man" href="./test.jsp"><img alt="man" src="./img/man.png" class="man-log"></a>
		</div>
	</header>
</body>
</html>