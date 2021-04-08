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
		<%-- footer_wrap 부분--%>
		<div id="footer_wrap">	
			<div id="footer_center" align="center">		
			<div id="footer"><img src="<%=request.getContextPath()%>/img/bsm.gif" 
				width="56" height="40" /><p>BSM-MART 프로젝트  |  주소 : 경기도 여주시 신진동<br
				/>Tel : 1577-1577 / FAX : 없음<br/>Copyright(c) 2021 . All rights reserved. 
<%-- 세션 체크 --%>
<%-- <%
	AdminVO admin = (AdminVO)session.getAttribute("admin");
	if(admin != null){
%>
	<a href="<%=request.getContextPath()%>/adminLoginProc.do?id=<%=admin.getaId()%>&pwd=<%=admin.getaPwd()%>" 
		style="color:#0000FF;">관리자 <%=admin.getaName()%> 접속중</a>
<%
	}
	else {
%> --%>
	<a href="<%=request.getContextPath()%>/templete.jsp?content=admin/adminLogin" style="color:#ffffff;">관리자로그인</a>
<%-- <%
	}
%>	 --%>		
		</p></div>
			</div>					
		</div>		
		<%-- footer_wrap 부분 끝--%>
	</body>
</html>