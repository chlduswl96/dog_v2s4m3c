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

<script type="text/javascript">
$(document).ready(function(){
  $("#thum_img").on('change',thumFileSelect);
  $("#input_img").on('change',handleImgFileSelect);
});

var sel_files = [];


/* 썸네일 */
function thumFileSelect(e){
  var files = e.target.files;
  var filesArray = Array.prototype.slice.call(files);
  filesArray.forEach(function(f){
    if(!f.type.match("image.*")){
      alert("확장자는 이미지 확장자만 가능합니다.");
      return;
    }      
    sel_files.push(f);
    
    var reader = new FileReader();
    reader.onload = function(e){
      $("#thum_view").attr("src",e.target.result);
    }
    reader.readAsDataURL(f);
 });
  
}
/* 썸네일 */

/* 이미지 추가 */
function handleImgFileSelect(e){
  var server_images = Number($("#images_count").val());
  var files = e.target.files;
  
  var filetotal = $("#images_view").children().length;
  var total = server_images + filetotal;
  
  if(total  > 4 || files.length > 5){
    alert("최대 5개만 가능합니다.");
    $("#input_img").val("");
    return;
  }
 
  var filesArray = Array.prototype.slice.call(files);
  filesArray.forEach(function(f){
     if(!f.type.match("image.*")){
       alert("확장자는 이미지 확장자만 가능합니다.");
       return;
     }      
     
     sel_files.push(f);
     
     var reader = new FileReader();
     reader.onload = function(e){
       var tag ="<img src='"+ e.target.result +"' style='width:150px;height:150px; margin-left:10px;'>";
       $("#images_view").append(tag);
     }
     reader.readAsDataURL(f);
  });
  
}
/* 이미지 추가 */


/* 이지지 삭제 */
function images_delete(e){
  var last_index = e.target.src.split("/").length;
  var array = e.target.src.split("/");
  var image_name = array[last_index-1];
  
  var obj =  {
      url : '/team6/contents/images_delete.do',
      type : 'get',
      cache: false,
      async : true,
      dataType : 'json',
      data : 'fupname=' + image_name +"&productno=" + ${productno},
      success : function(rdata) {
        var images_count = rdata.images_count;
        $("#images_count").val(images_count);
        e.target.remove();
      },
      
      error : function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>' + request.status
            + '<hr>';
        msg += '<strong>error</strong><br>' + error + '<hr>';
      }
    }
    $.ajax(obj);
}
/* 썸네일 삭제 */
  /* function thum_delete(e){
  var last_index = e.target.src.split("/").length;
  var array = e.target.src.split("/");
  var thum_name = array[last_index-1];
  
  var obj =  {
      url : '/team6/contents/thum_delete.do',
      type : 'get',
      cache: false,
      async : true,
      dataType : 'json',
      data : 'thumb=' + thum_name +"&productno=" + ${productno},
      success : function(rdata) {
        console.log(rdata);
        e.target.remove();
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
} */
/* 썸네일 삭제 */

</script>

</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <a href="../categrp/list.do">상품</a> > 
    <a href="./list.do">상품 이미지 수정</a>
  </ASIDE>
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <form action="./file_update.do" method="post" enctype="multipart/form-data">
  
    <div class="row">
    <!-- 기존에 이미지 -->
	    <div class="col-sm-6" style="border-right: 1px solid;">
		    <div>이미지(클릭을 하면 삭제)</div>
		    <div style="margin: 10px 0 10px 0;">
		    <c:forEach var="images" items="${image_list}">
		      <c:if test="${images.thumb != null}">
		        <c:set value="${images.thumb}" var="thumb"/>
		        <img src="./image/noimage.png" style="width: 100px; height: 100px;">
		      </c:if>
		      <c:if test="${images.thumb == null}">
		        <img src="./storage/${images.fupname}" style="width: 100px; height: 100px; cursor: pointer;" 
		        onclick='images_delete(event)'/>
		      </c:if>
		    </c:forEach>
		    </div>
	    </div>
	    <div class="col-sm-6">
	      <div>새로 추가 할 이미지</div>
	      <div id="images_view"></div>
	      <input type="file" id="input_img" multiple="multiple" name="fnamesMF">
	    </div>
  </div>
  
  
  <div class="row">
    <!-- 기존에 썸네일 -->
    <div class="col-sm-6" style="border-right: 1px solid;">
      <div>썸네일</div>
      <div style="margin: 10px 0 10px 0;">
        <!-- 썸네일 -->
        <c:if test="${thumb != null }">
		   <%--    <img src="./storage/${thumb}" style="width: 100px; height: 100px; cursor: pointer;" onclick='thum_delete(event)'/> --%>
		      <img src="./storage/${thumb}" style="width: 100px; height: 100px;"/>
        </c:if>
        <c:if test="${thumb == null }">
          <img src="./image/noimage.png" style="width: 100px; height: 100px;"/>
        </c:if>
      </div>
    </div>
    <div class="col-sm-6">
      새로 추가할 썸네일
      <div>
        <img src="./image/noimage.png" id="thum_view" style="width: 100px; height: 100px;"/>
      </div>
      <input type="file" id="thum_img" name="fthum">
    </div>
  </div>
  <DIV class='menu_line' style='clear: both;'></DIV>
  
  <div>
    <button type="submit" class="btn btn-primary">이미지 수정</button>
  </div>
  <input type="hidden" value="${productno}"  name="productno">
  <input type="hidden" value="${images_count}" id="images_count">
  </form>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    