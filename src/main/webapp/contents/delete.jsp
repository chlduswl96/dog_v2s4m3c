<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
  content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>상품 등록</title>

<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script
  src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
  href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script
  src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>



<style type="text/css">
input:focus {outline:none;}
input{
  border:none;
}
</style> 

<body>
  <div style='width: 100%;'>
    <c:set var="vo" value="${contentsVO}" />
    <form action="./delete.do" method="post">
      <input type="hidden" value="${vo.categrpno}" name="categrpno">
      <div style="margin: 0 auto; width: 50%; padding-top: 20px;">
        상품을 삭제하면 복구 할 수 없습니다.<br>
        그래도 삭제하시겠습니까???
        <div style="margin-top:15px;">
          <!-- 상품 번호 -->
          <label class='label label-danger'>상품 번호 : </label> <input class='input-sm' type="text" value="${vo.productno}" name="productno">
        </div>
        <div>
          <!-- 상품 제목 -->
          <label class='label label-danger'>상품 제목 : </label>
          <input class='input-sm' type="text" value='${vo.title}' name='title'>
        </div>
        <div>
          <!-- 상품 가격 -->
          <label class='label label-danger'>상품 가격 : </label>
          <input class='input-sm' type="text" value='${vo.repositoryprice }' name='repositoryprice'>
        </div>
        <div>
          <!-- 상품 갯수 -->
          <label class='label label-danger'>상품 갯수 : </label>
          <input class='input-sm' type="text" value='${vo.repositorycnt }' name='repositorycnt'>
        </div>
        <div style="text-align: center; margin-top: 30px;">
          <button type="submit" class='btn btn-primary'>삭제</button>
          <button type="button" onclick='window.close();' class='btn btn-primary'>취소</button>
        </div>
      </div>
    </form>
  </div>
</body>

</html>
