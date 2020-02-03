<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
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
 
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/JavaScript">

  function send_mail() {
    var params = {
    		"list" : '${list }',
    		"subject" : $('#subject').val(), 
    		"content" : CKEDITOR.instances.content.getData()
    };
    
    $.ajax({
          url : './send_mail.do',
          type : 'post',
          async : true,  // true: 비동기
          cache : false,   // 브라우저 캐시영역 사용여부
          dataType : 'json', // 응답형식
          data : params,  // $("#frm").serialize(), : 서버로 전달하는 데이터
          success : function(rdata) {
        	  var msg = '';
            if (rdata.count == rdata.tot){
            	msg += "메일 " + rdata.tot + "건을 모두 보냈습니다.";
            	
            	$('#modal_content').attr('class', 'alert alert-success');
            	$('#modal_title').html('메일 보내기 확인');
              $('#modal_content').html(msg);
              $("#modal_panel").modal();
            } else {
            	msg += "메일 " + rdata.tot + "건 중 <br>";
            	msg += rdata.count + "건 만 보냈습니다."
            	
            	$('#modal_content').attr('class', 'alert alert-danger');
            	$('#modal_title').html('메일 보내기 확인');
              $('#modal_content').html(msg);
              $("#modal_panel").modal();
              
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
  
  window.onload=function(){
	    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
	};
</script>
 
</head> 
<body>
  <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog" data-backdrop="static">
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
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick="window.close();">Close</button>
        </div>
      </div>
      
    </div>
  </div> <!-- Modal 알림창 종료 -->


  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./send_mail.do'>
               
      <!-- 테스트를 위하여 회원번호, 카테고리그룹 번호를 지정 -->
      <div class="form-group">   
        <label class="col-md-1 control-label">제목</label>
        
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='subject' id='subject' required="required" style='width: 80%;'>
          <button class="btn btn-success" type="button" onclick="send_mail();">메일 보내기</button>
          <button class="btn btn-success" type="button" onclick="window.close();">취소[닫기]</button>
        </div>
      </div>   
      <div class="form-group" style='margin-bottom: 20px;'>   
        <label class="col-md-1 control-label">내용</label>
        <div class="col-md-11">
          <textarea id='content' class="form-control input-lg" name='content' rows='10' style='width: 80%; height: 600px;'></textarea>
        </div>
      </div>
 
      <DIV class="form-group" style='width: 80%; margin: 20px auto;'>
        
      </DIV>
      
    </FORM>
  </DIV>
 
</body>
 
</html> 