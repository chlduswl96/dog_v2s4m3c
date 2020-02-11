<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>장바구니</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head> 

<script type="text/javascript">
/* 제이쿼리 시작 */
$(document).ready(function(){
	 
	 	/* 장바구니 삭제 기능 시작 */
		$("#showppingbasketDeleteButton").on('click',function(){
			var multiparam= new Array();
			var param = {};
			var product = $(".productno");
			$(".showppingbasketDelete").each(function(index,item){
				if(item.checked == true){
					multiparam.push(product[index].value);
				}
			});
			
			if(multiparam.length == 0){
				alert("체크박스에 체크하세요..");
				return;
			}
			param.multiparam = multiparam;
			console.log(param);
			
			 var obj =  {
				      url : '../showppingbasket/delete.do',
				      type : 'post',
				      cache: false,
				      async : true,
				      dataType : "json",
				      contentType: 'application/json',
				      data :JSON.stringify(param),
				      success : function(rdata) {
				    	  var messege = rdata.messege;
				    	  alert(messege);
				    	  location.reload();
				      },
				      error : function(request, status, error) { // callback 함수
				        var msg = 'ERROR<br><br>';
				        msg += '<strong>request.status</strong><br>' + request.status
				            + '<hr>';
				        msg += '<strong>error</strong><br>' + error + '<hr>';
				        console.log(msg);
				      }
				    }
				    /* 장바구니 ajax 끝 */
				    $.ajax(obj);
			
		});
	 	/* 장바구니 삭제 기능 끝 */
	 	
	 	/* 구매페이지 시작  */
	 	$("#purchase").on('click',function(){
	        location.href="../purchase/purchase.do";
	 	});
	 	/* 구매페이지 끝 */
	 	
	 	
 });
/* 제이쿼리 끝 */
 

</script>



<style>
/*  체크박스 크기 */
input[type=checkbox]
{
  -webkit-transform: scale(2.5); /* Safari and Chrome */
  padding: 5px;
}

/*  이미지 투명도  */
.image:hover{
	 opacity:  0.5;
}
</style>
 
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
 
  <DIV class='title_line'>장바구니 그룹</DIV>
 
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 5%;'/><!-- 상품 번호 -->
    <col style='width: 15%;'/><!-- 상품 이미지  -->
    <col style='width: 35%;'/><!-- 상품 제목 -->
    <col style='width: 10%;'/><!--  상품 갯수 -->
    <col style='width: 10%;'/><!-- 상품 가격 -->
    <col style='width: 20%;'/> <!-- 상품  총 가격  -->
    <col style='width: 5%;'/><!-- 삭제 유무 --> 
  </colgroup>
 
  <thead>  
  <TR>
    <TH class="th_basic">상품<br>번호</TH>
    <TH class="th_basic">이미지</TH>
    <TH class="th_basic">제목</TH>
    <TH class="th_basic">갯수</TH>
    <TH class="th_basic">가격</TH>
    <TH class="th_basic">총 가격</TH>
    <TH class="th_basic">삭제</TH>
  </TR>
  </thead>
  
  <tbody>
  	<c:choose>
  		<c:when test="${list.size() == 0}">
 			<tr>
				<td style="text-align: center;height: 150px; vertical-align: middle;"   colspan='7'>장바구니에 등록된 상품이없습니다.</td>
	      	</tr>
  		</c:when>
  		<c:otherwise>
		  <c:forEach var="ShowppingbasketVO" items="${list}">
		      <tr>
		        <td style="text-align: center;vertical-align: middle;">${ShowppingbasketVO.showppingno}</td>
		        <td style="text-align: center;">
					<a href="${ShowppingbasketVO.uri}">
		        		<img src="../contents/storage/${ShowppingbasketVO.thumb}" style="width: 80%; height: 100px;" class="image"/>
					</a>        
		        </td>
		        <td style="text-align: center;vertical-align: middle;">
		        	<a href="${ShowppingbasketVO.uri}">
		        		${ShowppingbasketVO.title}
		        	</a>
		       	</td>
		        <td style="text-align: center;vertical-align: middle;">${ShowppingbasketVO.cnt}개</td>
		        <c:set value="${ShowppingbasketVO.cnt}" var="cnt"/>
		        <c:set value="${ShowppingbasketVO.price}" var="price"/>
		        <td style="text-align: center;vertical-align: middle;"><fmt:formatNumber  value="${price }" pattern="#,###.##" />원</td>
		        <td style="text-align: center;vertical-align: middle;"><fmt:formatNumber  value="${cnt * price}" pattern="#,###.##" />원</td>
		        <td style="text-align: center;vertical-align: middle;">
					<input type="checkbox" class="showppingbasketDelete">
					<input type="hidden"  value="${ShowppingbasketVO.productno}" class="productno"/>
				</td>
		      </tr>
		  	</c:forEach>	
  		</c:otherwise>
  	</c:choose>
  </tbody>
</TABLE>
	<c:if test="${list.size() !=0 }">
		<div class="row">
			<div class="col-sm-6" style="text-align: left;">
				<button type="button" class="btn btn-primary" id="purchase">구매하기</button>
			</div>
			<div  class="col-sm-6" style="text-align: right;">
				<button type="button" class="btn btn-primary" id="showppingbasketDeleteButton">삭제</button>
			</div>
		</div>
	</c:if>
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 