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
				location.href="./../qanda/list.jsp";  	// 바뀐 부분
			else if(value=="4"){						//
				alert("회원에게만 글쓰기 권한이 있습니다.");		//
				location.href="./../login/login.jsp";  	//
			}
			else if(value=="5") // 바뀐 부분
				location.href="index.jsp?contentPage=../review/reviewList.jsp"; // 바뀐 부분
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