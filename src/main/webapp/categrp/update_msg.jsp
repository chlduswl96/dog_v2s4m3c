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
    <c:choose>
      <c:when test="${count > 0}">
         <div style="margin-bottom: 10px;">
          수정에 성공했습니다.<br>
         </div>
         <button class="btn btn-primary" onclick="window.close();opener.document.location.reload();">닫기</button>
      </c:when>
      <c:otherwise>
         <div style="margin-bottom: 10px;">
	        수정에 실패했습니다.<br>
	        다시 시도해주세요.
	       </div>
         <button class="btn btn-primary" onclick="history.back();">다시하기</button>
         <button class="btn btn-primary" onclick="window.close();">닫기</button>
      </c:otherwise>
    </c:choose>
</DIV>

</body>

</html>