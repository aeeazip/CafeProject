<!-- �γ��� -->

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

	<div align="center" class="text-box">
			<a class="detail-header-menu" href="./../index/index.jsp" >HOME</a>
			<a class="detail-header-menu" href="./../index/index.jsp" >ABOUT US</a>
			<a class="detail-header-menu" href="./../index/index.jsp?contentPage=./../product/menu.jsp" >MENU</a>
			<a class="detail-header-menu" href="./../index/index.jsp" >NOTICE BOARD</a>
	</div>

	<div class="logo-box">
		<span class="welcom-id"><%=session.getAttribute("id") %>�� �ȳ��ϼ���</span>
		<a class="mypage" href="./test.jsp">MY PAGE</a>
	</div>
	
</body>
</html>