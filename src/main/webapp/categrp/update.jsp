<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>카테고리 수정</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 
</head> 
<body>

<DIV class='title_line'>카테고리 수정</DIV>

<DIV class='message'>
  <form method="post" name="frm" action="./update.do">
    <input type="hidden" value="${update_select[0].seqno}" name="seqno">
    <input type="hidden" value="${update_select[0].categrpno}" name="categrpno">
    <UL>
    <c:forEach var="vo" items="${update_select}">
      <li class="li_none">순서 : ${vo.seqno}</li>
      <li class="li_none">대분류명 : <input type="text" value="${vo.name }" name="name"></li>
      <li class="li_none">등록일 : ${vo.rdate }</li>
      <li class="li_none">출력 : ${vo.visible }</li>
    </c:forEach>
    </UL>
    <button class="btn btn-primary" type="submit">수정</button>
    <button class="btn btn-primary" onclick="window.close();">취소</button>
  </form>
</DIV>

</body>

</html>