<%@ page language="java" contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>주민 번호 유효성 검사</title>
<script>
	function check(numObj) {		
		var num = numObj.ssn1.value + numObj.ssn2.value;		
		if (num == '') {
			alert("주민등록번호를 정확하게 입력해주세요.");
			numObj.focus();
			return false;
		}
		if (num.length != 13) {
			alert("주민등록번호를 '-' 를 제외한 13자리 숫자로 입력하세요.");
			numObj.focus();
			return false;
		}
		if (isNaN(num)) {
			alert("주민등록번호는 숫자만 입력이 가능합니다.");
			numObj.focus();
			return false;
		}
		// 다음페이지로 넘길 값들
		var name = numObj.name.value;
		var ssn1 = num.substring(0, 6);
		var ssn2 = num.substring(6, 13);
		if ((ssn1.length == 6) && (ssn2.length == 7)) {
			var ssn = ssn1 + ssn2;
			a = new Array(13);
			for ( var i = 0; i < 13; i++) {
				a[i] = parseInt(ssn.charAt(i));
			}
			var k = 11 - (((a[0] * 2) + (a[1] * 3) + (a[2] * 4) + (a[3] * 5)
					+ (a[4] * 6) + (a[5] * 7) + (a[6] * 8) + (a[7] * 9)
					+ (a[8] * 2) + (a[9] * 3) + (a[10] * 4) + (a[11] * 5)) % 11);
			if (k > 9) {
				k -= 10;
			}
			if (k == a[12]) {
				alert("주민번호 확인 완료");
				window.close();
				document.numObj.submit();
				
				window.opener.location.href="<%=request.getContextPath()%>/joinForm.do?name="+name+"&ssn1="+ssn1+"&ssn2="+ssn2;			
			} else {
				alert("잘못된 주민등록번호 입니다.\n\n다시 입력해 주세요.");
				numObj.value = "";
				numObj.focus();
				return false;
			}
		}
	}
	
	function cancelBoard(){
		window.close();
	}
</script>
</head>
<body>
	<form name="numObj" method="POST">
	<table border="1" align="center">
		<tr>
			<td>이 름 : </td>
			<td><input type="text" name="name" size="15" maxlength="15"/></td>
		</tr>
		<tr>
		<tr>
			<td colspan="2">주민등록번호 13자리를 입력하시오</td>
		</tr>
		<tr>
			<td>주민 번호 : </td>
			<td><input type="text" name="ssn1" size="6" maxlength="6"/> - <input type="text" name="ssn2" size="7" maxlength="7"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="확인" onclick="check(this.form)">&nbsp;
				<input type="reset" value="취소" onclick="cancelBoard()">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>