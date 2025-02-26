<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="zh-CN">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="renderer" content="webkit">
<title>JDeploy自动化部署平台</title>
<link rel="stylesheet" href="http://cdn.bootcss.com/materialize/0.97.0/css/materialize.min.css">
<link href="${pageContext.request.contextPath}/resources/css/icon.css" rel="stylesheet">
<script src="http://cdn.bootcss.com/jquery/2.1.4/jquery.min.js"></script>
<script src="http://cdn.bootcss.com/materialize/0.97.0/js/materialize.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/index.js"></script>
</head>
<body style="font-family: 'Roboto', 'Droid Sans Fallback', '微软雅黑';">

	<nav>
		<div class="nav-wrapper">
			<a href="${pageContext.request.contextPath}/" class="brand-logo center">JDeploy自动化部署平台</a>
		</div>
	</nav>

	<div class="container" style="padding-top: 20px; width: 90%;">
		<div class="row">
			<div class="col s12">
				<ul class="tabs">
					<li class="tab col s6"><a href="#java-deploy">Java项目部署</a></li>
					<li class="tab col s6"><a href="#java-web-deploy">Java Web项目部署</a></li>
				</ul>
			</div>
		</div>
		
		<div id="java-deploy">
			<div class="row">
				<div class="input-field col s12 m6 offset-m2">
					<nav>
						<div class="nav-wrapper">
							<form>
								<div class="input-field">
									<input id="java-deploy-search" type="search">
									<label for="java-deploy-search">
										<i class="material-icons" style="line-height: inherit;">search</i>
									</label>
									<i class="material-icons">close</i>
								</div>
							</form>
						</div>
					</nav>
				</div>
				<div class="input-field col s12 m4">
					<a class="waves-effect waves-light btn red lighten-2" href="${pageContext.request.contextPath}/javadeploy/new" style="line-height: 64px; height: 64px;">创建</a>
				</div>
			</div>
			<table class="hoverable">
				<thead>
					<tr>
						<td>项目名称</td>
						<td>UUID</td>
						<td>finalName</td>
						<td>详情</td>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${javaDeployList}">
						<tr>
							<td>${item.name}</td>
							<td>${item.uuid}</td>
							<td>${item.finalName}</td>
							<td><a href="${pageContext.request.contextPath}/javadeploy/detail/${item.uuid}" class="btn waves-effect waves-light red lighten-2">详情</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		
		<div id="java-web-deploy" class="row">
			<div class="row">
				<div class="input-field col s12 m6 offset-m2">
					<nav>
						<div class="nav-wrapper">
							<form>
								<div class="input-field">
									<input id="java-web-deploy-search" type="search">
									<label for="java-web-deploy-search">
										<i class="material-icons" style="line-height: inherit;">search</i>
									</label>
									<i class="material-icons">close</i>
								</div>
							</form>
						</div>
					</nav>
				</div>
				<div class="input-field col s12 m4">
					<a class="waves-effect waves-light btn red lighten-2" href="${pageContext.request.contextPath}/javawebdeploy/new" style="line-height: 64px; height: 64px;">创建</a>
				</div>
			</div>
			<table class="hoverable">
				<thead>
				<tr>
					<td>项目名称</td>
					<td>UUID</td>
					<td>finalName</td>
					<td>contextPath</td>
					<td>端口号</td>
					<td>详情</td>
				</tr>
				</thead>
				<tbody>
				<c:forEach var="item" items="${javaWebDeployList}">
					<tr>
						<td>${item.name}</td>
						<td>${item.uuid}</td>
						<td>${item.finalName}</td>
						<td>${item.contextPath}</td>
						<td>${item.port}</td>
						<td><a href="${pageContext.request.contextPath}/javawebdeploy/detail/${item.uuid}" class="btn waves-effect waves-light red lighten-2">详情</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
		
	</div>

</body>
</html>