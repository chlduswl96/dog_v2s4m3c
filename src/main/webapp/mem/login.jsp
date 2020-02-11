<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value='${pageContext.request.contextPath}' />
 
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
 
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<script type="text/javascript">
  function loadDefault() {
    $('#id').val('user1');
    $('#passwd').val('1234');
  }
</script> 

</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
 
<DIV class='title_line' style='width: 20%;'>로그인</DIV>
 
  <FORM name='frm' method='POST' action='./login.do' class="form-horizontal">
    
    <div class="form-group">
      <label class="col-md-5 control-label" style='font-size: 0.8em;'>아이디</label>    
      <div class="col-md-7">
        <input type='text' class="form-control input-md" name='id' id='id' value='${ck_id }' 
              required="required" style='width: 30%;' placeholder="아이디" autofocus="autofocus">
      </div>
    </div>   
 
    <div class="form-group">
      <label class="col-md-5 control-label" style='font-size: 0.8em;'>패스워드</label>    
      <div class="col-md-7">
        <input type='password' class="form-control input-md" name='passwd' id='passwd' value='${ck_passwd }' required="required" style='width: 30%;' placeholder="패스워드">
        <input type='checkbox' name='id_save' value='Y' 
                    ${ck_id_save == 'Y' ? "checked='checked'" : "" }> 아이디 저장
      </div>
    </div>   
    <div class="form-group">
      <div class="col-md-offset-2 col-md-12" style='text-align: center; margin-left: 0px;'>
      
        <button type="submit" class="btn btn-primary btn-md">로그인</button>
        <button type='button' onclick="loadDefault();" class="btn btn-primary btn-md">테스트 계정</button>
      </div>
    </div>   
    
  </FORM>
  
  <DIV style='text-align: center; font-size: 0.8em; margin-top: 10px;'>
        <A href="./find_id.do">아이디 찾기</A>
        <span class='menu_divide' >│</span> 
        <A href="./find_passwd.do">비밀번호찾기</A>
        <span class='menu_divide' >│</span> 
        <A href="./create_agr.do">회원가입</A>
  </DIV>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>