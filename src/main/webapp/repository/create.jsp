<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
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

<script type="text/javascript">
 function update(repositoryno){
   
   var url = "./update.do?repositoryno=" + repositoryno; 
   var win = window.open(url,"재고 수정","width=800px; height=500px;");
   var x = (screen.width - 800) / 2;
   var y = (screen.height - 500) / 2;
   
   win.moveTo(x, y); // 지정된 좌표로 이동    
 }
 
 function delete_form(repositoryno) {
   var url = "./delete.do?repositoryno=" + repositoryno; 
   var win = window.open(url,"재고 수정","width=800px; height=500px;");
   var x = (screen.width - 800) / 2;
   var y = (screen.height - 500) / 2;
   
   win.moveTo(x, y); // 지정된 좌표로 이동    
}
</script>

<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
 
  <DIV class='title_line'>재고 등록</DIV>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
      <!--
        재고 이름
        등록자
        갯수
        카테고리    
        --> 
      <label>재고 이름</label>
      <input type='text' name='name'  required="required" style='width: 25%;'>
      
      <label>등록자</label>
      <input type='text' name='manager' value='dnr14' style='width: 10%;' readonly="readonly">
      
      <label>갯수</label>
      <input type="number" name='cnt' required="required" style='width: 10%;'>
      
      <label>카테고리</label>
      <select name='categrpno'>
        <c:forEach var="categrpVO" items="${selectList}">
          <option value='${categrpVO.categrpno}'>${categrpVO.name}</option>
        </c:forEach>
      </select>
      <label>가격</label>
      <input type="number" name='price' required="required" style='width: 10%;'>
       
      <button type="submit" id='submit'>재고 등록</button>
    </FORM>
  </DIV>
 
  
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 10%;'/> <!-- 재고번호  -->
    <col style='width: 15%;'/> <!-- 재고이름  -->
    <col style='width: 10%;'/> <!-- 등록자  -->
    <col style='width: 10%;'/> <!-- 카테고리  -->
    <col style='width: 15%;'/> <!-- 갯수  -->    
    <col style='width: 10%;'/> <!-- 가격 -->    
    <col style='width: 20%;'/> <!-- 등록 날짜 -->
    <col style='width: 10%;'/> <!-- 삭제 / 변경 -->
  </colgroup>
 
 
   <!--
    재고 번호
    재고 이름
    등록자
    갯수
    가격
    카테고리 
    날짜   
   --> 
  <thead>  
  <TR>
    <TH class="th_basic">재고 번호</TH>
    <TH class="th_basic">재고 이름</TH>
    <TH class="th_basic">등록자</TH>
    <TH class="th_basic">카테고리</TH>
    <TH class="th_basic">갯수</TH>
    <TH class="th_basic">가격</TH>
    <TH class="th_basic">등록날짜</TH>
    <TH class="th_basic">삭제 / 변경</TH>
  </TR>
  </thead>
  
  <tbody>
      <c:forEach var="repositoryVO" items="${list}">
      <tr>
        <td style="text-align: center;">${repositoryVO.repositoryno}</td>
        <td style="text-align: center;font-weight: 900;">${repositoryVO.name}</td>
        <td style="text-align: center;">${repositoryVO.manager}</td>
        <td style="text-align: center;">${repositoryVO.categrpname}</td>
        <td style="text-align: center;">${repositoryVO.cnt}개</td>
        <td style="text-align: center;">
        <fmt:formatNumber  value="${repositoryVO.price}" pattern="#,###.##" />원
        </td>
        <td style="text-align: center;">${repositoryVO.rdate}</td>
        <td style="text-align: center;">
          <a href="javascript:update(${repositoryVO.repositoryno})"><img src="./images/update.png"></a>
          <a href="javascript:delete_form(${repositoryVO.repositoryno})"><img src="./images/delete.png"></a>
        </td>
      </tr>
      </c:forEach>
  </tbody>
</TABLE>
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 