<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team6</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript" src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<script type="text/javascript">

function ecode_confirm(){
  var ecode = $.cookie("ecode");
  
  if ($("#ecode").val() == ecode) {
    $.cookie("email_confirm", "TRUE");
    alert("인증되었습니다");
    window.close();
  } else {
	  alert("인증번호가 틀렸습니다.");
	  window.location.reload();
  }
}

$(function() {
	  var min = 1;
	  var sec = 30;
	  setInterval(function(){
	    sec--;
	    if (min == 0 && sec == 0) {
	      alert("인증번호 입력시간이 만료되어 다시 시도해주세요.");
	      window.close();
	    }
	    
	    if (sec < 0) {
	      min --;
	      sec = 59;
	    }
	    
	    if (sec < 10) {
	      sec = "0" + sec;
	    }
	    document.getElementById("timer").innerHTML = min + ":" + sec;
	  }, 1000);
	});
</script>
</head> 
<body>

<script type="text/javascript">
$(function() {  // 페이지 실행시 실행되는 jquery
  timer();
});
</script>

<DIV class='title_line'>email인증</DIV>
<DIV class='message' style='width: 90%;'>
  <fieldset class='fieldset_basic'>
    <UL>
      <LI class='li_msg_success'>
        <div style='float: left; color: red; margin-left:30px;' id='timer'></div>
        인증 번호 입력: 
        <input type='text' maxlength='4' name='ecode' id='ecode' required="required" style='width: 30%;'>
        <button type='button' onclick="ecode_confirm()" class="btn btn-info btn-md">인증하기</button>
      </LI>
    </UL>
  </fieldset>
</DIV>

</body>
</html>