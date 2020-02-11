<%@ page contentType="text/html; charset=UTF-8" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>멍멍</title>
<link href="./css/style.css" rel='Stylesheet' type='text/css'>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />
 
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<!-- Bootstrap -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
    
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <!-- <DIV style='width: 70%; background-color: #EEEEFF; margin: 20px auto; font-size: 24px; text-align: center;'>
    강아지 용품 사이트
  </DIV> -->
  
  <img src='./css/images/dog_banner.jpg' style='width: 100%; height: 100%;  margin: 0px auto;'> 
  <!-- </DIV> 
  
  <div style='width: 70%; margin: 0px auto;'> -->
    <span>신상품</span>
    <div class="new_item">
      <table bordercolor='#dddddd' border="1" style="width: 100%; height: 100%;">
        <tr>
          <td style="width: 25%; height: 100%;">
            <div style='text-align:center;'>
              <div style='margin-bottom: 10px;'><img src='./images/feed01.jpg' style='width: 70%; height: 120px'></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>사료1</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'> 9,999\</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>키워드 : 사료</span></div>
            </div>
          </td>
          <td style="width: 25%; height: 100%;">
            <div style='text-align:center;'>
              <div style='margin-bottom: 10px;'><img src='./images/feed02.jpg' style='width: 70%; height: 120px'></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>사료2</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'> 9,999\</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>키워드 : 사료</span></div>
            </div>
          </td>
          <td style="width: 25%; height: 100%;">
            <div style='text-align:center;'>
              <div style='margin-bottom: 10px;'><img src='./images/feed03.jpg' style='width: 70%; height: 120px'></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>사료3</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'> 9,999\</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>키워드 : 사료</span></div>
            </div>
          </td>
          <td style="width: 25%; height: 100%;">
            <div style='text-align:center;'>
              <div style='margin-bottom: 10px;'><img src='./images/feed04.jpg' style='width: 70%; height: 120px'></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>사료4</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'> 9,999\</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>키워드 : 사료</span></div>
            </div>
          </td>
        </tr>
      </table>
    </div>
    
    <span>베스트 상품</span>
    <div class="best_item">
      <table bordercolor='#dddddd' border="1" style="width: 100%; height: 100%;">
        <tr>
          <td style="width: 25%; height: 100%;">
            <div style='text-align:center;'>
              <div style='margin-bottom: 10px;'><img src='./images/feed01.jpg' style='width: 70%; height: 120px'></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>사료1</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'> 9,999\</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>키워드 : 사료</span></div>
            </div>
          </td>
          <td style="width: 25%; height: 100%;">
            <div style='text-align:center;'>
              <div style='margin-bottom: 10px;'><img src='./images/feed02.jpg' style='width: 70%; height: 120px'></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>사료2</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'> 9,999\</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>키워드 : 사료</span></div>
            </div>
          </td>
          <td style="width: 25%; height: 100%;">
            <div style='text-align:center;'>
              <div style='margin-bottom: 10px;'><img src='./images/feed03.jpg' style='width: 70%; height: 120px'></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>사료3</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'> 9,999\</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>키워드 : 사료</span></div>
            </div>
          </td>
          <td style="width: 25%; height: 100%;">
            <div style='text-align:center;'>
              <div style='margin-bottom: 10px;'><img src='./images/feed04.jpg' style='width: 70%; height: 120px'></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>사료4</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'> 9,999\</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>키워드 : 사료</span></div>
            </div>
          </td>
        </tr>
      </table>
    </div>
    <span>베스트 상품</span>
    <div class="best_item">
      <table bordercolor='#dddddd' border="1" style="width: 100%; height: 100%;">
        <tr>
          <td style="width: 25%; height: 100%;">
            <div style='text-align:center;'>
              <div style='margin-bottom: 10px;'><img src='./images/feed01.jpg' style='width: 70%; height: 120px'></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>사료1</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'> 9,999\</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>키워드 : 사료</span></div>
            </div>
          </td>
          <td style="width: 25%; height: 100%;">
            <div style='text-align:center;'>
              <div style='margin-bottom: 10px;'><img src='./images/feed02.jpg' style='width: 70%; height: 120px'></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>사료2</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'> 9,999\</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>키워드 : 사료</span></div>
            </div>
          </td>
          <td style="width: 25%; height: 100%;">
            <div style='text-align:center;'>
              <div style='margin-bottom: 10px;'><img src='./images/feed03.jpg' style='width: 70%; height: 120px'></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>사료3</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'> 9,999\</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>키워드 : 사료</span></div>
            </div>
          </td>
          <td style="width: 25%; height: 100%;">
            <div style='text-align:center;'>
              <div style='margin-bottom: 10px;'><img src='./images/feed04.jpg' style='width: 70%; height: 120px'></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>사료4</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'> 9,999\</span></div>
              <div style='margin-bottom: 10px;'><span style='margin: 10px;'>키워드 : 사료</span></div>
            </div>
          </td>
        </tr>
      </table>
    </div>
  </div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
 
</body>
</html>