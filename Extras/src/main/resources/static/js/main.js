function loadComment(idx, nick) {
	$.ajax({
		url: "api/comment",	//	요청경로
		type: "get",	//	요청방식
		data: {"idx":idx},
		dataType: "json",	//	서버 반환 데이터 타입
		success: function(res){
			commentView(res,nick)
			},	//	result : 서버에서 반환해준 데이터
		error: function() {
			alert("통신실패");
		}
	})
}

function commentView(data,nick) {
	var result = "<table class='table table-bordered'>";
	$.each(data, (index, vo) => {
		result += "<tr>";
		result += "<td style='width:10%'>"+vo.c_writer+"</td>";
		result += "<td align='center' style='width:70%'>"+vo.c_indate+"</td>";
		result += "<td style='width:12%'>";
		if(vo.c_writer!==nick){
			result += "<button class='btn btn-xs btn-default' onclick='cChu("+vo.c_idx+")'>";
			result += "<i class='bi bi-heart-fill' style='color:red;'></i> "+vo.c_chu+"</button>";
		}else{
			result += "<button disabled class='btn btn-xs btn-default' onclick='cChu("+vo.c_idx+")'>";
			result += "<i class='bi bi-heart-fill' style='color:red;'></i> "+vo.c_chu+"</button>";
			result += "&nbsp;<button class='btn btn-xs btn-warning' onclick='cDelete("+vo.c_idx+")'>삭제</button>";
		}
		result += "</td>"
		result += "</tr>";
		result += "<tr>";
		result += "<td colspan='3' align='center'>"+vo.c_content+"</td>";
		result += "</tr>";
	})
	result += "</table>";
	$("#comlist").html(result)
}

function loadChart() {
	$('#line_chart').remove();
	$('#chart_div').append('<canvas id="line_chart"></canvas>');
	let fcname = $("select[name=fcname]").val();
	
	$.ajax({
  		url : 'api/boardchart',
  		type : 'get',
  		data : {"fcname":fcname},
  		dataType : 'json',
  		success : function(res){
	 		let labels = res.reverse().map(item => item.indate);
			let values = res.map(item => item.bcnt);
  			const data = {
		    	labels: labels,
		    	datasets: [{ 
		    		data: values,
		        	label:"일당 게시글 수",
		        	fill: false,
		       		borderWidth: 2
		       	}]
  			};

  const config = {
       type: 'bar',
       data: data
  };
  const myChart = new Chart(
      document.getElementById('line_chart'),
      config
    );
  },
  error : function(){
     alert('차트 로딩 실패');
  }       
})
}

function addressMap(address){
	if(address !== ''){
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		    mapOption = {
		        center: new kakao.maps.LatLng(35.1598137810809, 126.8518390204494 ), // 지도의 중심좌표
		        level: 2 // 지도의 확대 레벨
		    };  
		
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption); 
		
		// 주소-좌표 변환 객체를 생성합니다
		var geocoder = new kakao.maps.services.Geocoder();
		
		var zoomControl = new kakao.maps.ZoomControl();
		map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);
		
		// 주소로 좌표를 검색합니다
		geocoder.addressSearch(address, function(result, status) {
		
		    // 정상적으로 검색이 완료됐으면 
		     if (status === kakao.maps.services.Status.OK) {
		
		        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
		
		        // 결과값으로 받은 위치를 마커로 표시합니다
		        var marker = new kakao.maps.Marker({
		            map: map,
		            position: coords
		        });
		
		        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
		        map.setCenter(coords);
		    } 
		});
	}
}

function cChu(c_idx){
	$.ajax({
		url: "api/commentchu",
		data: {"idx":c_idx},
		type: "get",
		success: function(){
			window.location.reload()
			alert("추천성공")
		},error: function(){
			alert("추천실패")
		}
	})
}

function cDelete(c_idx){
	$.ajax({
		url: "api/commentdel",
		data: {"idx":c_idx},
		type: "get",
		success: function(){
			window.location.reload()
			alert("삭제성공")
		},error: function(){
			alert("삭제실패")
		}
	})
}

function goInsert() {
	console
	let f = $("#frm").serialize();
	$.ajax({
		url: "api/boardinsert",
		data: f,
		type: "post",
		success: function(){
			window.location.reload()
			alert("성공")
		},
		error: function() {
			alert("실패")
		}
	})

	$("#init").trigger("click")	//강제로 click이벤트 발생
	$("#wform").css("display", "none")
}

function goView() {
	if ($("#wform").css("display") == "none") {
		$("#wform").slideDown();
	} else {
		$("#init").trigger("click")	//강제로 click이벤트 발생
		$("#wform").slideUp();
	}
}

function upView() {
	if ($("#upform").css("display") == "none") {
		$("#upform").slideDown();
	} else {
		$("#upinit").trigger("click")	//강제로 click이벤트 발생
		$("#upform").slideUp();
	}
}

function unView() {
	if ($("#unform").css("display") == "none") {
		$("#unform").slideDown();
	} else {
		$("#init").trigger("click")	//강제로 click이벤트 발생
		$("#unform").slideUp();
	}
}

function withdrawal() {
	if ($("#wiform").css("display") == "none") {
		$("#wiform").slideDown();
	} else {
		$("#wiinit").trigger("click")	//강제로 click이벤트 발생
		$("#wiform").slideUp();
	}
}