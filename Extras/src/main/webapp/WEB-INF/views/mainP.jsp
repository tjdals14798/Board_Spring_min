<%@page import="com.spring.ext.domain.Page"%>
<%@page import="com.spring.ext.domain.Board"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="js/main.js"></script>
</head>
<body style="height: 100%; width: 100%">
<% List<Board> b = (List<Board>)request.getAttribute("list"); %>
<% Page p = (Page)request.getAttribute("pageMaker"); %>
	<%@include file="/WEB-INF/layouts/header.jsp" %>
	<div class="container" style="margin:6% 20%">
		<div class="panel panel-default">
			<div class="panel-heading">게시판</div>
			<form class="form-inline" style="float: right;margin: 5px;">
				<div class="form-group d-inline">
					<select class="form-control" name="fname">
						<option value="">검색 내용 선택</option>
						<option value="title">제목</option>
						<option value="address">지역</option>
						<option value="writer">작성자</option>
					</select>
					<input type="text" class="form-control" placeholder="검색" name="filter">
					<button class="btn btn-default btn-sm form-control" type="submit"><i class="bi bi-search"></i></button>
				</div>
				</form>
			<div class="panel-body" id="list">
				<table class='table table-bordered-none table-hover' style='table-layout: fixed'>
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
						<td style="text-align:center;"><%=list.getIdx() %></td>
						<td><a href="content?idx=<%=list.getIdx()%>"><%=list.getTitle() %></a></td>
						<td><%=list.getWriter() %></td>
						<td><%=list.getIndate() %></td>
						<td><%=list.getHits()%></td>
						<td><%=list.getChu() %></td>
					</tr>
					<%} %>
				</table>
				<div class='panel-footer' style='text-align: center;'>
					<ul class='pagination' style='margin: 0;'>
					<%if(p.isPrev()){ %>
						<li class="paginate_button">
							<a href='/ext/?pageNum=<%=p.getStartpage()-1%>'>이전</a>
						</li>
					<%}%>
					
					<%for(int i = p.getStartpage(); i <= p.getEndpage(); i++){ %>
						<li><a href='/ext/?pageNum=<%=i%>'><%=i %></a></li>
					<%} %>
					
					<%if(p.isNext()){ %>
						<li class="paginate_button">
							<a href='/ext/?pageNum=<%=p.getEndpage()+1%>'>다음</a>
						</li>
					<%}%> 
					</ul>
				</div>
			</div>
		</div>
		
		<div style="text-align:right; margin-bottom: 20px;">
			<%if(id!=null) %><button class='btn btn-primary btn-sm' onclick='goView()'>글쓰기!</button>
		</div>
	
		<div class="panel-body" id="wform" >
			<form class="form-horizontal" action="#" id="frm">
				<div class="form-group">
					<label class="control-label col-sm-2" for="title">제목 : </label>
					<div class="col-sm-8">
						<input type="text" name="title" class="form-control" placeholder="Enter title">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="content">내용 : </label>
					<div class="col-sm-8">
						<textarea rows="8" style="resize:none;" name="content" class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="writer">지도 : </label>
					<div class="col-sm-8">
						<input type="text" name="address" class="form-control" placeholder="주소를 입력해주세요.">
					</div>
				</div>
				<div class="form-group">
					<label class="control-label col-sm-2" for="writer">작성자 : </label>
					<div class="col-sm-8">
						<input type="text" name="writer" class="form-control" value="<%=nick%>" readonly>
					</div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-8">
						<button type="button" onclick="goInsert()" class="btn btn-success btn-sm">등록</button>
						<button type="reset" class="btn btn-warning btn-sm" id="init">초기화</button>
					</div>
				</div>
			</form>
		</div> 
	</div>
	<script>
		//basic.jsp 페이지가 로드 되자마자 리스트 가져오기
		$(document).ready(()=>{
			$("#wform").css("display", "none")
		})
	</script>

</body>
</html>