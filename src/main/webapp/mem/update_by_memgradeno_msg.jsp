<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>update</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

 <!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head> 
<body>
  
<!-- <FORM name='frm' method='POST' action='./update.do'> -->
<FORM name='frm' method='get' action='../memgrade/delete.do'>
<input type='hidden' name='memgradeno' id='memgradeno' value="${memgradeVO.memgradeno }">

  <fieldset class='fieldset_basic'>
    <ul>
      <li class='li_none'>
        회원 ${count_by_memgradeno }명 변경이 완료 되었습니다.
      </li>
      <li class='li_none'>
      
      <label class="label_basic">변경된 등급</label>
      <input name='memgradeno' id="disabledInput" type="text" value='${new_memgradeVO.gname }' style='width: 30%; display: inline;' disabled>
 
      </li>
      <li class='li_right'>
        <button type="submit" >${memgradeVO.gname } 등급 삭제 하기</button>
        <button type="button" onclick="opener.location.reload(); window.close();">취소</button>
      </li>
    </ul>
  </fieldset>
</FORM>
 
</body>
 
</html> 