<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>상품 등록</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
 
<body>
    <div>
      <c:choose>
        <c:when test="${repository_update_count > 0}">
           <div style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
              재고가 수정되었습니다.
           </div> 
           <div style="text-align: center;">
              <button type="button" onclick="opener.document.location.reload(); window.close();" class='btn btn-danger'>닫기</button>
           </div>
        </c:when>
        <c:otherwise>
           <div style="text-align: center; margin-top: 20px; margin-bottom: 20px;">
              상품 수정에 실패되었습니다.
           </div> 
           <div style="text-align: center;">
              <button type="button" onclick="location.href='./update.do?repositoryno=${repositoryno}'" class='btn btn-danger'>다시 시도</button>
           </div>
        </c:otherwise>
      </c:choose>
    </div>
</body>
 
</html>
    