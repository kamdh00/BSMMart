<%@ page contentType="text/html; charset=euc-kr"%>
<%@ page session="true"%>

<link href="/css/default.css" rel="stylesheet" type="text/css" />
<link href="/css/login.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
		  	function ssnConfirm(){		
				var url="<%=request.getContextPath()%>/user/ssnConfirm.jsp";			
				window.open(url, "", "width=300, height=190");
			}
		  	
		  	function loginSelect(){		  		
				var id=document.form.id.value;
				var pwd=document.form.pwd.value;								
				$.ajax({
					url:"/user/loginSelect",
					method:"get",
					dataType:"json",
					data:{ "mId" : id, "mPwd" : pwd},
					success:function(data){
						var id = data.id;
						var name = data.name;
						alert(name+"���� �α��� �ϼ̽��ϴ�.");
						var str = "<span style='color:white; font-weight:bold;'>"+name+"��</span>&nbsp;";
						str += "<a href='/user/logout/' style='color:white;'>�α׾ƿ�</a>";
						$("#login").html(str);
					}
				});
				
				window.location.href = "/product/list_product";
			}
		  	
		  	function cancel(){
		  		document.form.id.value="";
		  		document.form.pwd.value="";		  		
		  	}
		  	
		  	function memberSearch(){
		  		var userId=document.form.userId.value;
		  		alert(userId);
		  		$.ajax({
					url:"/user/memberCheck",
					method:"get",
					dataType:"json",
					data:{ "mId" : userId},
					success:function(data){
						var id = data.mId;						
						alert(id+"���� ȸ�� �̽ʴϴ�.");						
					}
				});
		  		//location.href="/user/getMember?id="+userId;
		  	}
	  	</script>
<section id="content">
	<div class="container">
		<div class="row aln-center">
			<form name="form" method="post">
				<table id="login" align="center">
					<tr>
						<td id="login_bg" colspan="2"><img
							src="/img/login/head_login_1.gif" width="50px" height="19px"
							alt="�α���"></td>
					</tr>
					<tr>
						<td class="login_font" align="center"><strong>���̵�</strong> (ID)</td>
						<td><input type="text" name="id" size="20" style="margin:10px;"/></td>
					</tr>
					<tr>
						<td class="login_font" align="center"><strong>��й�ȣ</strong> (Password)</td>
						<td><input type="password" name="pwd" size="20" style="margin:10px;" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><a
							href="javascript:loginSelect()"> <img
								src="/img/login/btn_login.gif" width="82" height="36" alt="�α���"
								style="cursor: pointer;" />
						</a> <a href="javascript:cancel()"> <img
								src="/img/login/btn_cancel.gif" width="82" height="36" alt="���"
								style="cursor: pointer;" />
						</a></td>
					</tr>
					<tr>
						<td class="login_font" colspan="2" align="center">BSM-MART ȸ����
							�ǽø� ���� ū ���ð�<br /> ���� ������ �����մϴ�.<br /> ȸ�������� ���� BSM-MARTȸ���� ������
							��������.
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><a
							href="javascript:ssnConfirm()"> <img
								src="<%=request.getContextPath()%>/img/login/btn_join.gif"
								width="84" height="35" alt="ȸ������" style="cursor: pointer;" />
						</a></td>
					</tr>
					<tr>
						<td><input type="input" name="userId" size="20" style="margin:10px;" /></td>
						<td colspan="2" align="center">
							<a href="javascript:memberSearch()">ȸ����ȸ</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</section>
