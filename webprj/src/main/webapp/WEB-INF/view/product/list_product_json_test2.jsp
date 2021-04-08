<%@page import="com.fasterxml.jackson.annotation.JsonValue"%>
<%@page import="com.fasterxml.jackson.databind.util.JSONPObject"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <% 
Object ob = request.getAttribute("jsonObject");
String json4String = ""; 
json4String = ob.toString();
%> --%> 
<script type="text/javascript">
<%-- jQuery(function(){ 
      $('#output').empty(); 
      $('#output').append('<%=json4String%>'); 
} 
}); --%> 
</script> 
<html> 
<head> 
<%/* String temp = (String)request.getAttribute("jsonObject");

Object obj = JSONV JSONValue.parse(temp);
JSONPObject object = (JSONPObject) obj; */

%>
</head> 
<body> 
<div id="output">
 
	<c:forEach items="${jsonObject}" var="list">
		<h1>${list.pName}</h1>	
	</c:forEach>
</div> 
</body> 
</html> 