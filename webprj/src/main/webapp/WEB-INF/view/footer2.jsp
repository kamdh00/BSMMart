<%-- S-mart footer.jsp --%>
<%@ page contentType="text/html; charset=euc-kr"%>
<%-- <%@ page import="vo.AdminVO" %> --%>
<html>
 <head>
  <title>Footer</title>
  <link href="css/default.css" rel="stylesheet" type="text/css" />
  <link href="css/footer.css" rel="stylesheet" type="text/css" />	
</head>
	<body>
		<%-- footer_wrap �κ�--%>
		<div id="footer_wrap">	
			<div id="footer_center" align="center">		
			<div id="footer"><img src="<%=request.getContextPath()%>/img/bsm.gif" 
				width="56" height="40" /><p>BSM-MART ������Ʈ  |  �ּ� : ��⵵ ���ֽ� ������<br
				/>Tel : 1577-1577 / FAX : ����<br/>Copyright(c) 2021 . All rights reserved. 
<%-- ���� üũ --%>
<%-- <%
	AdminVO admin = (AdminVO)session.getAttribute("admin");
	if(admin != null){
%>
	<a href="<%=request.getContextPath()%>/adminLoginProc.do?id=<%=admin.getaId()%>&pwd=<%=admin.getaPwd()%>" 
		style="color:#0000FF;">������ <%=admin.getaName()%> ������</a>
<%
	}
	else {
%> --%>
	<a href="<%=request.getContextPath()%>/templete.jsp?content=admin/adminLogin" style="color:#ffffff;">�����ڷα���</a>
<%-- <%
	}
%>	 --%>		
		</p></div>
			</div>					
		</div>		
		<%-- footer_wrap �κ� ��--%>
	</body>
</html>