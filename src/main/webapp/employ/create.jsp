<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>직원 회원가입</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
  $(function() {

  });
</script>

</head>

<body>
	<jsp:include page="/menu/top.jsp" flush='false' />
	<ASIDE style='float: left;'>
		<a href="#">직원</a> > <a href="#">회원가입</a>
	</ASIDE>
	<DIV class='menu_line' style='clear: both;'></DIV>

	<div style='width: 100%;'>
		<div class="row">
			<form name="form" method="post" action="./create.do">
				<div class="col-sm-12">
					<span>아이디</span>
				  <input type="text" name="id">
				</div>
				<div class="col-sm-12">
					<span>비밀번호</span>
					<input type="password" name="pw">
				</div>
				<div class="col-sm-12">
					<span>이메일</span> 
					<input type="email" name="email">
				</div>
				<div class="col-sm-12">
          <span>이름</span> 
          <input type="text" name="name">
        </div>
				<div class="col-sm-12">
					<span>직급</span> 
					<select name="erank">
						<option>사원</option>
						<option>대리</option>
						<option>과장</option>
						<option>차장</option>
					</select>
				</div>
				<button type="submit">전송</button>
			</form>
		</div>
	</div>

	<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
