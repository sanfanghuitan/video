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
				<li><a href="VideoShow.do">视频管理</a></li>
				<li><a href="SpeakerShow.do">主讲人管理</a></li>
				<li id="control"><a href="adminManage.do">管理员管理</a></li>
				<li class="active"><a>课程管理</a></li>
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
			<h2>课程管理</h2>
		</div>
	</div>

	<form>
		<div class="container">
			<button onclick="showAddPage()" type="button"
				class="btn btn-info dropdown-toggle" data-toggle="dropdown"
				aria-haspopup="true" aria-expanded="false">添加</button>

			<button  type="button" id="btn" onclick="deleteAll()"
				class="btn btn-info dropdown-toggle">批量删除</button>
		</div>

		<div class="container" style="margin-top: 20px;">

			<table class="table table-bordered table-hover"
				style="text-align: center; table-layout: fixed;">
				<thead>
					<tr class="active">
						<th><input type="checkbox" id="all"></th>
						<th>序号</th>
						<th style="width: 16%">标题</th>
						<th style="width: 60%">简介</th>
						<th>编辑</th>
						<th>删除</th>
					</tr>
				</thead>
				<tbody>
 
                   <c:forEach items="${pageInfo.list}" var="i">
					<tr class="checkall">
						<td><input type="checkbox" name="box" id="checkbox" class="checkall" value="${i.id}"></td>
						<td id="id">${i.id }</td>
						<td id="course_title">${i.course_title}</td>
						
						<td
							style="overflow: hidden; white-space: nowrap; text-overflow: ellipsis;">${i.course_desc}</td>
						<td><a href="updateCourse.do?id=${i.id}">✎</a></td>
						<td><a href="deleteCourse.do?id=${i.id}">X</a></td>
					</tr>
				</c:forEach>	

			<tr>
						<td colspan="6">
						
					<%-- 	
						<font>总共${count}条,当前第${page }页</font> 
						<c:if test="${count%5==0}">
		                <c:set var="page" value="${count/5}"></c:set>
	                    </c:if>
	                    <c:if test="${count%5!=0}">
		                <c:set var="page" value="${count/5+1}"></c:set>
	                    </c:if>
	                    <c:forEach var="i" begin="1" end="${page}">
		                <a href="CourseShow.do?page=${i}">第${i}页</a>
	                     </c:forEach> --%>
	                     
	                     
	                     <div class="col-md-6">当前第${pageInfo.pageNum }页 共${pageInfo.pages }页
			总共${pageInfo.total}条数据</div>
	                     
	                     <div class="col-md-6">
			<nav aria-label="Page navigation">
			<ul class="pagination">
				<li><a href="courseShow?pn=1">首页</a></li>
				<c:if test="${pageInfo.hasPreviousPage }">

					<li><a href="courseShow?pn=${pageInfo.pageNum-1}"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>

				</c:if>
				<c:forEach items="${pageInfo.navigatepageNums }" var="pageNum">
					<c:if test="${pageNum==pageInfo.pageNum }">
						<li class="active"><a href="courseShow?pn=${pageNum}">${pageNum}</a></li>
					</c:if>
					<c:if test="${pageNum!=pageInfo.pageNum }">
						<li><a href="courseShow?pn=${pageNum}">${pageNum}</a></li>
					</c:if>

				</c:forEach>

				<c:if test="${pageInfo.hasNextPage }">
					<li><a href="courseShow?pn=${pageInfo.pageNum+1}"
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
				<li><a href="courseShow?pn=${pageInfo.pages}">末页</a></li>
			</ul>
			</nav>

		</div>
	                     
	                     
	                     
	                     </td>
					</tr> 
				</tbody>
			</table>

		</div>
	</form>

<input type="hidden" id="au" value="${admin.authority}">
	<!-- 显示分页信息 -->
	<div class="row">
		<!-- 分页文字信息 -->
		
		<!-- 分页条信息 -->
		
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
	
<script type="text/javascript">

function showAddPage(){
	location.href="addCourseShow.do";
}
	function exit(){
		location.href="adminExit.do";
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
			location.href="deleteAll.do?str="+str;		
		}else{
			document.location.reload();
		}				
	}	
/* 	window.onload = function(){
    	if((${user.authority})==false){
    		var h = document.getElementById("control");
    		h.style.display="none";
    	}	
    } */	
</script>
</body>
</html>