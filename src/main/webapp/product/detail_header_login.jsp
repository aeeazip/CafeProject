<!-- 인나현 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
</head>
<body>
	<!-- 2022-02-22 header_menu 수정-->
	<div align="center" class="text-box">
			<a class="detail-header-menu" href="./../index/index.jsp" >HOME</a>
			<a class="detail-header-menu" href="./../index/index.jsp" >ABOUT US</a>
			<a class="detail-header-menu" href="./../index/index.jsp?contentPage=./../product/menu.jsp" >MENU</a>
			<a class="detail-header-menu" href="../qanda/list.jsp" >Q&A</a>
			<a class="detail-header-menu" href="./../index/index.jsp?contentPage=../review/reviewList.jsp" >REVIEW</a>
	</div>
	
	<!-- 2022-02-22 수정 : 회원이름 클릭하면 장바구니로 이동 -->
	<div class="logo-box">
		<a class="welcom-id" href="../index/index.jsp?contentPage=../cart/myCart.jsp"><%=session.getAttribute("id") %>님</a>
		<a class="mypage" href="./test.jsp">MY PAGE</a>
	</div>	
</body>
</html>