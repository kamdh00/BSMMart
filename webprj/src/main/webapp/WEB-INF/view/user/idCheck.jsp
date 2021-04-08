<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ page session="true" %>

<html>
<head>
<title>아이디 확인 완료</title>
	<script type="text/javascript">	
	function check(){
		var id=document.form.mId.value;
		var pwd=document.form.mPwd.value;	
		if(id != document.form.mid.value){			
			alert("아이디가 일치하지 않습니다.");
		}
		else if(pwd != document.form.pwd.value){
			alert("비밀번호가 일치하지 않습니다.");			
		}
		else{
			alert("회원 탈퇴 되었습니다.");
			document.form.submit();
		}
		window.close();
	}
	</script>
</head>
<body>
	<form name="form" action="<%=request.getContextPath()%>/idCheck.do">
	<input type="hidden" name="mId" value="${sessionScope.member.mId }"/>
	<input type="hidden" name="mPwd" value="${sessionScope.member.mPwd }"/>
	<table align="center" border="1">
		<tr>
			<td>ID : </td>
			<td><input type="text" name="mid"/></td>
		</tr>
		<tr>
			<td>PW : </td>
			<td><input type="password" name="pwd"/></td>
		</tr>
		<tr>
			<td><input type="button" name="drop" value="삭제" onclick="check()"/></td>			
		</tr>
	</table>	
	</form>
</body>
</html>