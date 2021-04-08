<%-- S-mart header.jsp --%>
<%@ page contentType="text/html; charset=euc-kr"%>
<%-- <%@ page import="vo.MemberVO" %> --%>

<html>
 <head>
  <title>Header</title>
  <link href="/css/default.css" rel="stylesheet" type="text/css" />
  <link href="/css/header.css" rel="stylesheet" type="text/css" />
  <script type="text/javascript" language="javascript" src="/script/swapImage.js"></script>
  <script type="text/javascript">
  function ssnConfirm(){		
		var url="<%=request.getContextPath()%>/user/ssnConfirm.jsp";
	
		window.open(url, "", "width=300, height=250");
	}
  </script>	
</head>
	<body>
		<%-- header wrap �κ� --%>	
		<div id="header_wrap" align="center">
			<%-- header �κ� --%>		
			<div id="header">
				<div id="logo" >
					<a href="<%=request.getContextPath()%>/index.jsp"><img src="/img/bsm.gif" width="100" height="60" />Mart</a>
				</div>
				<div id="client_form">
<ul>
<%-- <%
	MemberVO member = (MemberVO)session.getAttribute("member");
	if(member != null){
%>
					<li><p><%=member.getmName()%>�� �ȳ��ϼ���</p></li>
					<li><a href="<%=request.getContextPath()%>/memberLogout.do?id=<%=member.getmId()%>"><img src="<%=request.getContextPath()%>/img/topMenu_02.gif" 
					width="45" height="16" alt="�α׾ƿ�" /></a></li>	 --%>
					<%-- <li><a href="<%=request.getContextPath()%>/templete.jsp?content=user/checkJoin"><img src="<%=request.getContextPath()%>/img/topMenu_04.gif" 
					width="58" height="16" alt="����������" /></a></li>
					<li><a href="<%=request.getContextPath()%>/listBasket.do"><img src="<%=request.getContextPath()%>/img/topMenu_05.gif" 
					width="53" height="16" alt="��ٱ���" /></a></li>
					<li><a href="<%=request.getContextPath()%>/listOrder.do"><img src="<%=request.getContextPath()%>/img/topMenu_07.gif" 
					width="73" height="16" alt="�ֹ������ȸ" /></a></li> --%>
<%-- <%
	}
	else{
%>	 --%>				
					<li><a href="javascript:ssnConfirm()"><img src="/img/topMenu_03.gif" 
					width="52" height="16" alt="ȸ������" /></a></li>
					<li><a href="/templete.jsp?content=user/login"><img src="/img/topMenu_01.gif" 
					width="45" height="16" alt="�α���" /></a>
					</li>
<%-- <%
	}
