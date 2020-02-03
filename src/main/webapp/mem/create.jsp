<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team6</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="../js/jquery.cookie.js"></script>

<script type="text/javascript">
  $(function() {  // 페이지 실행시 실행되는 jquery
	  $.cookie('id_check', 'FALSE');  // 쿠키 생성, 형식: 쿠키 변수명, 값
	  $.cookie("email_confirm", "FALSE");
	});

	function checkId() {
	  var frm = $('#frm');
	  var params = 'id=' + $('#id', frm).val();
	  // alert("checkId 호출: " + param);
	  
	  $.ajax({
	        url : './id_check.do',
	        type : 'get',
	        async : true,  // true: 비동기
	        cache : false,   // 브라우저 캐시영역 사용여부
	        dataType : 'json', // 응답형식
	        data : params,  // $("#frm").serialize(), : 서버로 전달하는 데이터
	        success : function(rdata) {
	          // alert("==> rdata: " + rdata);
	          var msg ="";
	          if (rdata.count > 0) {
	            $('#modal_content').attr('class', 'alert alert-danger');
	            msg = "이미 사용중인 ID 입니다.";
	            $.cookie('id_check', 'FALSE');
	          } else {
	            $('#modal_content').attr('class', 'alert alert-success');
	            msg = "사용 가능한 ID 입니다.";
	            $.cookie('id_check', 'TRUE');  
	          }
	          
	          $('#modal_title').html('ID 중복 확인');
	          $('#modal_content').html(msg);
	          $("#modal_panel").modal(); // 다이얼로그 출력
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

	function send(){
	  // alert("submit");
	  var check = $.cookie('id_check');
	  // alert("check: " + check);
	  var msg = '';
	  
	  if (check != 'TRUE') {
	    msg = 'ID 중복확인이 되지 않았습니다.<br>';
	    msg += 'ID 중복확인 버튼을 클릭하세요.';
	    
	    $('#modal_content').attr('class', 'alert alert-danger');
	    $('#modal_title').html('ID 중복 확인');
	    $('#modal_content').html(msg);
	    $("#modal_panel").modal(); // 다이얼로그 출력

	    return false;
	  }
	  if($('#passwd').val() != $('#passwd2').val()) {
	    msg = '입력된 패스워드가 일치하지 않습니다.<br>'; 
	    msg += '패스워드를 다시 입력해주세요.';
	    
	    $('#modal_content').attr('class', 'alert alert-danger');
	    $('#modal_title').html('패스워드 일치 여부 확인');
	    $('#modal_content').html(msg);
	    $("#modal_panel").modal(); // 다이얼로그 출력
	    
	    return false;
	  }
	  if($.cookie("email_confirm") != "TRUE") {
	    msg = '이메일 인증을 하지 않습니다.<br>'; 
	    msg += '이메일 인증을 진행해주세요.';
	    
	    $('#modal_content').attr('class', 'alert alert-danger');
	    $('#modal_title').html('이메일 인증 확인');
	    $('#modal_content').html(msg);
	    $("#modal_panel").modal(); // 다이얼로그 출력
	    
	    return false;
	  }
	  
	 
	  
	  return true;
	}
	
	function email_confirm() {
		
		var email = $('#email').val() + $('#email2').val();
		var params = 'email=' + email;
		var con = confirm(email + "로 인증하기");
		
		
		if (con == true) {
			$.ajax({
		          url : './ecode_send.do',
		          type : 'post',
		          async : true,  // true: 비동기
		          cache : false,   // 브라우저 캐시영역 사용여부
		          dataType : 'json', // 응답형식
		          data : params,  // $("#frm").serialize(), : 서버로 전달하는 데이터
		          success : function(rdata) {
 		            // alert("ecode: " + rdata.ecode);
              	// $.cookie("ecode", rdata.ecode);
              	$.cookie('ecode', rdata.ecode, { expires: (90 / 24 / 60 / 60), secure: false });
              	alert($.cookie('ecode'));
              	var msg = '';
              	if (rdata.ecode_send == 'OK') {
              		// alert($.cookie("ecode"));
              		msg += email + "로 인증번호를 보냈습니다."
              		
              		$('#email_content').attr('class', 'alert alert-success');
                  $('#email_title').html('이메일 인증');
                  $('#email_content').html(msg);
                	$("#email_confirm").modal();
              	} else {
              		msg += email + "로 인증번호 보내기 실패"
              		
              		$('#email_content').attr('class', 'alert alert-danger');
                  $('#email_title').html('이메일 인증');
                  $('#email_content').html(msg);
                	$("#email_confirm").modal();
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
		
		return;
  }
	
	function ecode_confirm(){
		var url = './ecode_confirm.do';
		var win = window.open(url, '인증번호 확인', 'width=600px, height=350px');
		    
		var x = (screen.width - 600) / 2;
		var y = (screen.height - 350) / 2;
		win.moveTo(x, y); // 지정된 좌표로 이동
	}
	
</script>
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    회원 > 회원가입
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
  </ASIDE> 
  
  
  <div class='menu_line'></div>
  
  <!-- email 인증 알림창 시작 -->
  <div class="modal fade" id="email_confirm" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">X</button>
          <h4 class="modal-title" id='email_title'></h4>  <!--  제목 -->
        </div>
        <div class="modal-body">
          <p id='email_content'></p> <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="ecode_confirm();">인증하기</button>
        </div>
      </div>
      
    </div>
  </div> <!-- email 인증 알림창 종료 -->
  
  <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">X</button>
          <h4 class="modal-title" id='modal_title'></h4>  <!--  제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'></p> <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div> <!-- Modal 알림창 종료 -->
  
  
        
  <DIV style='width: 100%;'>
      <FORM name='frm' id='frm' method='POST' action='./create.do' 
              onsubmit="return send();" class="form-horizontal">

    <div class="form-group">
      <label for="id" class="col-md-2 control-label">아이디</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='id' id='id' value='' required="required" style='width: 30%; display: inline;' placeholder="아이디" autofocus="autofocus">
        <button type='button' onclick="checkId()" class="btn btn-info btn-md">중복확인</button>
        <SPAN id='id_span'></SPAN> <!-- ID 중복 관련 메시지 -->        
      </div>
    </div>   
                
    <div class="form-group">
      <label for="passwd" class="col-md-2 control-label">패스워드</label>    
      <div class="col-md-10">
        <input type='password' class="form-control input-lg" name='passwd' id='passwd' value='' required="required" style='width: 30%;' placeholder="패스워드">
      </div>
    </div>   
 
    <div class="form-group">
      <label for="passwd2" class="col-md-2 control-label">패스워드 확인</label>    
      <div class="col-md-10">
        <input type='password' class="form-control input-lg" name='passwd2' id='passwd2' value='' required="required" style='width: 30%;' placeholder="패스워드">
      </div>
    </div>   

    <div class="form-group">
      <label for="id" class="col-md-2 control-label">e-mail</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='email' id='email' value='' required="required" style='width: 30%; display: inline;' placeholder="이메일" autofocus="autofocus">
        <select name='email2' id='email2'>
          <option value='@naver.com'>@naver.com</option>
          <option value='@gmail.com'>@gmail.com</option>
          <option value='@daum.com'>@daum.com</option>
        </select>
        <button type='button' onclick="email_confirm()" class="btn btn-info btn-md">email 인증</button>
      </div>
    </div>   
    
    <div class="form-group">
      <label for="mname" class="col-md-2 control-label">성명</label>    
      <div class="col-md-10">
        <select name='gender'>
          <option value='M'>남</option>
          <option value='W'>여</option>
        </select>
        <input type='text' class="form-control input-lg" name='mname' id='mname' 
                   value='' required="required" style='width: 30%; display: inline-block;' placeholder="성명">
      </div>
    </div>
       
    <div class="form-group">
      
    </div>   
 
    <div class="form-group">
      <label for="tel" class="col-md-2 control-label">전화번호</label>
      <div class="col-md-10">
        <select name='telecom'>
          <option value='kt'>kt</option>
          <option value='sk'>sk</option>
          <option value='lg'>lg</option>
        </select>    
        <input type='text' maxlength='3' class="form-control input-lg" name='tel' value='' required="required" style='width: 10%; display: inline-block;'> -
        <input type='text' maxlength='4' class="form-control input-lg" name='tel2' value='' required="required" style='width: 15%; display: inline-block;'> -
        <input type='text' maxlength='4' class="form-control input-lg" name='tel3' value='' required="required" style='width: 15%; display: inline-block;'>
      </div>
    </div>   
 
    <div class="form-group">
      <label id="move_top" for="zipcode" class="col-md-2 control-label">우편번호</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='zipcode' id='zipcode' 
                   value='' required="required" style='width: 30%; display: inline;' placeholder="우편번호">
        <input type="button" onclick="DaumPostcode(); move_scroll();" value="우편번호 찾기" class="btn btn-info btn-md">
      </div>
    </div>
 
    <div class="form-group" >
      <label for="address1" class="col-md-2 control-label">주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='address1' id='address1' 
                   value='' required="required" style='width: 80%;' placeholder="주소">
      </div>
    </div>   
 
    <div class="form-group">
      <label for="address2" class="col-md-2 control-label">상세 주소</label>    
      <div class="col-md-10">
        <input type='text' class="form-control input-lg" name='address2' id='address2' 
                   value='' required="required" style='width: 80%;' placeholder="상세 주소">
      </div>
    </div>   
 
    <div class="form-group">
      <div class="col-md-12">
 
<!-- ----- DAUM 우편번호 API 시작 ----- -->
    <div id="wrap" style="display:none; border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative;">
      <img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
    </div>
 
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');
 
    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
 
    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;
 
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
 
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);
 
        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
    
    function move_scroll(){
        // 화면이동 id=wrap
        var offset = $("#move_top").offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->
 
      </div>
    </div>
    
    <div class="form-group">
      <div class="col-md-offset-2 col-md-10">
        <button type="submit" class="btn btn-primary btn-md">가입</button>
        <button type="button" onclick="location.href='../index.jsp'" class="btn btn-primary btn-md">취소</button>
      </div>
    </div>   
  </FORM>
  </DIV>
 
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 