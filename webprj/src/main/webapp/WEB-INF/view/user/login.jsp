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
						alert(name+"님이 로그인 하셨습니다.");
						var str = "<span style='color:white; font-weight:bold;'>"+name+"님</span>&nbsp;";
						str += "<a href='/user/logout/' style='color:white;'>로그아웃</a>";
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
						alert(id+"님은 회원 이십니다.");						
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
							alt="로그인"></td>
					</tr>
					<tr>
						<td class="login_font" align="center"><strong>아이디</strong> (ID)</td>
						<td><input type="text" name="id" size="20" style="margin:10px;"/></td>
					</tr>
					<tr>
						<td class="login_font" align="center"><strong>비밀번호</strong> (Password)</td>
						<td><input type="password" name="pwd" size="20" style="margin:10px;" /></td>
					</tr>
					<tr>
						<td colspan="2" align="center"><a
							href="javascript:loginSelect()"> <img
								src="/img/login/btn_login.gif" width="82" height="36" alt="로그인"
								style="cursor: pointer;" />
						</a> <a href="javascript:cancel()"> <img
								src="/img/login/btn_cancel.gif" width="82" height="36" alt="취소"
								style="cursor: pointer;" />
						</a></td>
					</tr>
					<tr>
						<td class="login_font" colspan="2" align="center">BSM-MART 회원이
							되시면 더욱 큰 혜택과<br /> 편리한 쇼핑이 가능합니다.<br /> 회원가입을 통해 BSM-MART회원의 편리함을
							누리세요.
						</td>
					</tr>
					<tr>
						<td colspan="2" align="center"><a
							href="javascript:ssnConfirm()"> <img
								src="<%=request.getContextPath()%>/img/login/btn_join.gif"
								width="84" height="35" alt="회원가입" style="cursor: pointer;" />
						</a></td>
					</tr>
					<tr>
						<td><input type="input" name="userId" size="20" style="margin:10px;" /></td>
						<td colspan="2" align="center">
							<a href="javascript:memberSearch()">회원조회</a>
						</td>
					</tr>
				</table>
			</form>
		</div>
	</div>
</section>
