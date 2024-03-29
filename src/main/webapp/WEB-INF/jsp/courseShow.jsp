<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">
<!-- base href="http://localhost:8080/video/" -->
<meta name="viewport"
	content="initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<meta name="keywords"
	content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
<meta name="description"
	content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
<script src="../jQuery/jquery-3.4.1.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="/static/z/base.css">
<link rel="stylesheet" href="/static/z/css.css">
<link rel="icon" href="http://localhost:8080/video/favicon.png"
	type="image/png">
<title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
<style type="text/css">
#AdminAcount {
	background-image: url("/static/z/user.png");
	background-repeat: no-repeat;
	background-position: 8px center;
}
</style>

</head>

<body class="w100" style="padding-top: 0px;">
	<header>
	<div class="container">
		<span>欢迎来到IT培训的黄埔军校——智游教育！</span>

		<c:if test="${user != null }">
			<div id="userName" style="float: right">
				<i id="user"></i> <a href="userShow.do"><img id="avatar"
					src="${user.imgurl}" alt="" width="30px;"><i>${user.accounts}</i></a>
				<a target="_blank" href="userExit.do"><img
					src="/static/z/we.png" draggable="false">退出</a>
			</div>
		</c:if>

		<c:if test="${user == null }">
			<div id="userBlock" class="userBlock none" style="float: right">
				<a target="_blank" id="login_open"><img src="/static/z/we.png"
					draggable="false">登录</a> <a target="_blank" id="reg_open"><img
					src="/static/z/we.png" draggable="false">注册</a>
			</div>
		</c:if>


		<a onclick="JavaScript:addFavorite2()"><img
			src="/static/z/sc.png" draggable="false">加入收藏</a> <a
			id="adminreg_open" target="_blank"><img src="/static/z/we.png"
			draggable="false">后台管理</a> <a class="color_e4"><img
			src="/static/z/phone.png" draggable="false"> 0371-88888598
			4006-371-555</a>

	</div>
	</header>


	<div id="app">
		<!--banner图-->
		<div class="banner">
			<img alt="" src="/static/z/banner-1.jpg" width="100%"
				height="470px;">
		</div>

		<c:forEach items="${course.data }" var="i" varStatus="status">
			<!--面包屑导航-->
			<c:if test="${status.first }">
				<div class="container mian-nav" id="navDiv">公开课/${i.subject.subject_name}</div>
			</c:if>
			
			<div class="classify">
				<div class="container" id="dataContainer">
					<div class="section">
						<div class="classifyName">
							<p class="title title-first">${i.course_title}</p>
						</div>
						<div class="kcIntro">
							<p class="int">
								<span>课程介绍：</span> ${i.course_desc}
							</p>
						</div>
						<ul>
							<c:forEach items="${i.video}" var="video">
								<li class="section-main" onclick="getVideo('${video.video_id}')">
									<div class="thum"
										style="background-image: url(${video.image_url})"></div>
									<p><a href="playVideo?video_id=${video.video_id }&speaker_id=${video.speaker_id}&play_num=${video.play_num}">${video.title}</a></p>
									<div class="classify-v-info">
										<span class="count" title="观看次数"><img
											src="/static/z/count.png" alt="">${video.play_num }</span> <span
											class="duration" title="视频时长"><img
											src="/static/z/player.png" alt="">${video.time}</span>
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</c:forEach>

		<!--页脚-->
		<footer>
		<ul>
			<li><img src="/static/z/footer_logo.png" alt=""
				draggable="false"></li>
			<li class="mt25">
				<h3>各校区地址</h3>
				<ul>
					<li>总部地址<br>中国-郑州经济技术开发区河南省通信产业园六层
					</li>
					<li>郑州校区一<br>中国-郑州经济技术开发区第一大街与经北一路
					</li>
					<li>郑州校区二<br>中国-郑州经济技术开发区第四大街经开人才市场七楼
					</li>
					<li>郑州校区三<br>中国-郑州经济技术开发区第八大街河南省留学生创业园九层、十层
					</li>
					<li>西安分校<br>中国-西安莲湖区 联系人：梁老师 13201570801
					</li>
				</ul>
			</li>
			<li class="mt25">
				<h3>联系我们</h3>
				<ul id="foo_icon">
					<li>中国-郑州经济技术开发区经北三路河南通信产业园六层</li>
					<li>e-mail:zy@zhiyou100.com</li>
					<li>电话:4006-371-555 0371-88888598</li>
					<li class="erwei"><br>
						<div>
							<img class="weixin" src="./static/z/a_002.png" alt=""
								draggable="false"> <img class="weibo"
								src="/static/z/a.png" alt="" draggable="false">
						</div></li>
				</ul>
			</li>
		</ul>
		<div class="record">智游教育 © 豫ICP备17000832号-1 河南智游臻龙教育科技有限公司</div>
		</footer>


		<!--用户登录弹出框-->
		<div class="mask hidden" id="login">
			<div class="mask_content">
				<div class="mask_content_header">
					<img src="/static/z/logo.png" alt="" class="ma">
				</div>
				<div class="mask_content_body">
					<form name="loginForm" method="post" action="userLogin.login">
						<h3>快速登录</h3>
						<input id="loginEmail" placeholder="请输入邮箱" name="email"
							type="email"> <span id="UserLoginMsg"></span> <input
							id="loginPassword" placeholder="请输入密码" name="password"
							type="password"> <span id="UserPasswordMsg"></span>
						<div id="forget">
							<a
								href="http://localhost:8080/video/front/user/forgetPassword.action">忘记密码？</a>
						</div>
						<input value="登　录" type="submit" onclick="return UserLoginCheck()">
					</form>
				</div>
				<div class="mask_content_footer">
					<span id="login_close">关 闭</span>
				</div>
			</div>
		</div>



		<!--管理员登录弹出框-->
		<div class="mask hidden" id="adminLogin">
			<div class="mask_content">
				<div class="mask_content_header">
					<img src="/static/z/logo.png" alt="" class="ma">
				</div>
				<div class="mask_content_body">
					<form name="AdminloginForm" action="AdminLogin.login" method="post">
						<h3>快速登录</h3>
						<input id="AdminAcount" placeholder="请输入管理员账户"
							name="adminAccounts" type="text"
							style="width: 100%; margin: 15px 0; padding: 0 10px 0 50px; border: 1px solid #bac0ce">
						<span id="AdminAccountMsg"></span> <input id="AdminPassword"
							placeholder="请输入密码" name="adminPassword" type="password">
						<span id="AdminPasswordMsg"></span>
						<div id="forget">
							<a
								href="http://localhost:8080/video/front/user/forgetPassword.action">忘记密码？</a>
						</div>
						<input id="loginSubmit" value="登录" type="submit"
							onclick="return AdminLoginCheck()">
					</form>
				</div>
				<div class="mask_content_footer">
					<span id="adminreg_close">关 闭</span>
				</div>
			</div>
		</div>
		<div class="mask hidden" id="reg">
			<div class="mask_content">
				<div class="mask_content_header">
					<img src="/static/z/logo.png" alt="" class="ma">
				</div>
				<div class="mask_content_body">
					<form id="regForm"
						action="http://localhost:8080/Voids/user/insertUser.action">
						<h3>新用户注册</h3>
						<input id="regEmail" placeholder="请输入邮箱" name="email" type="email"><span
							id="emailMsg"></span> <input id="regPsw" placeholder="请输入密码"
							name="password" type="password"> <input id="regPswAgain"
							placeholder="请再次输入密码" name="psw_again" type="password"><span
							id="passMsg"></span>
						<div id="yzm" class="form-inline">
							<input name="yzm" style="width: 45%; display: inline-block;"
								type="text">
							<div id="v_container"
								style="width: 45%; height: 40px; float: right;">
								<canvas id="verifyCanvas" width="100" height="38"
									style="cursor: pointer;">您的浏览器版本不支持canvas</canvas>
								<canvas id="verifyCanvas" width="100" height="38"
									style="cursor: pointer;">您的浏览器版本不支持canvas</canvas>
							</div>
						</div>
						<input onclick="return commitRegForm();" value="注　册" type="submit">
					</form>
				</div>
				<div class="mask_content_footer">
					<span id="reg_close">关 闭</span>
				</div>
			</div>
		</div>
		<form action="http://localhost:8080/Voids/">
			<input type="text" value="1" id="isLogin">
		</form>
		<script src="/static/z/jquery-1.js"></script>
		<script src="/static/z/gVerify.js"></script>
		<script src="/static/z/index.js"></script>

	</div>

	
	<script type="text/javascript">
		/* function getVideo(num) {
			location.href = "playVideo?video_id=" + num;
		} */
		window.onload = function() {
			var msg = "${msg1}";
			if (msg != null && msg != "") {
				alert(msg);
			}
		}
	</script>


</body>
</html>