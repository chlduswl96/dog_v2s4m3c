<%@ page contentType="text/html; charset=UTF-8"%>
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
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <A href='../categrp/list.do'>카테고리 그룹</A> > 
    <A href='./list.do'>모든 이미지 파일</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
<!--     <span class='menu_divide' > | </span> -->

  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 60%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
      </colgroup>
      <%-- table 컬럼 --%>
      <thead>
        <tr>
          <th style='text-align: center;'>글번호</th>
          <th style='text-align: center;'>파일</th>
          <th style='text-align: center;'>등록일</th>
          <c:if test="${sessionScope.id != null}">
            <th style='text-align: center;'>기타</th>
          </c:if>
        </tr>
      
      </thead>
      
      <%-- table 내용 --%>
      <tbody>
        <c:forEach var="attachfileVO" items="${list }">
          <c:set var="contentsno" value="${attachfileVO.contentsno }" />
          <c:set var="fname" value="${attachfileVO.fname.toLowerCase() }" />
          
          <tr> 
            <td style='text-align: center; vertical-align: middle;'>${contentsno}</td>
            <td style='vertical-align: middle;'>
              <c:choose>
                <c:when test="${fname.endsWith('jpg') || fname.endsWith('png') || fname.endsWith('gif')}">
                  <IMG src="./storage/${attachfileVO.thumb }">
                </c:when>
                <c:otherwise>
                  ${attachfileVO.fname}
                </c:otherwise>
              </c:choose>
            </td> 
            <td style='text-align: center; vertical-align: middle;'>${attachfileVO.rdate.substring(0, 10)}</td>
            <c:if test="${sessionScope.id != null}">
              <td style='text-align: center; vertical-align: middle;'>
                <a href="./delete.do?attachfileno=${attachfileVO.attachfileno}"><img src="./images/delete.png" title="삭제"  border='0' /></a>
              </td>
            </c:if>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <br><br>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 
  