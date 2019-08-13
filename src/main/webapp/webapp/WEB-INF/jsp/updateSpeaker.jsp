<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--<base href="http://localhost:8080/Voids/">-->

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<base href=".">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>智游教育</title>

<link href="./static/js/bootstrap.css" rel="stylesheet">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style type="text/css">
.col-md-1 {
	padding-top: 20px;
}

.a1 {
	color: gray;
}

b {
	float: right;
}
</style>



</head>

<body>
	<nav class="navbar-inverse">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand">视频管理系统</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-9">
			<ul class="nav navbar-nav">
				<li href="VideoShow.do"><a>视频管理</a></li>
				<li class="active"><a>主讲人管理</a></li>
				<li><a onclick="courseShow()">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${admin.accounts}</span> <i class="glyphicon glyphicon-log-in"
					aria-hidden="true"></i>&nbsp;&nbsp;<a class="navbar-link" onclick="exit()">退出</a>
			</p>
		</div>

	</div>

	</nav>
	<div class="jumbotron" style="padding-top: 15px; padding-bottom: 15px;">
		<div class="container">
			<h2>修改主讲人</h2>
		</div>
	</div>
	<div class="container" style="margin-top: 20px;">

		<form id="infoForm" class="form-horizontal" method="post" action="alterSpeaker.do">

               <input type="hidden" value="${speaker.id }" name="id">

			<div class="form-group">
				<label for="subjectTitle" class="col-sm-2 control-label">姓名</label>
				<div class="col-sm-10">
					<input class="form-control" name="speaker_name" id="speaker_name"
						value="${speaker.speaker_name }" type="text">
				</div>
			</div>
			
			<div class="form-group">
				<label for="speaker_job" class="col-sm-2 control-label">职位</label>
				<div class="col-sm-10">
					<input class="form-control" name="speaker_job" id="speaker_job"
						value="${speaker.speaker_job }" type="text">
				</div>
			</div>
			
			
			<div class="form-group">
				<label for="pic_url" class="col-sm-2 control-label">头像地址</label>
				<div class="col-sm-10">
					<input class="form-control" name="pic_url" id="pic_url"
						value="${speaker.pic_url }" type="text">
				</div>
			</div>
			
			
			
			<div class="form-group">
				<label for="speaker_desc" class="col-sm-2 control-label">简介</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="speaker_desc" name="speaker_desc"
						rows="3">${speaker.speaker_desc}</textarea>
				</div>
			</div>
			
			
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">保存</button>
				</div>
			</div>
		</form>
	</div>

	<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
	<script src="./static/js/jquery-1.js"></script>
	<script src="./static/js/bootstrap.js"></script>
	<script src="./static/js/confirm.js"></script>
	<script src="./static/js/jquery.js"></script>
	<script src="./static/js/message_cn.js"></script>


	<div id="modal-background" class=""></div>
	<div id="confirm-modal" class="modal fade role=" dialog="" 
		tabindex="-1">
		<div class="modal-dialog modal-undefined">
			<div class="modal-content">
				<div class="modal-header">
					<button id="modal-upper-close" class="close modal-close"
						aria-label="Close" type="button">
						<span aria-hidden="true">×</span>
					</button>
					<h4 id="modal-title" class="modal-title">Modal Title</h4>
				</div>
				<div id="modal-body" class="modal-body">Modal Message</div>
				<div id="modal-footer" class="modal-footer"></div>
			</div>
		</div>
	</div>
	<div id="modal-background" class=""></div>
	
	<script type="text/javascript">
	
	function courseShow(){
		location.href="CourseShow.do";
	}

	function exit(){
		location.href="adminExit.do";
	}

	</script>
</body>
</html>