<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="/menu/mypage_top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <a href='../mypage/mypage_main.jsp'>마이페이지</a> > 
    <A href=''>장바구니</A>
  </ASIDE>
  <DIV style='clear: both; height: 2px; margin: 10px 0px; background-color: #dedede;'></DIV>
</div>
</div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>