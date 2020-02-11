<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

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
<script type="text/javascript">
  function panel_img(file) {
    var tag = "";
    tag   = "<A href=\"javascript: $('#attachfile_panel').hide();\">";
    tag += "  <IMG src='../attachfile/storage/" + file + "' style='width: 100%;'>"; 
    tag += "</A>";
    
    $('#attachfile_panel').html(tag);
    $('#attachfile_panel').show();
  }
</script>
</head>

<body>
<c:set var="noticeno" value="${noticeVO.noticeno}" />

<jsp:include page="/menu/top.jsp" flush='false' />
  <DIV class='title_line'>공지사항</DIV> 
  <ASIDE style='float: left;'>
    <A href=''>공지사항</A> > 
    ${noticeVO.noticetitle }
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span> 
    <A href='./list.do?noticeno=${noticeno }'>목록</A>
    <span class='menu_divide' > | </span> 
    <a href="../attachfile/create.do?noticeno=${noticeno}">첨부 파일 등록</A>
    <span class='menu_divide' > | </span> 
    <a href="./file_delete.do?noticeno=${noticeno}">첨부 파일 삭제</A>
    <span class='menu_divide' > | </span>
    <A href='./update.do?noticeno=${noticeno }'>수정</A>
    <span class='menu_divide' > | </span> 
    <A href='./delete.do?noticeno=${noticeno }'>삭제</A>
    
  </ASIDE> 
  
  <div class='menu_line'></div>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="noticeno" value="${noticeno}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span class="glyphicon glyphicon-list-alt"></span> 
            <span>${noticeVO.noticetitle}</span>
            <span>${noticeVO.rdate.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <DIV id='attachfile_panel' style="width: 80%; margin: 0px auto;"></DIV> <!-- 원본 이미지 출력 -->
          </li>
          <li class="li_none" style='text-align: center;'>
            <c:forEach var="attachfileVO" items="${attachfile_list }">
              <c:set var="thumb" value="${attachfileVO.thumb.toLowerCase() }" />
              <c:choose>
                <c:when test="${thumb.endsWith('jpg') || thumb.endsWith('png') || thumb.endsWith('gif')}">
                  <A href="javascript:panel_img('${attachfileVO.fname }')"> 
                   <IMG src='../attachfile/storage/${thumb }' style='margin-top: 2px;'>
                  </A>
                </c:when>
              </c:choose>
            </c:forEach>
          </li>
          
          <li class="li_none">
            <DIV>${noticeVO.noticecont }</DIV>
          </li>
          <li class="li_none">
            
          </li>
          <li class="li_none">
          </li>                    
        </ul>
      </fieldset>
  </FORM>

<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>
  