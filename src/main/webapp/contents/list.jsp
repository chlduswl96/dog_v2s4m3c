<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>모든 상품</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<style type="text/css">
.image:hover{
  opacity:  0.4;
}
</style>

<script type="text/javascript">
 function delete_open(productno,categrpno){
   var url= './delete.do?productno=' + productno;
   var win = window.open(url,'상품 삭제', 'width=600px, height=400px');
   
   var x = (screen.width - 600) / 2;
   var y = (screen.height - 400) / 2;
   
   win.moveTo(x, y); // 지정된 좌표로 이동    
 }
 
function border(e){
   e.currentTarget.style.background = "#ffe6e6";
 }
 function bordernone(e){
   e.currentTarget.style.background = "none";
 }
</script>

</head>
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <a href="../categrp/list.do">상품 그룹</a> > 
    <a href="./list_all.do?PageNumber=&col=&categrpno=&search=&keyword=">상품 리스트</a>
  </ASIDE>
  <ASIDE style='float: right;'>
    <a href="./create.do">상품 등록</a>
   <!--  <span class='menu_divide'>│</span> -->
  </ASIDE> 
  <DIV class='menu_line' style='clear: both;'></DIV>
        
        <div class="row">
        	<div class="col-sm-3">
        		<a href="./list_all.do?PageNumber=&col=title&categrpno=${categrpno }&search=${search}&keyword=" ><span  style="font-size: 0.8em; font-weight: 600;">제목순</span></a>
        		<a href="./list_all.do?PageNumber=&col=likey&categrpno=${categrpno  }&search=${search}&keyword=" ><span  style="font-size: 0.8em; font-weight: 600;">인기순</span></a>
        		<a href="./list_all.do?PageNumber=&col=cnt&categrpno=${categrpno  }&search=${search}&keyword=" ><span  style="font-size: 0.8em; font-weight: 600;">조회순</span></a>
        	</div>
        	<div class="col-sm-9">
        		<form name="frm" action="./list_all.do" method="get">
        		<input type="hidden" value="" name="PageNumber">
        		<input type="hidden" value="${col }" name="col">
        		<input type="hidden" value="${categrpno }" name="categrpno">
			          <div class="form-group" style="text-align: left;">
				           <input type="search" placeholder="원하는 제품을 찾아보세요" class="form-control" name="search" style="width: 50%; display: inline;">
				           <button type="submit" class="btn btn-danger">찾기</button>
			          </div>
        		<input type="hidden" value="" name="keyword">
    		    </form>
        	</div>
        </div>
        
      <div class="row" style="text-align: center;">
      <c:forEach items="${list}" var="vo">
		    <div class="well" style="text-align: center; cursor:pointer; width: 17%; display: inline-block;" onmouseover="border(event)" onmouseout="bordernone(event)" >
	          <div onclick="location.href='./read.do?productno=${vo.productno}'">
				      <div>
				       <c:if test="${vo.view_thumb != null}">
				        <img src="./storage/${vo.view_thumb }" style="width: 100%; height: 300px;"  class="image"/>
				       </c:if>
			         <c:if test="${vo.view_thumb == null}">
	              <img src="./image/noimage.png" style="width: 100%; height: 300px;"  class="image"/>
	              
	             </c:if>
				      </div>
				      <div style="margin-top: 15px;font-size: 2em;text-overflow: ellipsis; overflow: hidden;width: 100%;height: 70px;white-space: nowrap;">${vo.title }</div>
		          <h2 style="font-weight: 500;color: black;">
	  			      <fmt:formatNumber  value="${vo.price}" pattern="#,###.##" />원
		          </h2>		       
				      <div style="font-size: 0.8em;">
	            조회수 : &nbsp<fmt:formatNumber  value="${vo.cnt}" pattern="#,###.##" />
	            </div>
	            <div>
		             <span style="font-size: 0.8em">키워드 : </span>
		             <a href="./list_all.do?PageNumber=1&col=${col}&categrpno=${categrpno }&search=${search}&keyword=${vo.keyword}" style="font-size: 0.8em;">
		             #${vo.keyword }
		             </a>
	            </div>
	          </div>
		      <div>
		          <a href="./update.do?productno=${vo.productno}"><img src="../categrp/images/update.png" title="수정" border='0'/></a>
	            <a href="javascript:delete_open(${vo.productno});"><img src="../categrp/images/delete.png" title="삭제"  border='0'/></a>
		      </div>
    	</div>
      </c:forEach>
      </div>
      <div class="row">
      	<div class="col-sm-12" id="button_create" style="text-align: center;">
      		
      	</div>
      </div>
 
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 <script type="text/javascript">
 button();
 	function button(){
 		var page_cnt = 5;
 		
		var total_count = ${total_count}; /* 총 게시물 갯수 */
		var total_button = Math.ceil(total_count / page_cnt); /* 총 생성 버튼 갯수  */
		var PageNumber = ${PageNumber}; /* 현재 페이지 */

		var button_end = Math.ceil(PageNumber/ 5) * 5; /*  마지막 생성될 버튼 번호 */
		var button_start =  (button_end - 5) + 1;  /*  처음에 생성될 버튼 번호 */
		
		if(button_end  > total_button){
			button_end = total_button;
		}
		
		if(button_start <= 0) {
			button_start = 1;
		}
		
		var prev = button_start == 1 ? false : true;
	    var next = button_end * page_cnt < total_count ? true: false;
	    /* 끝번호 * 뿌려줄 페이지 갯수 < 총 갯수 */
		
		if(prev){
			var tag = "";
			tag += "<a href='./list_all.do?PageNumber="+(button_start - 1)+"&col=${col}&categrpno=${categrpno}&search=${search}&keyword=${keyword}'>";	
			tag += "<span class='label label-danger' style='margin:5px;'>";	
			tag += "<";	
			tag += "</span>";	
			tag += "</a>";	
			$("#button_create").append(tag);
		}
		
		for(var i = button_start; i<= button_end; i++){
			var tag = "";
			tag += "<a href='./list_all.do?PageNumber="+i+"&col=${col}&categrpno=${categrpno}&search=${search}&keyword=${keyword}'>";
			tag += "<span class='label label-danger' style='margin:5px;'>";
			tag += i;
			tag += "</span></a>";
			$("#button_create").append(tag);
		}

		if(next && button_end > 0){
			var tag="";
			tag += "<a href='./list_all.do?PageNumber="+(button_end + 1)+"&col=${col}&categrpno=${categrpno}&search=${search}&keyword=${keyword}'>";	
			tag += "<span class='label label-danger' style='margin:5px;'>";	
			tag += ">";	
			tag += "</span>";	
			tag += "</a>";	
			$("#button_create").append(tag);
		}
 	}
 </script>
 
</html>
    