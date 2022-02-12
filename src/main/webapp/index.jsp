<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
    String contentPage=request.getParameter("contentPage");
	if(contentPage==null)
		contentPage="firstview.jsp";
%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
	<head>
	<meta charset="EUC-KR">
	<title>index</title>
	<link href="index.css" rel="stylesheet" type="text/css" />
	</head>
<body onload="javascript:openPopup('popup.html')">
	<%-- �˾�â���� �����ð� ���� --%>
	<script>
		function getCookie(name) {
			var cookie = document.cookie;
			if (document.cookie != "") {
				var cookie_array = cookie.split(";");
				for ( var index in cookie_array) {
					var cookie_name = cookie_array[index].split("=");
					if (cookie_name[0] == "popupYN") {
						return cookie_name[1];
					}
				}
			}
			return;
		}
		
		function openPopup(url) {
			var cookieCheck = getCookie("popupYN");
			if (cookieCheck != "N") window.open("popup.html",'popup','width=450,height=270,left=0,top=0')
		}
	</script>
	
	<div id="wrap">
		<div id="header">
			<jsp:include page="header.jsp" />
		</div>
		<div id="main">
			<jsp:include page="<%=contentPage%>" />
		</div>
		<div id="footer">
			<jsp:include page="footer.jsp" />
		</div>
	</div>
</body>
</html>