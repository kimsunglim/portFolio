<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"
	type="text/javascript" charset="utf-8"></script>
<!-- Custom fonts for this template-->
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">



<title>어디로 갈까?</title>

</head>

<body id="page-top">

	<!-- Header -->
	<header class="masthead">
		<div class="container mt-3">
			<h2>어디로 갈까?</h2>
			<p></p>
			<form action="showChart" method="GET" name='form'
				onsubmit="return check()">
				<p>1. 직업</p>
				<select name="jobgroup" class="custom-select mb-3">
					<option value="1" ${jobgroup_1}>대학생</option>
					<option value="2" ${jobgroup_2}>직장인</option>
					<option value="3" ${jobgroup_3}>무직</option>
					<option value="4" ${jobgroup_4}>군인</option>
					<option value="999" ${jobgroup_999}>기타</option>
				</select>

				<p>2. 당일/숙박여행 여부</p>
				<select name="q010000" class="custom-select mb-3">
					<option value="1" ${q010000_1}>당일여행</option>
					<option value="2" ${q010000_2}>숙박여행</option>
				</select>

				<p>3. 하루 지출 등급</p>
				<select name="q07grade" class="custom-select mb-3">
					<option value="1" ${q07grade_1}>3만원 이하</option>
					<option value="2" ${q07grade_2}>6만원 이하</option>
					<option value="3" ${q07grade_3}>10만원 이하</option>
					<option value="4" ${q07grade_4}>20만원 이하</option>
					<option value="5" ${q07grade_5}>20만원 초과</option>
				</select>


				<button type="submit" class="btn btn-primary">입력완료</button>
				<a href="/thecute/" class="btn btn-primary">목록으로</a>
			</form>
		</div>
	</header>


	<!-- Body -->
	<div class="container mt-3">

		<!-- Donut Chart -->
		<div id="donutchart"></div>
		<p></p>


		<!-- Line Chart -->
		<div id="linechart"></div>
		<p></p>
		<!-- Donut Chart2 -->
		<div id="donutchart2"></div>
		<p></p>

		<!-- Line Chart2 -->
		<div id="linechart2"></div>
		<p></p>
	</div>

	<!-- /.Body -->


	<!-- Bootstrap core JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script
		src="${pageContext.request.contextPath}/resources/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="${pageContext.request.contextPath}/resources/vendor/chart.js/Chart.min.js"></script>


</body>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
  google.charts.load("current", {packages:["corechart"]});
  google.charts.setOnLoadCallback(drawChart);
  function drawChart() {
 	var data = google.visualization.arrayToDataTable([
 	  ['Task', 'Hours per Day'],
      ['자연 및 풍경 감상', ${q060601}],
      ['음식관광', ${q060602}],
      ['야외 위락/스포츠 활동', ${q060603}],
      ['역사유적지 방문', ${q060604}],
      ['테마파크/놀이시설', ${q060605}],
      ['휴식/휴양', ${q060606}],
      ['온천/휴양', ${q060607}],
      ['쇼핑', ${q060608}],
      ['문화예술/공연/전시시설', ${q060609}],
      ['스포츠 경기 관람', ${q060610}],
      ['축제/이벤트', ${q060611}],
      ['교육/체험 프로그램', ${q060612}],
      ['종교/성지순례', ${q060613}],
      ['갬블링', ${q060614}],
      ['시티투어', ${q060615}],
      ['드라마 촬영지', ${q060616}],
      ['가족/친지/친구', ${q060617}],
      ['회의참가/시찰', ${q060618}],
      ['교육/훈련/연수', ${q060619}],
      ['유흥/오락', ${q060620}],
      ['기타', ${q060621}]
    ]);

    var options = {
      title: '여행지에서의 활동',
      is3D: true,
      slices: {  0: {offset: 0.1},
    	  		 1: {offset: 0.1},
    	  		 2: {offset: 0.1},
		         3: {offset: 0.1},
		         4: {offset: 0.1},
		         5: {offset: 0.1},
		         6: {offset: 0.1},
		         7: {offset: 0.1},
		         8: {offset: 0.1},
		         9: {offset: 0.1},
		         10: {offset: 0.1},
		         11: {offset: 0.1},
		         12: {offset: 0.1},
		         13: {offset: 0.1},
		         14: {offset: 0.1},
		         15: {offset: 0.1},
		         16: {offset: 0.1},
		         17: {offset: 0.1},
		         18: {offset: 0.1},
		         19: {offset: 0.1},
		         20: {offset: 0.1},
		         21: {offset: 0.1}
			  }
    };

    var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
    chart.draw(data, options); 
  }
  
  	google.charts.load("current", {packages:['corechart']});
  	google.charts.setOnLoadCallback(drawChart2);
  
	function drawChart2() {
	    var data = google.visualization.arrayToDataTable([
	      ['활동', '선호도', { role: 'style' } ],
	      ['자연 및 풍경 감상', ${q060601}, 'color: gray'],
	      ['음식관광', ${q060602}, 'color: #76A7FA'],
	      ['야외 위락/스포츠활동', ${q060603}, 'opacity: 0.2'],
	      ['역사유적지 방문', ${q060604}, 'fill-color: #C5A5CF'],
	      ['테마파크/놀이시설', ${q060605}, 'fill-color: #BC5679; fill-opacity: 0.2'],
	      ['휴식/휴양', ${q060606}, 'color: #F1F0D1'],
	      ['온천/휴양', ${q060607}, 'color: #E4CEA8'],
	      ['쇼핑', ${q060608}, 'color: #EEB884'],
	      ['문화예술/공연/전시시설', ${q060609}, 'color: #E29B7A'],
	      ['스포츠 경기 관람', ${q060610}, 'color: #CB816F'],
	      ['축제/이벤트', ${q060611}, 'color: #EBEBEB'],
	      ['교육/체험 프로그램', ${q060612}, 'color: gray'],
	      ['성지순례', ${q060613}, 'color: #EBEBEB'],
	      ['갬블링', ${q060614}, 'color: #76A7FA'],
	      ['시티투어', ${q060615}, 'opacity: 0.2'],
	      ['드라마 촬영지', ${q060616}, 'opacity: 0.5'],
	      ['가족/친지/친구', ${q060617}, 'opacity: 0.7'],
	      ['회의참가/시찰', ${q060618}, 'color: #F1F0D1'],
	      ['교육/훈련/연수', ${q060619}, 'color: #E4CEA8'],
	      ['유흥/오락', ${q060620}, 'color: #EEB884'],
	      ['기타', ${q060621}, 'color: #E29B7A']
	    ]);
	   
	    
	    var view = new google.visualization.DataView(data);
	    view.setColumns([0, 1,
	                     { calc: "stringify",
	                       sourceColumn: 1,
	                       type: "string",
	                       role: "annotation" },
	                     2]);
		var options = {
		       title: "만족도가 높은 사람들은 뭘 했을까?",
		       bar: {groupWidth: "40%"},
		       legend: { position: "none" },
		     };
		var chart = new google.visualization.ColumnChart(document.getElementById("linechart"));
		
		chart.draw(view, options);
  }
	
	function chart(){
		
		
		return true;
	}
 
  
  google.charts.load("current", {packages:["corechart"]});
	google.charts.setOnLoadCallback(drawChart3);
