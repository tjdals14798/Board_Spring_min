<%@page import="javax.security.auth.message.callback.PrivateKeyCallback.Request"%>
<%@page import="com.spring.ext.domain.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="js/main.js"></script>
</head>
<body>
	<%Member profil = (Member)request.getAttribute("profil"); %>
	<%@include file="/WEB-INF/layouts/header.jsp" %>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading"><strong>내정보</strong></div>
			<div class="panel-body">
				<table class="table table-bordered-none" style="margin-bottom: 0px;">
					<tr>
						<td style="width: 20%">아이디</td>
						<td><%=profil.getId() %></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><%=profil.getPw() %></td>
					</tr>
					<tr>
						<td>닉네임</td>
						<td><%=profil.getNick() %></td>
					</tr>
				</table>
			</div>
		</div>
		
		<div style="text-align:right; margin-bottom: 20px;">
			<button class='btn btn-primary btn-sm' onclick='unView()'>닉네임 변경</button>
			<button class='btn btn-primary btn-sm' onclick='upView()'>비밀번호 변경</button>
			<button class='btn btn-primary btn-sm' onclick='withdrawal()'>회원탈퇴</button>
		</div>
		
		<div class="panel-body" id="upform">
			<form class="form-horizontal" action="updatepw" method="post">
				<div class="form-group">
					<label class="control-label col-sm-2" for="title">비밀번호 : </label>
					<div class="col-sm-8">
						<input type="hidden" name="id" value="<%=profil.getId()%>" >
						<input type="text" name="pw" class="form-control" placeholder="변경할 비밀번호">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8">
						<button type="submit" class="btn btn-success btn-sm">변경</button>
						<button type="reset" class="btn btn-warning btn-sm" id="upinit">초기화</button>
					</div>
				</div>
			</form>
		</div>
		
		<div class="panel-body" id="unform">
			<form class="form-horizontal" action="updatenick" method="post">
				<div class="form-group">
					<label class="control-label col-sm-2" for="title">닉네임 : </label>
					<div class="col-sm-8">
						<input type="hidden" name="id" value="<%=profil.getId()%>" >
						<input type="text" name="nick" class="form-control" placeholder="변경할 닉네임">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8">
						<button type="submit" class="btn btn-success btn-sm">변경</button>
						<button type="reset" class="btn btn-warning btn-sm" id="uninit">초기화</button>
					</div>
				</div>
			</form>
		</div>
		
		<div class="panel-body" id="wiform">
			<form class="form-horizontal" action="withdrawal" method="post">
				<div class="form-group">
					<label class="control-label col-sm-2" for="title">아이디 : </label>
					<div class="col-sm-8">
						<input type="text" name="id" class="form-control" placeholder="아이디 확인">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="title">비밀번호 : </label>
					<div class="col-sm-8">
						<input type="text" name="pw" class="form-control" placeholder="비밀번호 확인">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8">
						<button type="submit" class="btn btn-success btn-sm">삭제</button>
						<button type="reset" class="btn btn-warning btn-sm" id="wiinit">초기화</button>
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<script>
		//basic.jsp 페이지가 로드 되자마자 리스트 가져오기
		$(document).ready(()=>{
			$("#upform").css("display", "none")
			$("#unform").css("display", "none")
			$("#wiform").css("display", "none")
		})
	</script>
	
</body>
</html>