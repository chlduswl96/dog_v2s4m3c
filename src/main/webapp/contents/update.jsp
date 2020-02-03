<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>상품 등록</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript">
$(function(){
  CKEDITOR.replace('contents');  // <TEXTAREA>태그 id 값
});


function repository_select(){
  var tag_name = document.getElementById('categroup');
  var selectValue = tag_name.options[tag_name.selectedIndex].value;
  
  if(selectValue != '0'){
    $('#repositoy').empty()
    var obj =  {
        url : './repository_select.do',
        type : 'get',
        cache: false,
        async : true,
        dataType : 'json',
        data : 'categrpno=' + selectValue,
        
        success : function(rdata) {
          
          var repositoy_select = rdata.repositoy_select;
          console.log(repositoy_select);
          
          if(repositoy_select.length > 0){
            for(var index in repositoy_select){
              $('#repositoy').append("<option value='"+repositoy_select[index].repositoryno+"'>"+repositoy_select[index].name+"</option>");
            }
          }else{
            $('#repositoy').append("<option>없음</option>");
          }
        },
        
        error : function(request, status, error) { // callback 함수
          var msg = 'ERROR<br><br>';
          msg += '<strong>request.status</strong><br>' + request.status
              + '<hr>';
          msg += '<strong>error</strong><br>' + error + '<hr>';
          console.log(msg);
        }
      }
      $.ajax(obj);
  }else{
    $('#repositoy').empty();
  }
 
}

</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <a href="../categrp/list.do">상품</a> > 
    <a href="./list.do">상품 수정</a>
  </ASIDE>
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div style='width: 100%;'>
    <form action="./update.do" method="post">
      <input type="hidden" value="${contentsVO.productno}" name="productno">
      <!-- 카테고리 -->
      <span class="badge">카테고리 선택 :</span>     
      <select name="categrpno" id='categroup' onchange="repository_select()" class="input-sm">  
          <option>선택</option>
      <c:forEach var="vo" items="${select_tag}">
          <option value="${vo.categrpno}" ${contentsVO.categrpno == vo.categrpno ? "selected='selected'" : ''}>${vo.name}(${vo.categrpno})</option>
      </c:forEach>
      </select>
      <br>
      <!-- 상품 재고 -->
      <div style="margin-bottom: 10px;">
        <span class="badge">재고 선택 :</span> <select name=repositoryno id='repositoy' class="input-sm"></select><br>
      </div>
      <div style="margin-bottom: 10px;">
        <span class="badge">배송비 :</span> <input type="number"  value="${contentsVO.deliveryCharge}" name="deliveryCharge" style="width: 8%;" class="input-sm">
      </div>      
      <div style="margin-bottom: 10px;">
        <span class="badge">제목 :</span> <input type="text" value="${contentsVO.title}"  name="title" style="width: 80%;" class="input-sm">
      </div>
      <div style="margin-bottom: 10px;">
        <span class="badge">검색어 :</span> <input type="text"  value="${contentsVO.keyword}" name="keyword" class="input-sm"><br>
      </div>
      <div style="margin-bottom: 10px;">
      <span class="badge">등록직원 :</span> <input type="text" value="${contentsVO.manager}" name="manager" class="input-sm" value="dnr14" readonly="readonly"><br>
      </div>
      <div style="margin-bottom: 10px;">
      </div>
        <textarea class="form-control input-lg" name='contents' id='contents' rows='10' >${contentsVO.contents}</textarea>
      <div style="margin-top: 10px; text-align: center;">
        <button type="submit" class="btn btn-primary">등록</button>
        <button type="button" class="btn btn-primary">취소</button>
      </div>
    </form>
  </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    