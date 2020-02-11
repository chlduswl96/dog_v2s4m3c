<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

 <!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript">
  function delete_cancle() {
	  opener.location.reload();
	  window.close();
	}
</script>
</head> 
<body>
<div style='display: table; width: 100%; height: 250px;'>
<div style='display: table-cell; vertical-align: middle;'>

<form name='frm_delete_by_memgradeno' method="POST" action='../mem/delete_by_memgradeno.do'>
  <input type='hidden' name='memgradeno' id='name' value="${memgradeVO.memgradeno }">
</form>

<FORM name='frm' method='POST' action='./delete.do'>
<input type='hidden' name='memgradeno' id='name' value="${memgradeVO.memgradeno }">
  <fieldset class='fieldset_basic'>
    <ul>
      <li class='li_none'>
        삭제될 등급 이름: ${memgradeVO.gname }
      </li>
      
      <c:if test="${count_by_memgradeno >= 1}" >
      <li class='li_none'>
        <span style="text-decoration: underline; font-weight: bold;">해당 등급의 회원 ${count_by_memgradeno }명이 발견.</span>
        <br>
        해당 등급 회원들을 다른 등급으로 변경시켜야 삭제할 수 있습니다.<br>
        <button type="button" class='btn btn-info' onclick="location.href='../mem/update_by_memgradeno.do?memgradeno=${memgradeVO.memgradeno}'">변경 진행</button>
        <button type="button" class='btn btn-info' onclick='delete_cancle();'>취소</button>
      </li>
      </c:if>
      <c:if test="${count_by_memgradeno == 0}" >      
      <li class='li_none'>
        삭제하면 복구할 수 없습니다.<br>
        삭제를 진행 하시겠습니까?
      </li>
      <li class='li_right' style='margin-right: 40px;'>
        <button type="submit" class='btn btn-info'>삭제</button>
        <button type="button" class='btn btn-info' onclick="delete_cancle();">취소</button>
      </li>         
      </c:if>
    </ul>
  </fieldset>
</FORM>

 </div>
 </div>

</body>
 
</html> 