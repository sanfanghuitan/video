<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no">

<meta name="renderer" content="webkit">
<meta name="keywords"
	content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
<meta name="description"
	content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
<script src="./jQuery/jquery-3.4.1.min.js"></script>
<script src="./jQuery/js/distpicker.data.js"></script>
<script src="./jQuery/js/distpicker.js"></script>
<script src="./jQuery/js/main.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="./static/z/base.css">
<link rel="stylesheet" href="./static/z/profile.css">
<link rel="icon" href="http://localhost:8080/Voids/static/z/favicon.png"
	type="image/png">
<title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
</head>

<body class="w100">
	<header>
	<div class="container top_bar clearfix">
		<img src="./static/z/logo.png" alt="智游">
		<div id="tele">
			<span>4006-371-555</span> <span>0371-88888598</span>
		</div>
	</div>
	<menu>
		<div class="container clearfix">
			<ul class="clearfix f_left">
				<li><a>首页</a></li>

				<li class="menu_active"><a>个人中心</a></li>
			</ul>

			<div id="user_bar">
				<a> <img id="avatar" src="${user.imgurl }" alt="""="">
				</a> <a href="userExit.do">退出</a>
			</div>
		</div>
	</menu>
	</header>

	<main>
	<div class="container">
		<h2>我的资料</h2>
		<div id="profile_tab">
			<ul class="profile_tab_header f_left clearfix">
				<li><a>更改资料</a></li>
				<li class="profile_tab_line">|</li>
				<li><a href="updateImgurl.do">更改头像</a></li>
				<li class="profile_tab_line">|</li>
				<li><a href="updatePassword.do">密码安全</a></li>
			</ul>
			<div class="proflle_tab_body">
				<div class="proflle_tab_workplace clearfix">
					<div class="profile_avatar_area">
						<img src="${user.imgurl}" width="200px;">
					</div>
					<div class="profile_ifo_area">
						<form id="formId" action="alterUser.do">
						<div id="reset">
							<input name="id" value="${user.id}" type="hidden">
							<div class="form_group">
								<span class="dd">昵 称：</span><input name="nickname" type="text" id="nickname"
									value="${user.nickname }">
							</div>
							<div class="form_group">
								<!-- <span class="dd">性 别：</span> <input id="man" type="radio">
								<label for="man">男</label> <input id="woman" type="radio">
								<label for="woman">女</label> -->
																
								<%-- <span class="dd">性 别：</span> <input type="radio" name="sex" value="男"  
								<c:if test="${user.sex eq 'man'}">selected</c:if>>男
                                <input type="radio" name="sex" value="女"   
                                <c:if test="${user.sex eq 'woman'}">selected</c:if>>女   --%>
                                                        
                                <span class="dd">性 别：</span><c:if test="${user.sex=='男'}">
                                <input type="radio" id="rd" name="sex" checked="checked" value="男"/>男
                                <input type="radio" id="rd" name="sex" value="女"/>女
                                </c:if>

                                <c:if test="${user.sex=='女'}">
                                <input type="radio" id="rd" name="sex" value="男"/>男
                                <input type="radio" id="rd" name="sex" checked="checked" value="女"/>女
                                </c:if>				
							</div>
							<div class="form_group">
								<span class="dd">生 日：</span>
								<!-- 1990-10-04 -->
								<input name="birthday" type="text" value="${user.birthday }" id="birthday">
							</div>
							<div class="form_group">
								<span class="dd">邮 箱：</span> <span name="accounts">${user.accounts }</span>
							</div>
							<div class="form_group">
								<span class="dd">所在地：</span>
								<div id="city">
								<div data-toggle="distpicker" id="target">
                                <select id="provinceName" name="provinceName"></select>
                                <select id="cityName" name="cityName"></select>
                                  </div>
								</div>
								<input name="address" id="address" type="hidden">
							</div>
							<span id="passMsg"></span>
							</div>
							<div class="form_submit dd">
								<input  value="保　存" type="submit" onclick="return check()">
								<a onclick="reset()">重置</a>
							</div>

						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	</main>



	<footer>
	<div class="container">
		<ul>
			<li><img src="./static/z/footer_logo.png" alt=""
				id="foot_logo"></li>
			<li>版权所有：智游3G教育 ©&nbsp;www.zhiyou100.com</li>
			<li><img src="./static/z/a.png" alt="" id="wxgzh"></li>
		</ul>
	</div>
	</footer>


	<script src="./static/z/jquery-1.js"></script>
	<script src="./static/z/gVerify.js"></script>
	<script src="./static/z/index.js"></script>

	<script src="./static/z/jquery.js"></script>
	<script type="text/javascript">

		
		function commitForm(){

			var address= $(".prov").val()+"-"+$(".city").val();

			$("#address").val(address);

			// $("form").commit();
			return true;
		}
		
		function reset(){
			
			$("#reset").find("input,textarea").each(function(){
				   this.value = "";//也可以清空数据this.value ="";
				});
			 document.getElementById("rd").checked=false;
	
			 $("#target").distpicker("destroy");
			 $('#target').distpicker({
			   province: '---- 你需要选择的省 ----',
			   city: '----你需要选择的城市 ----'
			 });
		}
		
		$(function(){
		        $("#target").distpicker({
		        	 province: '---- 你需要选择的省 ----',
					   city: '----你需要选择的城市 ----'
		        });
		});
		
		function check(){
			var name= $("#nickname").val();
			var birthday=$("#birthday").val();
			if(null==name || ""==name ||null==birthday ||""==birthday){
				$("#passMsg").text("不能有空值").css("color","red");
				return false;
			}else{
				return true;
			}
		}

		
		
		
    </script>


</body>
</html>