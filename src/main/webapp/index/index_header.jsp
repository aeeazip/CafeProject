<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title></title>
<script>
		function changeView1(value){
			if(value=="0")
				location.href="index.jsp?contentPage=firstview.jsp";
			else if(value=="1")
				location.href="index.jsp?contentPage=test.jsp";
			else if(value=="2")
				location.href="index.jsp?contentPage=test.jsp";
			else if(value=="3")
				location.href="./../qanda/list.jsp";  	// �ٲ� �κ�
			else if(value=="4"){						//
				alert("ȸ�����Ը� �۾��� ������ �ֽ��ϴ�.");		//
				location.href="./../login/login.jsp";  	//
			}
			else if(value=="5") // �ٲ� �κ�
				location.href="index.jsp?contentPage=../review/reviewList.jsp"; // �ٲ� �κ�
		}

</script>
</head>
<body>
	<!-- index header -->
	<header class="index-header">	
	
		<div class="header-nav">
			<% 
				String id = (String)session.getAttribute("id");
				if(id == null) {
			%>
			<jsp:include page="index_header_logout.jsp" />
			<%} else {%>
			<jsp:include page="index_header_login.jsp" />
			<%}%> 
		</div>
		
	</header>
</body>
</html>