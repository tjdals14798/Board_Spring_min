function loadList() {
	$.ajax({
		url: "api/board",	//	요청경로
		type: "get",	//	요청방식
		dataType: "json",	//	서버 반환 데이터 타입
		success: htmlView,	//	result : 서버에서 반환해준 데이터
		error: function() {
			alert("통신실패");
		}
	})
}

function htmlView(data) {
	var result = "<table class='table table-bordered table-hover' style='table-layout:fixed'>";
	result += "<tr>";
	result += "<td style='width:5%'>번호</td>";
	result += "<td style='width:35%'>제목</td>";
	result += "<td>작성자</td>";
	result += "<td>작성일</td>";
	result += "<td>추천수</td>";
	result += "</tr>";

	$.each(data, (index, vo) => {
		result += "<tr>";
		result += "<td style='text-align:center'>" + (index + 1) + "</td>";
		result += "<td id='t" + vo.idx + "'><a href='javascript:contentView(" + vo.idx + ")'>" + vo.title + "</a></td>";
		result += "<td id='w" + vo.idx + "'>" + vo.writer + "</td>";
		result += "<td>" + vo.indate + "</td>";
		result += "<td id='u" + vo.idx + "'><button class='btn btn-success btn-sm' onclick='goUpdate(" + vo.idx + ")'>수정</button></td>";
		result += "<td><button class='btn btn-warning btn-sm' onclick='goDelete(" + vo.idx + ")'>삭제</button></td>";
		result += "</tr>";
		result += "<tr id='cv" + vo.idx + "' style='display:none'>";
		result += "<td>내용</td>";
		result += "<td colspan='4'>";
		result += "<textarea rows='6' class='form-control' id='c" + vo.idx + "'>" + vo.content + "</textarea>";
		result += "<br>";
		result += "<button class='btn btn-success btn-sm' onclick='updateFn(" + vo.idx + ")'>수정</button>";
		result += "</td>";
		result += "<td>";
		result += "<button id='ub"+vo.idx+"' style='display:none' class='btn btn-success btn-sm' onclick='formTCUpdate(" + vo.idx + ")'>완료</button>";
		result += "</td>";
		result += "</tr>";
	})
	result += "<tr>";
	result += "<td colspan='6'>";
	result += "<button class='btn btn-primary btn-sm' onclick='goView()'>글쓰기</button>"
	result += "</td>";
	result += "</tr>";
	result += "</table>";
	$("#list").html(result)
}

function contentView(idx) {
	if ($("#cv" + idx).css("display") == "none") {
		$("#cv" + idx).css("display", "table-row")
	} else {
		$("#cv" + idx).css("display", "none")
	}
}

function updateFn(idx) {
	$("#ub"+idx).css("display", "inline")
	
	let t = $("#t" + idx).text()
	let tInput = "<input style='width:100%' id='nt" + idx + "' type='text' class='form-control' value='" + t + "'>"
	$("#t" + idx).html(tInput)
}

function formTCUpdate(idx){
	let content = $("#c" + idx).val()
	let title = $("#nt" + idx).val()
	$.ajax({
		url: "api/boardtcupdate",
		type: "post",
		data: { "idx": idx, "content": content, "title": title },
		success: function(){
			$("#ub"+idx).css("display", "none")
			loadList()
		},
		error: function() {
			alert("실패")
		}
	})
}

function goDelete(idx) {
	$.ajax({
		url: "api/boarddelete",
		type: "get",
		data: { "idx": idx },
		success: loadList,
		error: function() {
			alert("실패")
		}
	})
}

function goView() {
	if ($("#wform").css("display") == "none") {
		$("#wform").slideDown();
	} else {
		$("#wform").slideUp();
	}
}

function goInsert() {
	let f = $("#frm").serialize();

	$.ajax({
		url: "api/boardinsert",
		data: f,
		type: "post",
		success: loadList,
		error: function() {
			alert("실패")
		}
	})

	$("#init").trigger("click")	//강제로 click이벤트 발생
	$("#wform").css("display", "none")
}
