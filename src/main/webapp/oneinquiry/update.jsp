<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>Resort world</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
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
<c:set var="memno" value="${oneinquiryVO.memno }" />
<c:set var="iqynum" value="${oneinquiryVO.iqynum }" />
<jsp:include page="/menu/mypage_top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <a href='../mypage/mypage_main.jsp'>마이페이지</a> > 
    <A href='./oneinquiry_list.do?memno=${oneinquiryVO.memno }'>1대1 문의</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <%-- <span class='menu_divide' >│</span>
    <A href='./create.do?categrpno=${categrpVO.categrpno }&memberno=1'>등록</A> --%>
  </ASIDE> 
 
  <div class='menu_line'></div>
  <FORM name='frm' method='POST' action='./update.do' 
            enctype="multipart/form-data" class="form-horizontal">
      <input type='hidden' name='memno' value='${memno }'>
      <input type='hidden' name='iqynum' value='${iqynum }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='text' class="form-control input-lg" name='title' value='${oneinquiryVO.title}' required="required" style='width: 100%;'>
        </div>
      </div>   
      <div class="form-group">   
        <div class="col-md-12">
          <textarea class="form-control input-lg" name='content' rows='10'>${oneinquiryVO.content}</textarea>
        </div>
      </div>
      
      <%-- <div class="form-group">   
        <label class="col-md-1 control-label"><span style='font-size: 0.99em;'>검색어</span></label>
        <div class="col-md-11">
          <input type='text' class="form-control input-lg" name='word' value='${oneinquiryVO.word }' placeholder="검색어">
        </div>
      </div> --%>
      <div class="form-group">   
        <div class="col-md-12">
          <input type='file' class="form-control input-lg" name='fnamesMF'  placeholder="파일 선택" multiple="multiple">
        </div>
      </div>
      
      <DIV style='text-align: right;'>
        <button type="submit" class='btn btn-default'>수정</button>
        <button type="button" onclick="history.back();" class='btn btn-default'>취소</button>
      </DIV>
  </FORM>
 
  </div>    <!-- container 종료 -->
</div>
</div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>