function drawChart3() {
	var data = google.visualization.arrayToDataTable([
	    ['Destination', 'Visitations'],
	    ['서울', ${q060101}],
	    ['부산', ${q060102}],
	    ['대구', ${q060103}],
	    ['인천', ${q060104}],
	    ['광주', ${q060105}],
	    ['대전', ${q060106}],
	    ['울산', ${q060107}],
	    ['경기', ${q060108}],
	    ['강원', ${q060109}],
	    ['충북', ${q060110}],
	    ['충남', ${q060111}],
	    ['전북', ${q060112}],
	    ['전남', ${q060113}],
	    ['경북', ${q060114}],
	    ['경남', ${q060115}],
	    ['제주', ${q060116}]
	   ]);

  var options = {
    title: '추천 방문지',
    is3D: true,
    slices: {  0: {offset: 0.1},
  	  		 1: {offset: 0.1},
  	  		 2: {offset: 0.1},
		         3: {offset: 0.1},
		         4: {offset: 0.1},
		         5: {offset: 0.1},
		         6: {offset: 0.1},
		         7: {offset: 0.1},
		         8: {offset: 0.1},
		         9: {offset: 0.1},
		         10: {offset: 0.1},
		         11: {offset: 0.1},
		         12: {offset: 0.1},
		         13: {offset: 0.1},
		         14: {offset: 0.1},
		         15: {offset: 0.1},
		         16: {offset: 0.1}
			  }
  };

  var chart = new google.visualization.PieChart(document.getElementById('donutchart2'));
  chart.draw(data, options);
}

google.charts.load("current", {packages:["corechart"]});
google.charts.setOnLoadCallback(drawChart4);

function drawChart4() {
  var data = google.visualization.arrayToDataTable([
  ['Destination', 'Visitations', { role: 'style' }],
  ['서울', ${q060101}, 'color: gray'],
  ['부산', ${q060102}, 'fill-color: #C5A5CF'],
  ['대구', ${q060103}, 'color: #E29B7A'],
  ['인천', ${q060104}, 'color: #E4CEA8'],
  ['광주', ${q060105}, 'opacity: 0.5'],
  ['대전', ${q060106}, 'color: #CB816F'],
  ['울산', ${q060107}, 'color: #E29B7A'],
  ['경기', ${q060108}, 'color: #E29B7A'],
  ['강원', ${q060109}, 'opacity: 0.5'],
  ['충북', ${q060110},'color: #E4CEA8'],
  ['충남', ${q060111},'color: #E29B7A'],
  ['전북', ${q060112}, 'color: #F1F0D1'],
  ['전남', ${q060113}, 'fill-color: #BC5679; fill-opacity: 0.2'],
  ['경북', ${q060114}, 'opacity: 0.2'],
  ['경남', ${q060115}, 'color: #76A7FA'],
  ['제주', ${q060116}, 'color: #EBEBEB']
 ]);
  
  var view = new google.visualization.DataView(data);
  view.setColumns([0, 1,
                   { calc: "stringify",
                     sourceColumn: 1,
                     type: "string",
                     role: "annotation" },
                   2]);

  var options = {
	       title: "추천 방문지",
	       bar: {groupWidth: "40%"},
	       legend: { position: "none" },
	     };
  var chart = new google.visualization.ColumnChart(document.getElementById("linechart2"));
  chart.draw(view, options);
}


  
</script>
</html>