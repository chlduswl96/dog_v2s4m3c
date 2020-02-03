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
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head> 

<body>
  <DIV class='title_line'>재고 수정</DIV>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM method='POST' action='./update.do'>
      <c:set var="vo" value="${repositoryVO}"/>
      <input type="hidden" value="${vo.repositoryno}" name="repositoryno">
      <!--
        재고 이름
        등록자
        갯수
        카테고리    
        --> 
      <div style="text-align: left; margin: 0 auto; width: 50%;" >
        <div>
         <label class='label label-primary'>재고 이름</label>
         <input type='text' name='name' required="required" value="${vo.name }" class='input-sm'>
        </div>
        
        <div>
          <label class='label label-primary'>등록자</label>
          <input type='text' name='manager' value='dnr14' readonly="readonly" class='input-sm'>
        </div>
      
        <div>
          <label class='label label-primary'>갯수</label>
          <input type="number" name='cnt' required="required" value="${vo.cnt }" class='input-sm'>
        </div>  
      
        <div>
          <label class='label label-primary'>카테고리</label>
          <select name='categrpno' class='input-sm'>
            <c:forEach var="categrpVO" items="${selectList}">
              <option value='${categrpVO.categrpno}' ${categrpVO.categrpno == vo.categrpno ? "selected='selected'" : ''}>${categrpVO.name}</option>
            </c:forEach>
          </select>
        </div>  
        
        <div>
          <label class='label label-primary'>가격</label>
          <input type="number" name='price' required="required" value="${vo.price }" class='input-sm'>
        </div>
      </div>
      
      <div style="text-align: center; margin-top: 10px;">
        <button type="submit" class="btn btn-danger">재고 수정</button>
        <button type="button" onclick='window.close();' class="btn btn-danger">수정 취소</button>
      </div>
    </FORM>
  </DIV>
</body>
 
</html> 
 