%> --%>
					</ul>
				</div>						
			</div>
			<%-- header �κ� ��--%>
			<%-- �׺���̼� �޴��� �κ� --%>
			<div id="nav">
				<div id="nav_center" align="center">
				<dl id="nav1">
					<dt id="nav1-dt"><a href="<%=request.getContextPath()%>/eventListBoard.do"><img id="nav1-dt-img" 
					src="/img/menubar_01.gif" 
					width="90" height="30" alt="�̺�Ʈ" onmouseover="swapImage('nav1-dt-img',
					'<%=request.getContextPath()%>/img/menubar_02.gif','nav2-dt-img',
					'<%=request.getContextPath()%>/img/menubar_03.gif','nav3-dt-img',
					'<%=request.getContextPath()%>/img/menubar_05.gif','nav4-dt-img',
					'<%=request.getContextPath()%>/img/menubar_07.gif','nav5-dt-img',
					'<%=request.getContextPath()%>/img/menubar_09.gif'); " onmouseout="restoreImage()" /></a><img 
					src="<%=request.getContextPath()%>/img/menubar_b_line.gif" width="12" height="30" /></dt>
				</dl>
				<dl id="nav2">
					<dt id="nav2-dt"><a href="<%=request.getContextPath()%>/listProduct.do?cNo=1"><img id="nav2-dt-img" src="<%=request.getContextPath()%>/img/menubar_03.gif" 
					width="90" height="30" alt="����/�Ｎ��ǰ" onmouseover="swapImage('nav1-dt-img',
					'<%=request.getContextPath()%>/img/menubar_01.gif','nav2-dt-img',
					'<%=request.getContextPath()%>/img/menubar_04.gif','nav3-dt-img',
					'<%=request.getContextPath()%>/img/menubar_05.gif','nav4-dt-img',
					'<%=request.getContextPath()%>/img/menubar_07.gif','nav5-dt-img',
					'<%=request.getContextPath()%>/img/menubar_09.gif'); " onmouseout="restoreImage()" /></a><img
					 src="<%=request.getContextPath()%>/img/menubar_b_line.gif" width="12" height="30" /></dt>
				</dl>
				<dl id="nav3">
					<dt id="nav3-dt"><a href="<%=request.getContextPath()%>/listProduct.do?cNo=2"><img id="nav3-dt-img" src="<%=request.getContextPath()%>/img/menubar_05.gif" 
					width="90" height="30" alt="����/Ŀ��/����" onmouseover="swapImage('nav1-dt-img',
					'<%=request.getContextPath()%>/img/menubar_01.gif','nav2-dt-img',
					'<%=request.getContextPath()%>/img/menubar_03.gif','nav3-dt-img',
					'<%=request.getContextPath()%>/img/menubar_06.gif','nav4-dt-img',
					'<%=request.getContextPath()%>/img/menubar_07.gif','nav5-dt-img',
					'<%=request.getContextPath()%>/img/menubar_09.gif'); " onmouseout="restoreImage()" /></a><img
					 src="<%=request.getContextPath()%>/img/menubar_b_line.gif" width="12" height="30" /></dt>
				</dl>				
				<dl id="nav4">
					<dt id="nav4-dt"><a href="<%=request.getContextPath()%>/listProduct.do?cNo=3"><img id="nav4-dt-img" src="<%=request.getContextPath()%>/img/menubar_07.gif" 
					width="90" height="30" alt="��Ȱ��ǰ" onmouseover="swapImage('nav1-dt-img',
					'<%=request.getContextPath()%>/img/menubar_01.gif','nav2-dt-img',
					'<%=request.getContextPath()%>/img/menubar_03.gif','nav3-dt-img',
					'<%=request.getContextPath()%>/img/menubar_05.gif','nav4-dt-img',
					'<%=request.getContextPath()%>/img/menubar_08.gif','nav5-dt-img',
					'<%=request.getContextPath()%>/img/menubar_09.gif'); " onmouseout="restoreImage()" /></a><img
					 src="<%=request.getContextPath()%>/img/menubar_b_line.gif" width="12" height="30" /></dt>
				</dl>
				<dl id="nav5">
					<dt id="nav5-dt"><a href="<%=request.getContextPath()%>/informationListBoard.do"><img id="nav5-dt-img" src="<%=request.getContextPath()%>/img/menubar_09.gif" 
					width="90" height="30" alt="������" onmouseover="swapImage('nav1-dt-img',
					'<%=request.getContextPath()%>/img/menubar_01.gif','nav2-dt-img',
					'<%=request.getContextPath()%>/img/menubar_03.gif','nav3-dt-img',
					'<%=request.getContextPath()%>/img/menubar_05.gif','nav4-dt-img',
					'<%=request.getContextPath()%>/img/menubar_07.gif','nav5-dt-img',
					'<%=request.getContextPath()%>/img/menubar_10.gif'); " onmouseout="restoreImage()" /></a></dt>
				</dl>
				</div>
			</div>
			<%-- �׺���̼� �޴��� �κ� ��--%>			
		</div>
		<%-- header wrap �κ� ��--%>
	</body>			
</html>