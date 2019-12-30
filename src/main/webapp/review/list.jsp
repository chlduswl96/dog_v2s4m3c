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
<DIV class='title_line'>상품후기 모아보기</DIV>
  <ASIDE style='float: left;'>
    <A href=''>상품후기 모아보기</A> 
  </ASIDE>
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' > | </span>
    <A href='./create.do'>등록</A>
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <div style=" margin: 0px auto;">
      <div> 
        <table  style='width: 100%; '>
           <%-- table 내용 --%>
            <tbody>
              <c:forEach var="reviewVO" items="${list }">
                <tr> 
                  <td style="width: 25%;  table-layout: auto;">
                      <img src="./images/product1.png" style="width:100%;">
                  </td>
                  <td style="width: 75%; height: 100%; table-layout: auto;">
                      <span class=>
                        제목 : ${reviewVO.reviewtitle }.
                      </span>
                         (${reviewVO.reviewdate })
                      <div class='menu_line' style='clear: both;'></div>
                      <div>
                        
                      </div>
                      <div>
                         내용 : ${reviewVO.reviewcont}
                      </div><br><br>
                  </td>   
                </tr>
              </c:forEach>
            </tbody>
          </table>
      </div>
    </div>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    
 
  