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

</script>
</head> 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />

<script type="text/javascript">
function moveHome() {
	window.location.href = "./login.do";
}

function find_passwd(){
	var id = $('#id').val();
	var email = $('#email').val() + $('#email2').val();
	
	$.ajax({
        url : './find_passwd.do',
        type : 'post',
        async : true,  // true: 비동기
        cache : false,   // 브라우저 캐시영역 사용여부
        dataType : 'json', // 응답형식
        data : "email=" + email + "&id=" + id,  // $("#frm").serialize(), : 서버로 전달하는 데이터
        success : function(rdata) {
        	if (rdata.count == 1) {
            var msg = "'" + email + "'로<br>";
            msg += rdata.id + "의 임시 비밀번호를 보냈습니다.";
            
            $('#find_content').attr('class', 'alert alert-success');
            $('#find_title').html('비밀번호 찾기');
            $('#find_content').html(msg);
            $("#find_id").modal();
            
            document.getElementById('find_btn').addEventListener('click', moveHome);
            
        	} else {
            var msg = "이메일 또는 아이디와 일치하는 회원이 없습니다.";
        		
            $('#find_content').attr('class', 'alert alert-danger');
            $('#find_title').html('비밀번호 찾기');
            $('#find_content').html(msg);
            $("#find_id").modal();
        	}
        	
        },
        // ajax 통신 에러 브라우저 콘솔에 출력
        error : function(request, status, error) { // callback 함수
          var msg = 'ERROR<br><br>';
          msg += '<strong>request.status</strong><br>' + request.status
              + '<hr>';
          msg += '<strong>error</strong><br>' + error + '<hr>';
          console.log(msg);
        }
  });
}
</script>


<!-- Modal 알림창 시작 -->
  <div class="modal fade" id="find_id" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">X</button>
          <h4 class="modal-title" id='find_title'></h4>  <!--  제목 -->
        </div>
        <div class="modal-body">
          <p id='find_content'></p> <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" id='find_btn' class="btn btn-default" data-dismiss="modal">확인</button>
        </div>
      </div>
      
    </div>
  </div> <!-- Modal 알림창 종료 -->


<DIV class='title_line'>비밀번호 찾기</DIV>

<DIV class='message' style='width: 90%;'>
    <div class="form-group">
      <div class="col-md-10" style='text-align: center; margin-bottom: 20px;'>
        가입한 아이디
        <input type='text' class="form-control input-md" name='id' id='id' value='' required="required" style='width: 30%; display: inline;' placeholder="아이디" autofocus="autofocus">
        <SPAN id='id_span'></SPAN> <!-- ID 중복 관련 메시지 -->        
      </div>
    </div> 
    
    <div class="form-group">
      <div class="col-md-10" style='text-align: center; margin-bottom: 20px;'>
        가입시 등록한 email : 
        <input type='text' class="form-control input-md" name='email' id='email' value='' required="required" style='width: 30%; display: inline;' placeholder="이메일" autofocus="autofocus">
        <select name='email2' id='email2'>
          <option value='@naver.com'>@naver.com</option>
          <option value='@gmail.com'>@gmail.com</option>
          <option value='@daum.com'>@daum.com</option>
        </select>
      </div>
    </div>
    
    <div class="form-group">
      <div class="col-md-10" style='text-align: center;'>
        <button type='button' onclick="find_passwd()" class="btn btn-info btn-md">찾기</button>
      </div>
    </div>
</DIV>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>