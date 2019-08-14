<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<!--<base href="http://localhost:8080/Voids/">-->
<base href=".">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>智游教育</title>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="./static/js/bootstrap.css" rel="stylesheet">

<script src="./static/js/jquery-1.js"></script>
<script src="./static/js/bootstrap.js"></script>
<script src="./static/js/confirm.js"></script>
<script src="./static/js/jquery.js"></script>
<script src="./static/js/message_cn.js"></script>
<script src="jQuery/jquery-3.4.1.min.js"></script>
<style type="text/css">
th {
	text-align: center;
}
</style>
</head>

<body>
	<nav class="navbar-inverse">
	<div class="container">

		<div class="navbar-header">
			<a class="navbar-brand">视频管理系统</a>
		</div>

		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-9">
			<ul class="nav navbar-nav">
				<li class="active"><a>视频管理</a></li>
				<li><a onclick="SpeakerShow()">主讲人管理</a></li>
				<li><a onclick="courseShow()">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${admin.accounts}</span> <i class="glyphicon glyphicon-log-in"
					aria-hidden="true"></i>&nbsp;&nbsp;<a class="navbar-link" onclick="exit()">退出</a>
			</p>
		</div>
		<!-- /.navbar-collapse -->


	</div>
	<!-- /.container-fluid --> </nav>



	<div class="jumbotron" style="padding-top: 15px; padding-bottom: 15px;">
		<div class="container">
			<h2>视频管理</h2>
		</div>
	</div>
		<div class="container">
			<button onclick="showAddPage()" type="button"
				class="btn btn-info dropdown-toggle" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">添加</button>

			<button  type="button" id="btn" onclick="deleteAll()"
				class="btn btn-info dropdown-toggle">批量删除</button>
				
		<form id="selectForm" class="navbar-text navbar-right" action="selectLikeVideo.do">
				
			<input  type="text" id="btn" name="title"
			class="btn btn-info" placeholder="标题" style="background-color:white;color: black" value="${oldVideo.title}">
				<select name="speaker_id" id="speaker_id"  class="btn btn-info dropdown-toggle"">					
						<option value="0" <c:if test="${oldVideo eq null }">selected="selected"</c:if>>请选择讲师</option>						
						<c:forEach items="${speaker}" var="i">
					   <option value="${i.id}" <c:if test="${oldVideo.speaker_id eq i.id}">selected</c:if>>${i.speaker_name }</option>
					  </c:forEach>						
					</select>
				
				<select name="course_id" id="course_id" class="btn btn-info dropdown-toggle">					
						<option value="0" <c:if test="${oldVideo eq null }">selected="selected" </c:if>>请选择所属课程</option>						
						<c:forEach items="${course}" var="i">
					   <option value="${i.id}" <c:if test="${oldVideo.course_id eq i.id}">selected</c:if>>${i.course_title }</option>
					  </c:forEach>						
					</select>
				
				
				<button type="submit" class="btn btn-info">查询</button>
				
				</form>
				
		</div>

		<div class="container" style="margin-top: 20px;">

			<table class="table table-bordered table-hover"
				style="text-align: center; table-layout: fixed;">
				<thead>
					<tr class="active">
						<th style="width: 12%"><input type="checkbox" id="all"></th>
						<th style="width: 12%">序号</th>
						<th style="width: 12%">名称</th>
						<th style="width: 50%">简介</th>
					    <th style="width: 12%">讲师</th>
					    <th style="width: 12%">时长</th>
					    <th style="width: 12%">播放次数</th>
						<th style="width: 10%">编辑</th>
						<th style="width: 10%">删除</th>
					</tr>
				</thead>
				<tbody>
 
                   <c:forEach items="${video}" var="i">
					<tr class="checkall">
						<td onclick="count()"><input type="checkbox" name="box" id="checkbox" class="checkall" value="${i.video_id}"></td>
						<td id="id">${i.video_id}</td>
						<td id="course_title">${i.title}</td>
						<td
							style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${i.detail}</td>
							<td>${i.speaker.speaker_name}</td>
							<td>${i.time}</td>
							<td>${i.play_num}</td>
						<td><a href="updateVideo.do?id=${i.video_id}">✎</a></td>
						<td><a href="deleteVideo.do?id=${i.video_id}" id="delete">X</a></td>
					</tr>
				</c:forEach>	

				<tr>
						<td colspan="9"><font>总共${count}条,当前第${page }页</font> 
						<c:if test="${count%5==0}">
		                <c:set var="page" value="${count/5}"></c:set>
	                    </c:if>
	                    <c:if test="${count%5!=0}">
		                <c:set var="page" value="${count/5+1}"></c:set>
	                    </c:if>
	                    <c:forEach var="i" begin="1" end="${page}">
	                    <c:if test="${oldVideo eq null}"><a href="VideoShow.do?page=${i}">${i}</a></c:if>
		                <c:if test="${oldVideo != null}">
		                <a href="selectLikeVideo.do?page=${i}&title=${oldVideo.title}&speaker_id=${oldVideo.speaker_id}&course_id=${oldVideo.course_id}">${i}</a></c:if>

	                 	                
	                     </c:forEach>
	                     
	                     
	                 
	                     </td>
					</tr>
				</tbody>
			</table>

		</div>


	<div id="modal-background" class=""></div>
	<div id="confirm-modal" class="modal fade role" dialog=""
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
	
	<script>
		function showAddPage(){
			location.href="addVideoShow.do";
		}
	
		$("#all").click(function(){
			if(this.checked){
			$(".checkall :checkbox").prop("checked", true);
			}else{
			$(".checkall :checkbox").prop("checked", false);
			}
			});
		
		
		
		function deleteAll(){		
			var a=confirm("温馨提示~~确认要删除吗?");
			var str=new Array;
			var i=0;	
			if(a==true){
				$.each($("input[name='box']"),function(){
					if(this.checked){
						str[i]=$(this).val();
						i++;
					}			
				})
				location.href="deleteAllVideo.do?str="+str;
			}else{
				document.location.reload();
			}				
		}
	
		function count(){
			var i=0;
			$.each($("#checkbox"),function(){
				if(this.checked){
					i++;
					$("#i").text(i);
				}
			})
		}
		
		$(document).on("click", ".box", count());
		
		
		function courseShow(){
			location.href="CourseShow.do";
		}
		function SpeakerShow(){
			location.href="SpeakerShow.do";
		}
	
		function exit(){
			location.href="adminExit.do";
		}
		
	</script>
</body>


</html>