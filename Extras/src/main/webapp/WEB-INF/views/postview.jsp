<%@page import="com.spring.ext.domain.Board"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e05295623a57b91293ad3a297beafd88&libraries=services"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<script src="js/main.js"></script>
</head>
<body>
	<% Board b = (Board) request.getAttribute("content"); %>
	<%@include file="/WEB-INF/layouts/header.jsp" %>
	
	<div class="container">
		<div class="panel panel-default">
			<div class="panel-heading">
				<p style="float: left;"><strong><%=b.getTitle()%></strong></p> &nbsp;
				<p style="float: right;"><%=b.getIndate()%></p>
			</div>
			<div class="panel-body">
				<table class="table table-bordered-none" style="margin-bottom: 0px;">
					<tr>
						<td style="width: 20%;">작성자 : <%=b.getWriter()%></td>
						<td align="center">조회수 : <%=b.getHits()%></td>
						<td style="width: 20%;" align="right">추천 : <%=b.getChu()%></td>
					</tr>
					<tr>
						<td colspan="3"><%=b.getContent()%></td>
					</tr>
					<%if(!b.getAddress().equals("")){ %>
						<tr>
							<td ></td>
							<td id='map' style="height:300px;"></td>
							<td ></td>
						</tr>
					<%} %>
					
					<tr style="padding: 0px;">
						<td colspan="3" align="center">
						<%if(nick!=null && nick.equals(b.getWriter())){ %>
						<button type="button" class="btn btn-info btn-sm"
							data-toggle="modal" data-target="#contentUD">수정</button>
							<button class="btn btn-sm btn-warning" onclick="location.href='boarddelete?idx=<%=b.getIdx()%>'">삭제</button>
						<%}%>
							<button class="btn btn-sm btn-success" onclick="location.href='boardchu?idx=<%=b.getIdx()%>'">추천</button>						
							<button class="btn btn-sm btn-success" onclick="location.href='/ext'">목록</button>
						</td>
					</tr>
				</table>
			</div>
		</div>
<!-- ----------------------------------------------- 댓글 등록 창 ----------------------------------------------- -->
		<div class="panel panel-default">
		<div class="panel-heading">댓글</div>
			<div class="panel-body" id="comlist">
				<table class="table table-bordered"></table>
			</div>
			<%if(nick!=null){ %>
			<div class="panel-footer">
				<form method="post" action="commentinsert">
					<div class="form-group">
						<input name="board_num" value="<%=b.getIdx()%>" hidden>
						<input name="c_writer" value="<%=nick%>" hidden>
						<textarea class="form-control" rows="3" name="c_content" style="resize:none;"></textarea>
					</div>
					<input type="submit" class="btn btn-primary form-control" value="등록">
				</form>
			</div>
			<%}else{%>
			<div class="panel-footer" align="center">
				댓글 작성은 로그인 후 이용해 주세요.
			</div>
			<%} %>
		</div>
<!-- ---------------------------------------------------------게시글 수정 모달--------------------------------------------------------- -->
	<div class="modal fade" id="contentUD" role="dialog">
			<div class="modal-dialog">
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">게시글 수정</h4>
					</div>
					<div class="modal-body">
						<form method="post" action="boardtcupdate">
							<div class="form-group">
								<input name="idx" value="<%=b.getIdx()%>" hidden>
								<input type="text" class="form-control" value="<%=b.getTitle() %>" name="title">
							</div>
							<div class="form-group">
								<textarea class="form-control" rows="30" name="content" style="resize:none;"><%=b.getContent() %></textarea>
							</div>
							<input type="submit" class="btn btn-primary form-control" value="수정">
						</form>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					</div>
				</div>
			</div>
		</div>
	</div>	
	
	<script>
		// 페이지가 로드 되자마자 리스트 가져오기
		$(document).ready(()=>{
			addressMap('<%=b.getAddress()%>');
			loadComment(<%=b.getIdx()%>, '<%=nick%>');
		})
	</script>
</body>
</html>