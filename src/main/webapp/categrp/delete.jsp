<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>카테고리 삭제</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
 function chile_delete(){
   delete_frm.submit();
 }
</script>
 
</head> 
<body>
<form name="delete_frm" action="../repository/delete_child.do" method="post">
   <input type="hidden" value="${categrpno}" name="categrpno">
</form>

<DIV class='title_line'>카테고리 삭제</DIV>

<DIV class='message'>
  <form method="post" name="frm" action="./delete.do">  
    <input type="hidden" value="${categrpno}" name="categrpno">
    <div>
      삭제를 하면 더 이상 복구가 불가능 합니다.
    </div>
    <c:choose>
      <c:when test="${child_count > 0}">
       <div style="margin-bottom: 10px;">
          해당 카테고리로 등록된 재고가 있습니다.<br>
          재고를 삭제하기 전까진 카테고리를 삭제 할 수 없습니다.<br>
          등록 재고 갯수 : ${child_count}
        </div>
        <div>
          재고를 삭제하시겠습니까?
          <button type="button" class="btn btn-primary" onclick="chile_delete()">삭제</button>
        </div>
      </c:when>
      <c:otherwise>
       <div style="margin-bottom: 10px;">
          등록된 카테고리를 삭제하시겠습니까?
        </div>
        <div>
          <button type="submit" class="btn btn-primary">삭제</button>
        </div>
      </c:otherwise>
    </c:choose>
  </form>
</DIV>

</body>

</html>