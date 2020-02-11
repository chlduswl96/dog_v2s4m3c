<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script type="text/javascript">
function delete_cancle() {
	 opener.location.reload();
	 window.close();
}
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head> 
<body>

<DIV class='title_line'>알림</DIV>

<DIV class='message'>
  <fieldset class='fieldset_basic'>
    <UL>
      <c:choose>
        <c:when test="${count == 1 }">
          <LI class='li_msg_fail'>${memgradeVO.gradename }등급의 회원 ${count_by_gradeno }명 삭제 성공</LI>
          <button type='button' onclick="opener.location.reload(); window.close();">등급 삭제 계속</button>
          <button type='button' onclick="opener.location.reload(); window.close();">닫기</button>
        </c:when>
        <c:otherwise>
          <LI class='li_msg_fail'>회원 삭제 실패</LI>
          <LI class='li_msg_fail'>다시 시도해주세요.</LI>
          <button type='button' onclick="history.go(-1)">다시시도</button>
        </c:otherwise>
      </c:choose>
    </UL>
  </fieldset>

</DIV>

</body>
</html>