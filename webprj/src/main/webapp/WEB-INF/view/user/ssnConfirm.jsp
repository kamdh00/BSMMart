<%@ page language="java" contentType="text/html; charset=euc-kr" %>

<html>
<head>
<title>�ֹ� ��ȣ ��ȿ�� �˻�</title>
<script>
	function check(numObj) {		
		var num = numObj.ssn1.value + numObj.ssn2.value;		
		if (num == '') {
			alert("�ֹε�Ϲ�ȣ�� ��Ȯ�ϰ� �Է����ּ���.");
			numObj.focus();
			return false;
		}
		if (num.length != 13) {
			alert("�ֹε�Ϲ�ȣ�� '-' �� ������ 13�ڸ� ���ڷ� �Է��ϼ���.");
			numObj.focus();
			return false;
		}
		if (isNaN(num)) {
			alert("�ֹε�Ϲ�ȣ�� ���ڸ� �Է��� �����մϴ�.");
			numObj.focus();
			return false;
		}
		// ������������ �ѱ� ����
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
				alert("�ֹι�ȣ Ȯ�� �Ϸ�");
				window.close();
				document.numObj.submit();
				
				window.opener.location.href="<%=request.getContextPath()%>/joinForm.do?name="+name+"&ssn1="+ssn1+"&ssn2="+ssn2;			
			} else {
				alert("�߸��� �ֹε�Ϲ�ȣ �Դϴ�.\n\n�ٽ� �Է��� �ּ���.");
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
			<td>�� �� : </td>
			<td><input type="text" name="name" size="15" maxlength="15"/></td>
		</tr>
		<tr>
		<tr>
			<td colspan="2">�ֹε�Ϲ�ȣ 13�ڸ��� �Է��Ͻÿ�</td>
		</tr>
		<tr>
			<td>�ֹ� ��ȣ : </td>
			<td><input type="text" name="ssn1" size="6" maxlength="6"/> - <input type="text" name="ssn2" size="7" maxlength="7"/></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="button" value="Ȯ��" onclick="check(this.form)">&nbsp;
				<input type="reset" value="���" onclick="cancelBoard()">
			</td>
		</tr>
	</table>
	</form>
</body>
</html>