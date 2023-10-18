<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" 	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
	<%@include file="/WEB-INF/layouts/header.jsp"%>
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<strong>내정보</strong>
			</div>
			<div class="panel-body">관리자 페이지입니다</div>
		</div>

		<div class="panel panel-default">
			<div class="panel-heading">
				<strong>게시글 수 그래프</strong>
			</div>
			<div class="form-group" style="float: right; margin: 5px;">
				<select class="form-control" name="fcname" onchange="loadChart()">
					<option value="weekly">주</option>
					<option value="monthly">월</option>
				</select>
			</div>
			<div id="chart_div">
				<canvas id="line_chart"></canvas>
			</div>
		</div>
	</div>
	<script>
		$(document).ready(()=>{		//페이지가 로드 되자마자 리스트 가져오기
			loadChart()
		})
	</script>
</body>
</html>