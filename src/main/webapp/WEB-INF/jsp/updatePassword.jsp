<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- base href="http://localhost:8080/video/" -->
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no">


<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
<meta name="description"
	content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
<script src="jQuery/jquery-3.4.1.min.js"></script>
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

				<li class="menu_active"><a">个人中心</a></li>
			</ul>

			<div id="user_bar">
				<a> <img id="avatar" src="${user.imgurl }" alt="">
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
				<li><a href="updateUser.do">更改资料</a></li>
				<li class="profile_tab_line">|</li>
				<li><a href="updateImgurl.do">更改头像</a></li>
				<li class="profile_tab_line">|</li>
				<li><a>密码安全</a></li>
			</ul>
			<div class="proflle_tab_body">
				<div class="proflle_tab_workplace clearfix">
					<div class="profile_avatar_area">
						<img id="avatar" width="200px;" src="http://localhost:8080/Voids/"
							alt="">
					</div>
					<div class="profile_ifo_area">
						<form action="updatePassword1.do" method="post">
							<div class="form_group">
								<span class="dd">旧 密 码：</span> <input type="password" id="oldPass"><span
									id="oldMsg"></span>
							</div>
							<div class="form_group">
								<span class="dd">新 密 码：</span> <input  type="password" id="pass">
							</div>
							<div class="form_group">
								<span class="dd">确认新密码：</span> <input type="password" id="passAgain" name="pass"><span
									id="passMsg"></span>
							</div>
							<div class="form_submit dd">
								<input value="保　存" type="submit" id="submit" onclick="return check()"> <a>取消</a>
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

<script type="text/javascript">

$("#oldPass").blur(function(){
	 var password=$("#oldPass").val();
	 
	 if(password==null||password==""){
		 $("#oldMsg").text("密码不能为空").css("color","red");
			regIsCommitPsw =false;
	 }else{
		 var params={"password":password};
			$.post("checkPassword.do",params,function(data){
				if(data=="success"){
					$("#oldMsg").text("密码正确").css("color","green");
				}else{
					$("#oldMsg").text("旧密码输入错误").css("color","red");
					regIsCommitPsw =false;
				}			
			})		
	 }
})


$("#passAgain").blur(function(){
	var pass01= $("#pass").val();
	var pass02= $("#passAgain").val();
	if(null==pass01 || ""==pass01 || null==pass02 || ""==pass02){
		$("#passMsg").text("密码不能为空").css("color","red");
		$("#submit").attr("disabled",true);
	}else{
		if(pass01!=pass02){
			$("#submit").attr("disabled",true);
			$("#passMsg").text("两次密码输入不一致，请重新输入").css("color","red");
		}else{
			$("#submit").attr("disabled",false);
			$("#passMsg").text("");
		}
	}
});


function check(){
	var pass01= $("#pass").val();
	var pass02= $("#passAgain").val();
	if(null==pass01 || ""==pass01 || null==pass02 || ""==pass02){
		$("#passMsg").text("密码不能为空").css("color","red");
		$("#submit").attr("disabled",true);
		return false;
	}else{
		$("#submit").attr("disabled",false);
		return true;
	}
}



</script>


</body>
</html>