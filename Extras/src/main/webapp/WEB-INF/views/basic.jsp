<%@page import="com.spring.ext.domain.Page"%>
<%@page import="com.spring.ext.domain.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="js/basic.js"></script>
</head>
<body>
<% List<Board> b = (List<Board>)request.getAttribute("list"); %>
<% Page p = (Page)request.getAttribute("pageMaker"); %>
	<div class="container">
		<h2>EXTRAS</h2>
		<div class="panel panel-default">
			<div class="panel-heading">게시판</div>
			<div class="panel-body" id="list">
				<table class='table table-bordered table-hover' style='table-layout: fixed'>
					<tr>
						<td style='width: 5%'>번호</td>
						<td style='width: 35%'>제목</td>
						<td>작성자</td>
						<td>작성일</td>
						<td>조회수</td>
						<td>추천수</td>
					</tr>
		
					<% for(Board list: b){%>
					<tr>
						<td id='t" + vo.idx + "'><%=list.getIdx() %></td>
						<td id='w" + vo.idx + "'><%=list.getContent() %></td>
						<td style='text-align: center'></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
					<%} %>
				</table>
				<div class='panel-footer' style='text-align: center;'>
					<ul class='pagination' style='margin: 0;'>
					<%if(p.isPrev()){ %>
						<li class="paginate_button previous">
							<a href='/ext/basic?pageNum=<%=p.getStartpage()-1%>'>이전</a>
							</li>
					<%}%>
						<%for(int i = p.getStartpage(); i <= p.getEndpage(); i++){ %>
						<li><a href='/ext/basic?pageNum=<%=i%>'><%=i %></a></li>
						<%} %>
					<%if(p.isNext()){ %>
						<li class="paginate_button previous">
						<a href='/ext/basic?pageNum=<%=p.getEndpage()+1%>'>다음</a>
						</li>
					<%}%> 
					</ul>
				</div>
			</div>
		
			<div class="panel-body" id="wform" style="display: none;">
				<form class="form-horizontal" action="#" id="frm">
					<div class="form-group">
						<label class="control-label col-sm-2" for="title">제목 : </label>
						<div class="col-sm-10">
							<input type="text" name="title" class="form-control"
								placeholder="Enter title">
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="content">내용 : </label>
						<div class="col-sm-10">
							<textarea rows="10" name="content" class="form-control"></textarea>
						</div>
					</div>
					<div class="form-group">
						<label class="control-label col-sm-2" for="writer">작성자 : </label>
						<div class="col-sm-10">
							<input type="text" name="writer" class="form-control"
								placeholder="Enter title">
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="button" onclick="goInsert()" 
								class="btn btn-success btn-sm">등록</button>
							<button type="reset" class="btn btn-warning btn-sm" id="init">취소</button>
						</div>
					</div>
				</form>
			</div>
			<div class="panel-footer">뿌터</div>
		</div>
	</div>
</body>
</html>