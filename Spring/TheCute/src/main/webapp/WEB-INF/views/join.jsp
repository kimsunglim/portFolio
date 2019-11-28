<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<link
	href="${pageContext.request.contextPath}/resources/vendor/fontawesome-free/css/all.css"
	rel="stylesheet" type="text/css">

<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"
	rel="stylesheet" type="text/css">
<link
	href="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.slim.min.js"
	rel="stylesheet" type="text/css">
<head>
<title>회원가입</title>
<meta charset="utf-8" />
</head>
<style>
:root {
  --input-padding-x: 1.5rem;
  --input-padding-y: .75rem;
}

body {
  background: #6A84B7;
  background: linear-gradient(to right, #004C63, #B2CCFF);
}

.card-signin {
  border: 0;
  border-radius: 1rem;
  box-shadow: 0 0.5rem 1rem 0 rgba(0, 0, 0, 0.1);
}

.card-signin .card-title {
  margin-bottom: 2rem;
  font-weight: 300;
  font-size: 1.5rem;
}

.card-signin .card-body {
  padding: 2rem;
}

.form-signin {
  width: 100%;
}

.form-signin .btn {
  font-size: 80%;
  border-radius: 5rem;
  letter-spacing: .1rem;
  font-weight: bold;
  padding: 1rem;
  transition: all 0.2s;
}

.form-label-group {
  position: relative;
  margin-bottom: 1rem;
}

.form-label-group input {
  height: auto;
  border-radius: 2rem;
}

.form-label-group>input,
.form-label-group>label {
  padding: var(--input-padding-y) var(--input-padding-x);
}

.form-label-group>label {
  position: absolute;
  top: 0;
  left: 0;
  display: block;
  width: 100%;
  margin-bottom: 0;
  /* Override default `<label>` margin */
  line-height: 1.5;
  color: #495057;
  border: 1px solid transparent;
  border-radius: .25rem;
  transition: all .1s ease-in-out;
}

.form-label-group input::-webkit-input-placeholder {
  color: transparent;
}

.form-label-group input:-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-ms-input-placeholder {
  color: transparent;
}

.form-label-group input::-moz-placeholder {
  color: transparent;
}

.form-label-group input::placeholder {
  color: transparent;
}

.form-label-group input:not(:placeholder-shown) {
  padding-top: calc(var(--input-padding-y) + var(--input-padding-y) * (2 / 3));
  padding-bottom: calc(var(--input-padding-y) / 3);
}

.form-label-group input:not(:placeholder-shown)~label {
  padding-top: calc(var(--input-padding-y) / 3);
  padding-bottom: calc(var(--input-padding-y) / 3);
  font-size: 12px;
  color: #777;
}



/* Fallback for Edge
-------------------------------------------------- */

@supports (-ms-ime-align: auto) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input::-ms-input-placeholder {
    color: #777;
  }
}

/* Fallback for IE
-------------------------------------------------- */

@media all and (-ms-high-contrast: none),
(-ms-high-contrast: active) {
  .form-label-group>label {
    display: none;
  }
  .form-label-group input:-ms-input-placeholder {
    color: #777;
  }
}

select {
        width:50px ;
    }
</style>

<!-- This snippet uses Font Awesome 5 Free as a dependency. You can download it at fontawesome.io! -->

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">SIGN UP</h5>
						<form class="form-signin" action="do_join" method="POST" onsubmit="return check()">
							<div class="form-label-group">
								<input type="text" id="inputid" name="id" class="form-control"
									placeholder="아이디" required autofocus > <label
									for="inputid">아이디</label>
								<div class="check_font" id="id_check"></div>
							</div>
							
							<div class="form-label-group">
								<input type="password" id="inputPassword" class="form-control"
									placeholder="패스워드" required="required" name="password"> <label
									for="inputPassword">비밀번호</label>
							</div>
							
							<div class="form-label-group">
								생년월일
							</div>
							
							
		  <div class="form-row">
		  <div class="form-group col-md-4">
		  
      <select id="year" class="form-control" name="year" required>
      
        <option value="" disabled selected>년</option>
					<option value="00">2000년</option>
					<option value="99">1999년</option>
					<option value="98">1998년</option>
					<option value="97">1997년</option>
					<option value="96">1996년</option>
					<option value="95">1995년</option>
					<option value="94">1994년</option>
					<option value="93">1993년</option>
					<option value="92">1992년</option>
					<option value="91">1991년</option>
		  </select>
    </div><div class="form-group col-md-4">
      <select id="month" class="form-control" name="month" required>
        <option value="" disabled selected>월</option>
					<option value="01">1월</option>
					<option value="02">2월</option>
					<option value="03">3월</option>
					<option value="04">4월</option>
					<option value="05">5월</option>
					<option value="06">6월</option>
					<option value="07">7월</option>
					<option value="08">8월</option>
					<option value="09">9월</option>
					<option value="10">10월</option>
					<option value="11">11월</option>
					<option value="12">12월</option>	
		  </select>
    </div>
    <div class="form-group col-md-4">
      <select id="name" class="form-control" name="day" required>
        <option value="" disabled selected>일</option>
					<option value="01">1일</option>
					<option value="02">2일</option>
					<option value="03">3일</option>
					<option value="04">4일</option>
					<option value="05">5일</option>
					<option value="06">6일</option>
					<option value="07">7일</option>
					<option value="08">8일</option>
					<option value="09">9일</option>
					<option value="10">10일</option>
					<option value="11">11일</option>
					<option value="12">12일</option>
					<option value="13">13일</option>
					<option value="14">14일</option>
					<option value="15">15일</option>
					<option value="16">16일</option>
					<option value="17">17일</option>
					<option value="18">18일</option>
					<option value="19">19일</option>
					<option value="20">20일</option>
					<option value="21">21일</option>
					<option value="22">22일</option>
					<option value="23">23일</option>
					<option value="24">24일</option>
					<option value="25">25일</option>
					<option value="26">26일</option>
					<option value="27">27일</option>
					<option value="28">28일</option>
					<option value="29">29일</option>
					<option value="30">30일</option>
					<option value="31">31일</option>
		  </select>
    </div>
  </div>
							
							
							<div class="form-label-group">
								<input type="text" id="inputName" name="name" class="form-control"
									placeholder="이름" required autofocus > <label
									for="inputName">이름</label>
							</div>
					
							

						    
						    <p><hr></p>
							<button class="btn btn-lg btn-primary btn-block text-uppercase"
								type="submit">Sign up</button>
							<a href="/thecute/" class="btn btn-lg btn-primary btn-block text-uppercase">Back</a>
							
						</form>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	var check_Id = 1

	$("#inputid").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#inputid').val();
		$.ajax({
			url : 'idCheck?userId='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				check_Id = data
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다.");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} 
				}, error : function() {
						console.log("실패");
				}
			});
		});
		
		function check() {
			if (check_Id == 1) {
				alert("이미 사용중인 아이디입니다.")
				$("input[name=id]").focus();
				return false;
			} else {
				return true
			}
		}
</script>

</html>