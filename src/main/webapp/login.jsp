<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/css/model/login/login.css">
</head>
<body>
	<!-- 定义容器 -->
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-3"></div>
			<!-- 这一列为登陆表单 -->
			<div  class="col-md-4 col-sm-6">
				<div  id="Login_bg" class="panel panel-default">
					<!-- 登陆面板的标题 -->
					<div class="panel-title" style="text-align: center">
						<h2>登录</h2>
					</div>

					<!-- 登陆面板的主体 -->
					<div class="panel-body">

						<!-- 表单 -->
						<%--<form id="login_form" action="login" class="form-horizontal" method="post" >--%>
						<form id="login_form" action="login" class="form-horizontal" method="post" >
							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4">用户ID：</label>
								<div class="col-md-7 col-sm-7">
									<input type="text" id="userID" class="form-control"
										placeholder="用户ID" name="name" />
								</div>
							</div>

							<div class="form-group">
								<label class="control-label col-md-4 col-sm-4"> <!-- <span class="glyphicon glyphicon-lock"></span> -->
									密码：
								</label>
								<div class="col-md-7 col-sm-7">
									<input type="password" id="password" class="form-control"
										placeholder="密码" name="password">
								</div>
							</div>

							<div>
								<div class="col-md-4 col-sm-4"></div>
								<div class="col-md-4 col-sm-4">
									<button id="submit" type="submit" class="btn btn-primary">
										&nbsp;&nbsp;&nbsp;&nbsp;登陆&nbsp;&nbsp;&nbsp;&nbsp;</button>
								</div>
								<div class="col-md-4 col-sm-4"></div>
							</div>
						</form>
					</div>
				</div>
			</div>

			<div class="col-md-4 col-sm-3"></div>
		</div>
	</div>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery-2.2.3.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
	<script type="text/javascript"
		src="${pageContext.request.contextPath}/js/jquery.md5.js"></script>
	<style type="text/css">
		body{
			background-image: url(images/login_bg.jpg);
			background-attachment: fixed;
			background-repeat: no-repeat;
			background-size: cover;
		}

		#Login_bg{
			background: rgba(216,216,216,0.3);      /*设置form表单透明度*/
		}
	</style>

</body>
</html>