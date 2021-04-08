<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page session="true" %>

<html>
<head>
<title>로그인 완료</title>
</head>
<body>	
	<p align="center">${ sessionScope.member.mName }님이 로그인 하셨습니다.</p><br/>
	<p align="center"><a href="<%=request.getContextPath()%>/listProduct.do">상품리스트 보기</a></p>	
</body>
</html>