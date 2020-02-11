<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head> 
<script>
  function child_delete(){
    delete_form.submit();
  }

</script>
<body>
  <form name='delete_form' action="./repository_child_delete.do" method="post">
    <input type="hidden" name="repositoryno" value="${repositoryno}">
  </form>


  <DIV class='title_line'>재고 삭제</DIV>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM method='POST' action='./delete.do'>
    <input type="hidden" name="repositoryno" value="${repositoryno}">
      <c:choose>
        <c:when test="${count > 0 }">
           <div style="margin-bottom: 10px;">
            해당 재고로 등록된 상품이 있습니다.<br>
            갯수 : &nbsp${count }<br>
            상품을 지워야 재고를 삭제 할 수 있습니다.<br>
          </div>     
          <div>   
            <button class='btn btn-primary' onclick="child_delete();" type="button">상품 삭제</button>
            <button class='btn btn-primary' onclick="window.close();" type="button">취소</button>
          </div>
        </c:when>
        <c:otherwise>
            <div style="margin-bottom: 10px;">
            재고를 삭제 하겠습니까??.<br>
          </div>        
          <div>   
            <button class='btn btn-primary' type="submit">재고 삭제</button>
            <button class='btn btn-primary' onclick="window.close();" type="button">취소</button>
          </div>
        </c:otherwise>
      </c:choose>
    
    
    </FORM>
  </div>
</body>
 
</html> 
 