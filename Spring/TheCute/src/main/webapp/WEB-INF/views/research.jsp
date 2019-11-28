<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
<!-- Custom styles for this template-->
<link
	href="${pageContext.request.contextPath}/resources/css/sb-admin-2.min.css"
	rel="stylesheet">



<title>설문조사</title>
</head>
<body>
	<div class="container mt-3">
		<h2>설문조사</h2>
		<p></p>
		<form action="insert" method="POST" name='form'
			onsubmit="return check()">
			<p>1. 나이</p>
			<select name="age" class="custom-select mb-3">
				<option value="20">20</option>
				<option value="21">21</option>
				<option value="22">22</option>
				<option value="23">23</option>
				<option value="24">24</option>
				<option value="25">25</option>
				<option value="26">26</option>
				<option value="27">27</option>
				<option value="28">28</option>
				<option value="29">29</option>
			</select>

			<p>2. 성별</p>
			<select name="sex" class="custom-select mb-3">
				<option value="1">남성</option>
				<option value="2">여성</option>
			</select>

			<p>3. 거주시도</p>
			<select name="sido" class="custom-select mb-3">
				<option value="1">서울</option>
				<option value="2">부산</option>
				<option value="3">대구</option>
				<option value="4">인천</option>
				<option value="5">광주</option>
				<option value="6">대전</option>
				<option value="7">울산</option>
				<option value="8">경기</option>
				<option value="9">강원</option>
				<option value="10">충북</option>
				<option value="11">충남</option>
				<option value="12">전북</option>
				<option value="13">전남</option>
				<option value="14">경북</option>
				<option value="15">경남</option>
				<option value="16">제주</option>
			</select>

			<p>4. 직업</p>
			<select name="jobgroup" class="custom-select mb-3">
				<option value="1">대학생</option>
				<option value="2">직장인</option>
				<option value="3">무직</option>
				<option value="4">군인</option>
				<option value="999">기타</option>
			</select>

			<p>5. 여행월</p>
			<select name="month" class="custom-select mb-3">
				<option value="1">1월</option>
				<option value="2">2월</option>
				<option value="3">3월</option>
				<option value="4">4월</option>
				<option value="5">5월</option>
				<option value="6">6월</option>
				<option value="7">7월</option>
				<option value="8">8월</option>
				<option value="9">9월</option>
				<option value="10">10월</option>
				<option value="11">11월</option>
				<option value="12">12월</option>
			</select>

			<p>6. 당일/숙박여행</p>
			<select name="q010000" class="custom-select mb-3">
				<option value="1">당일여행</option>
				<option value="2">숙박여행</option>
			</select>

			<p>7. 여행일 수</p>
			<div class="form-group">
				<input type="number" class="form-control" placeholder="여행일을 입력하세요."
					name="q020000">
			</div>

			<p>8. 여행 정보 주요 획득지</p>

			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q040100" value="1">여행사
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q040200" value="2">가족/친지
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q040300" value="3">친구/동료
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q040400" value="4">인터넷
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q040500" value="5">관광 안내 서적
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q040600" value="6">기사 및 방송프로그램
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q040700" value="7">관광
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q040800" value="8">과거 방문경험
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q040900" value="9">스마트폰 등 모바일 앱
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q041000" value="10">기타
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q041100" value="11">없음
				</label>
			</div>
			<p></p>

			<p>9. 일행 존재 여부</p>
			<select name="q050000" class="custom-select mb-3">
				<option value="1">예</option>
				<option value="2">아니요</option>
			</select>

			<p>10. 여행한 광역시/도</p>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060101" value="911">서울
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060102" value="921">부산
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060103" value="922">대구
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060104" value="923">인천
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060105" value="924">광주
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060106" value="925">대전
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060107" value="926">울산
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060108" value="931">경기
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060109" value="932">강원
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060110" value="933">충북
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060111" value="934">충남
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060112" value="935">전북
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060113" value="936">전남
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060114" value="937">경북
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060115" value="938">경남
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060116" value="939">제주
				</label>
			</div>
			<p></p>

			<p>11. 여행지 선택이유</p>

			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060301" value="1">여행지 지명도
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060302" value="2">볼거리 제공
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060303" value="3">저렴한 여행경비
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060304" value="4">이동거리
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060305" value="5">여행할 수 있는 시간
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060306" value="6">숙박시설
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060307" value="7">여행동반자 유형
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060308" value="8">쇼핑
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060309" value="9">음식
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060310" value="10">교통편
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060311" value="11">체험프로그램 유무
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060312" value="12">경험자의 추천
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060313" value="13">관광지 편의시설
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060314" value="14">교육성
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060315" value="15">기타
				</label>
			</div>
			<p></p>

			<p>12. 주요 이동(교통수단)</p>

			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060401" value="1">자가용
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060402" value="2">철도
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060403" value="3">항공기
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060404" value="4">선박/해상교통
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060405" value="5">지하철
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060406" value="6">(정기)고속/시외버스
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060407" value="7">(부정기)전세/관광버스
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060408" value="8">차량대여/렌트
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060409" value="9">자전거
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060410" value="10">기타
				</label>
			</div>
			<p></p>

			<p>13. 숙박시설</p>

			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060501" value="1">숙박하지 않음
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060502" value="2">호텔
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060503" value="3">콘도미니엄
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060504" value="4">유스호스텔
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060505" value="5">모텔/여관
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060506" value="6">펜션
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060507" value="7">민박
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060508" value="8">야영
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060509" value="9">자연휴양림
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060510" value="10">가족/친지
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060511" value="11">연수원/수련원
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060512" value="12">전통한옥숙박시설
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060513" value="13">기타
				</label>
			</div>
			<p></p>

			<p>14. 여행지에서의 활동</p>

			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060601" value="1">자연 및 풍경 감상
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060602" value="2">음식관광
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060603" value="3">야외 위락/스포츠 활동
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060604" value="4">역사유적지 방문
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060605" value="5">테마파크/놀이시설
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060606" value="6">휴식/휴양
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060607" value="7">온천/휴양
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060608" value="8">쇼핑
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060609" value="9">문화예술/공연/전시시설
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060610" value="10">스포츠 경기 관람
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060611" value="11">축제/이벤트
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060612" value="12">교육/체험 프로그램
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060613" value="13">종교/성지순례
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060614" value="14">갬블링
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060615" value="15">시티투어
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060616" value="16">드라마 촬영지
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060617" value="17">가족/친지/친구
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060618" value="18">회의참가/시찰
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060619" value="19">교육/훈련/연수
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060620" value="20">유흥/오락
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q060621" value="21">기타
				</label>
			</div>
			<p></p>

			<p>15. 일별 지출 비용</p>
			<select name="q07grade" class="custom-select mb-3">
				<option value="1">3만원 이하</option>
				<option value="2">6만원 이하</option>
				<option value="3">10만원 이하</option>
				<option value="4">20만원 이하</option>
				<option value="5">20만원 초과</option>
			</select>

			<p>16. 총지출 비용 (원)</p>
			<div class="form-group">
				<input type="number" class="form-control"
					placeholder="총지출 비용을 입력하세요." name="q070000">
			</div>

			<p>17. 사전예약 서비스 여부</p>
			<select name="q080000" class="custom-select mb-3">
				<option value="1">예</option>
				<option value="2">아니요</option>
			</select>

			<p>18. 사전예약 서비스 목록</p>

			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q080100" value="1">숙박시설
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q080200" value="2">교통수단
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q080300" value="3">차량대여/렌트
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q080400" value="4">관광명소
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q080500" value="5">레저시설
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q080600" value="6">체험프로그램
				</label>
			</div>
			<div class="form-check-inline">
				<label class="form-check-label"> <input type="checkbox"
					name="q080700" value="7">기타
				</label>
			</div>
			<p></p>

			<p>19. 여행상품 구매 이용</p>
			<select name="q090000" class="custom-select mb-3">
				<option value="1">예</option>
				<option value="2">아니요</option>
			</select>

			<p>20. 전반적 만족도</p>
			<select name="q060700" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>21. 재방문 의향</p>
			<select name="q060800" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>22. 타인 추천의향</p>
			<select name="q060900" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>23. 만족도_자연경관</p>
			<select name="q100100" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>24. 만족도_문화유산</p>
			<select name="q100200" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>25. 만족도_교통</p>
			<select name="q100300" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>26. 만족도_숙박시설</p>
			<select name="q100400" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>27. 만족도_식당 및 음식</p>
			<select name="q100500" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>28. 만족도_쇼핑</p>
			<select name="q100600" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>29. 만족도_관광정보 및 안내시설</p>
			<select name="q100700" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>30. 만족도_관광지 편의시설</p>
			<select name="q100800" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>31. 만족도_관광종사자 친절성</p>
			<select name="q100900" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>32. 만족도_체험프로그램</p>
			<select name="q101000" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>33. 만족도_물가</p>
			<select name="q101100" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>

			<p>34. 만족도_혼잡도</p>
			<select name="q101200" class="custom-select mb-3">
				<option value="1">매우 불만족</option>
				<option value="2">불만족</option>
				<option value="3" selected>보통</option>
				<option value="4">만족</option>
				<option value="5">매우 만족</option>
			</select>


			<button type="submit" class="btn btn-primary">입력완료</button>
			<a href="/thecute/" class="btn btn-primary">취소</a>
		</form>
	</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	function check() {
		if ((form.q020000.value) == "") {
			alert("여행일을 입력해주세요")
			$("input[name=q020000]").focus();
			return false;
		} else if ((form.q070000.value) == "") {
			alert("총 지출비용을 입력해주세요")
			$("input[name=q070000]").focus();
			return false;
		} else {
			alert("설문조사 완료!")
			return true
		}
	}
</script>
</html>

