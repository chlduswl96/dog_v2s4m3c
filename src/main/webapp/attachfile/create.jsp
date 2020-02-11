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
 
</head> 
 
<body>
<c:set var="memno" value="${oneinquiryVO.memno }" />
<c:set var="iqynum" value="${oneinquiryVO.iqynum}" />
 
<jsp:include page="/menu/top.jsp" flush='false' />
  <div style='width: 70%; margin: 0px auto;'>   <!-- container 시작 -->
  <ASIDE style='float: left;'>
    <a href='../mypage/mypage_main.jsp'>마이페이지</a> > 
    <A href='../oneinquiry/oneinquiry_list.do?memno=${oneinquiryVO.memno }'>1대1 문의</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='../oneinquiry/oneinquiry_list.do?memno=${oneinquiryVO.memno }'>목록</A>

    <c:if test="${sessionScope.id ne null}">
      <span class='menu_divide' >│</span> 
      <A href='./update.do'>수정</A>
      <span class='menu_divide' >│</span> 
      <A href='./delete.do'>삭제</A>
    </c:if>
    
  </ASIDE> 
 
  <div class='menu_line'></div>
  <DIV style='width: 100%;'>
    <FORM name='frm' method='POST' action='./create.do' 
               enctype="multipart/form-data" class="form-horizontal">
               
      <!-- FK categrpno 지정 -->
      <input type='hidden' name='memno' id='memno' value='${param.memno }'>
      <input type='hidden' name='iqynum' id='iqynum' value='${param.iqynum }'>
      
      <div class="form-group">   
        <div class="col-md-12">
          <input type='file' class="form-control input-lg" name='fnamesMF'  
                     value='' placeholder="파일 선택" multiple="multiple">
        </div>
      </div>

      <DIV class='content_bottom_menu'>
        <button type="submit" class="btn btn-default">파일 전송</button>
        <button type="button" 
                    onclick="location.href='../oneinquiry/read.do?iqynum=${param.iqynum}'" 
                    class="btn btn-default">취소</button>
      </DIV>
       
    </FORM>
  </DIV>

  </div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  