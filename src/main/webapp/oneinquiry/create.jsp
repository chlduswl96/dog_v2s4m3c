<%@ page contentType="text/html; charset=UTF-8" %>
 
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
  window.onload=function(){
    CKEDITOR.replace('content');  // <TEXTAREA>태그 id 값
  };
</script>
 
</head> 

<body>
<jsp:include page="/menu/mypage_top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <a href='../mypage/mypage_main.jsp'>마이페이지</a> > 
    <A href='./oneinquiry_list.do?memno=${param.memno }'>1대1 문의</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href='./oneinquiry_list.do?memno=${param.memno }'>목록</A>
<%--    <span class='menu_divide' >│</span>
    <A href='./update.do?memno=${memno }&iqynum=${iqynum}'>수정</A>
    <span class='menu_divide' >│</span>
    <A href='../attachfile/create.do?memno=${memno }&iqynum=${iqynum}''>첨부 파일 등록</A>
    <span class='menu_divide' >│</span>
     <A href='./delete.do?memno=${memno }&iqynum=${iqynum}'>삭제</A> --%>
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' 
              enctype="multipart/form-data" class="form-horizontal">
               
      <!-- 테스트를 위하여 회원번호를 1번 지정 -->
      <input type='hidden' name='memno' id='memno' value='${param.memno }'>
      <%-- <input type='hidden' name='iqynum' id='iqynum' value='${oneinquiryVO.iqynum }'> --%>

      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control input-lg" name='title' id='title' placeholder="제목" value='' required="required" style='width: 100%;'>
        </div>
      </div>   
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control input-lg" name='content' id='content' placeholder="내용" rows='10'></textarea>
        </div>
      </div>
      <!-- <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control input-lg" name='word' id='word' placeholder="검색어" value=''> 
        </div>
      </div> -->
      <div class="form-group">   
        <div class="col-md-12">
          <input type='file' class="form-control input-lg" name='fnamesMF'  placeholder="파일 선택" multiple="multiple">
        </div>
      </div>
 
      <DIV class= 'content_bottom_menu'>
        <button type="submit" class="btn btn-default">등록</button>
        <button type="button" onclick="history.back();" class='btn btn-default'>취소</button>
      </DIV>
      
    </FORM>
  </DIV>
 
  </div>    <!-- container 종료 -->
</div>
</div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>