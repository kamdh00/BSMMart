<%-- detail_information.jsp --%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="func" uri="http://java.sun.com/jsp/jstl/functions"%>

<head>
<title>공지사항 보기</title>
<script type="text/javascript">
			<%-- 수정 --%>
			function modifyBoard(form){
				// 게시글 수정폼 요청
				form.action = "<%=request.getContextPath()%>/informationUpdateBoard.do";
				form.submit();
			}
			
			<%-- 삭제 --%>
			function removeBoard(form){
				var boardNo=form.no.value;
				var url="<%=request.getContextPath()%>
	/information/informationRemovePassword.jsp?no="
				+ boardNo;

		window.open(url, "", "width=300, height=250");
	}
</script>
</head>
<section id="content">
	<h1 align="center">공지사항 보기</h1>
	<div class="container">
		<div class="row">
			<input type="hidden" name="no">
			<table width="400" border="1" cellspacing="0" cellpadding="0"
				align="center">
				<tr>
					<td width="70" align="center">글번호</td>
					<td width="330">${ informationDetail.iNo }</td>
				</tr>
				<tr>
					<td width="70" align="center">제 목</td>
					<td width="330">${ informationDetail.iTitle }</td>
				</tr>
				<tr>
					<td width="70" align="center">내 용</td>
					<td width="330">${func:replace(informationDetail.iContent, "\\n",
								"<br/>")}</td>
				</tr>
			</table>
			<%-- <%
	AdminVO admin = (AdminVO)session.getAttribute("admin");
	if(admin != null){
%>
<form>
	<input type="button" value="수정" onclick="modifyBoard(this.form)" /> 
	<input type="button" value="삭제" onclick="removeBoard(this.form)" /> 
	<input type="hidden" name="no" value="${ requestScope.informationDetail.iNo }" />
</form>
<%
	}
%> --%>
		</div>
		<p align="center"><a href="/information/list_information" >목록보기</a></p>
	</div>
</section>
