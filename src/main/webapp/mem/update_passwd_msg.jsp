<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
    
<script type="text/javascript">
  $(function(){ 
  
  });
</script>
 
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
<DIV class='title_line'>알림</DIV>
  <DIV class='message'>
    <fieldset class='fieldset_basic'>
      <ul>
      
        <c:choose>
          <c:when test="${param.count == 0}">
            <li class='li_msg_fail'>입력된 패스워드가 일치하지 않습니다.</li>
            <li class='li_none'>
              <button type='button' onclick='history.go(-1);' class="btn btn-primary btn-md">재시도</button>            
              <button type='button' onclick="location.href='./list_all.do'" class="btn btn-primary btn-md">목록</button>            
            </li>
          </c:when>
          <c:otherwise >
            <c:if test="${param.update_count == 1}">
            <li class='li_msg_success'>패스워드 변경에 성공했습니다.</li>
            <li class='li_none'>
              <button type='button' onclick="location.href='./update_passwd.do?memno=${param.memno }'" class="btn btn-primary btn-md">패스워드 다시 수정</button>            
              <button type='button' onclick="location.href='./list_all.do'" class="btn btn-primary btn-md">목록</button>            
            </li>
            </c:if>
          </c:otherwise>
        </c:choose>
        
      </ul>
    </fieldset>    
  </DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 