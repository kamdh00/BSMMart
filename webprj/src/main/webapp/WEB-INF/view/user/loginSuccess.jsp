<%@ page language="java" contentType="text/html; charset=euc-kr" %>
<%@ page session="true" %>

<html>
<head>
<title>�α��� �Ϸ�</title>
</head>
<body>	
	<p align="center">${ sessionScope.member.mName }���� �α��� �ϼ̽��ϴ�.</p><br/>
	<p align="center"><a href="<%=request.getContextPath()%>/listProduct.do">��ǰ����Ʈ ����</a></p>	
</body>
</html>