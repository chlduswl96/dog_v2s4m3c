<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
 
<script> 

var number = 0;
var setnumber = 0;

$(document).ready(function(){
	
	
	/* 장바구니 추가 기능 시작*/
	$("#showppingbarsket").on("click",function(){
		var member_id = $("#memberid").val();
		
		if(member_id == ""){
			alert("로그인을 해야 이용 할 수 있습니다.");
			return;
		}
		
		var product_no = $("#productno").val();
		var product_title = $("#productrepositoryname").val();
		var product_cnt = $("#productcnt").val();
		var uri = "${requestScope['javax.servlet.forward.request_uri']}" +"?" +"${pageContext.request.queryString}";
		
		/* 장바구니 ajax 시작 */
		 var obj =  {
			      url : '../showppingbasket/add.do',
			      type : 'get',
			      cache: false,
			      async : true,
			      dataType : 'json',
			      data :'productno=' + product_no +'&title=' + product_title + '&cnt='+ product_cnt +"&uri=" + uri,
			      
			      success : function(rdata) {
			    	  var messege = rdata.messege;
			    	  alert(messege);
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
	/* 장바구니 추가 기능 끝*/
	
  
  setInterval(function(){
    changeRepresentImage(setnumber);
    setnumber++;
    if(setnumber == number){
      setnumber = 0;
    }
  }, 2000);
  
  var obj =  {
      url : '/dog/productfile/file_read.do',
      type : 'get',
      cache: false,
      async : true,
      dataType : 'json',
      data : 'productno=' + ${contentsVO.productno},
      
      success : function(rdata) {
        if(rdata.file_read.length > 0){
        $("#images").attr("src","./storage/" + rdata.file_read[0].fname);
        number = rdata.file_read.length;
	        for(var index = 0; index < rdata.file_read.length; index++){
	          
	          var tag = "<a href='javascrpt:;' onMouseover='changeRepresentImage("+index+");'>";
	          tag += "<img src='./storage/"+rdata.file_read[index].fname+"' class='images' style='width:20%;height:100px; padding:0 5px 0 5px; border-radius: 20px;'/>";
	          tag += "</a>";
	          $("#view").append(tag);
	        }
        }
      },
       
      error : function(request, status, error) { // callback 함수
        var msg = 'ERROR<br><br>';
        msg += '<strong>request.status</strong><br>' + request.status
            + '<hr>';
        msg += '<strong>error</strong><br>' + error + '<hr>';
        console.log(msg);
      }
    }, 
    $.ajax(obj);  
}); 

function changeRepresentImage(num) {
  var link = $(".images").eq(num).attr("src");
  $("#images").attr("src", link);
  setnumber=num;
}

function modal_view(e){
  $("#modal-img").attr("src",e.currentTarget.src);
}

function sum(e){
	
	var cnt = e.target.value;
	var price = ${contentsVO.repositoryprice};
	if(cnt > 10 ){
		alert("10개 이상 구매 불가능합니다.");
		cnt = 10;
		e.target.value = 10;
	}
	var sum = cnt  * price;
	$("#price").html('');
	$("#price").append(comma(sum));
	
	if(sum < 25000){
		sum += 2500;
		console.log(sum);
	} 
	$("#total_price").html('');
	$("#total_price").append(comma(sum));
	
}
function comma(num){
    var len, point, str; 
       
    num = num + ""; 
    point = num.length % 3 ;
    len = num.length; 
   
    str = num.substring(0, point); 
    while (point < len) { 
        if (str != "") str += ","; 
        str += num.substring(point, point + 3); 
        point += 3; 
    } 
     
    return str;
 
}
function numberWithCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

</script> 
 
<style type="text/css">
input:focus {outline:none;}

</style>
</head>
 
<body>
<jsp:include page="/menu/top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <a href="../categrp/list.do">상품 리스트</a> > 
    <a href="./list.do">상품 상세</a>
  </ASIDE>
  <c:if test="${sessionScope.id_admin ne null }">
    <ASIDE style='float: right; margin-bottom: 10px;'>
      <a href="./images_load.do?productno=${contentsVO.productno}"><span class="label label-primary">썸네일 / 이미지 수정</span></a> |
      <a href="./update.do?productno=${contentsVO.productno}"><span class="label label-primary">상품 수정</span></a> |
      <a href="./delete.do?productno=${contentsVO.productno}"><span class="label label-danger">상품 삭제</span></a> |
    </ASIDE> 
  </c:if>
  
  
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog" style="width: 700px; height: 800px;">
      <div class="modal-content"style="height: 100%;">
        <div class="modal-header" style="border: none;">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        <div class="modal-body">
          <img src="./image/noimage.png" style="width: 100%; height: 700px;" id="modal-img"/>
        </div>
      </div>
    </div>
  </div>
  
  <DIV class='menu_line' style='clear: both;'></DIV>
	    <div style="margin: 30px 0 10px 0;" class="row">
        <!-- 이미지 -->
        <div class="col-sm-6  well">
          <div style="text-align: center; margin-bottom: 10px;">
            <a href="#" data-toggle="modal" data-target="#myModal">
  	          <img src="./image/noimage.png" style="width: 300px; height: 300px; " id="images" onclick="modal_view(event)"/>
            </a>
          </div>
          <div id="view" style="text-align: center;">
          
          </div>
          <div style="margin-top: 10px; text-align: center;">
            <label class="label label-danger">이미지에 마우스를 올려보세요.</label>
          </div>
        </div>
        
        <!-- 구매  -->
        <div class="col-sm-6">
            <div class="col-sm-12" style="margin-bottom: 5px;">
               <h3 style="font-size: 14px;margin: 0px;font-size: inherit;">${contentsVO.title}</h3>
            </div>
            <DIV class='menu_line' style='clear: both;'></DIV>
            <div>
              <div class="row" style="margin-bottom: 5px;">
                <div class="col-sm-3" >
                  <span style="color: #888; font-size:0.9em;">판매가</span>
                </div>
                <div class="col-sm-9">
                  <h3 style="margin: 0px;">
                    <fmt:formatNumber  value="${contentsVO.repositoryprice}" pattern="#,###.##" />원
                  </h3>
                  <input type="hidden" value="${contentsVO.repositoryprice}"/>
                </div>
              </div>
              
              <div class="row" style="margin-bottom: 5px;">
                <div class="col-sm-3" >
                  <span style="color: #888; font-size:0.9em;">구매혜택</span>
                </div>
                <div class="col-sm-9">
                  <span style="color: #888; font-size:0.9em;">
                  <fmt:formatNumber var="expiry" value="${contentsVO.repositoryprice * 0.01}" maxFractionDigits="1" />
                  적립포인트&nbsp${expiry}
                  </span>
                </div>
              </div>
              
              <div class="row" style="margin-bottom: 5px;">
                <div class="col-sm-3" >
                  <span style="color: #888; font-size:0.9em;">재고 갯수</span>
                </div>
                <div class="col-sm-9">
                  <span style="color: #888; font-size:0.9em;">
                   ${contentsVO.repositorycnt }개
                  </span>
                </div>
              </div>
              
              <div class="row" style="margin-bottom: 5px;">
                <div class="col-sm-3" >
                  <span style="color: #888; font-size:0.9em;">카테고리</span>
                </div>
                <div class="col-sm-9">
                  <span style="color: #888; font-size:0.9em;">
                   ${contentsVO.categrpname}
                  </span>
                </div>
              </div>
              
              <div class="row" style="margin-bottom: 5px;">
                <div class="col-sm-3" >
                  <span style="color: #888; font-size:0.9em;">상품명</span>
                </div>
                <div class="col-sm-9">
                  <span style="color: #888; font-size:0.9em;">
                    ${contentsVO.repositoryname}
                  </span>
                </div>
              </div>
              
              <div class="row" style="margin-bottom: 5px;">
                <div class="col-sm-3">
                  <span style="color: #888; font-size:0.9em;">배송비</span>
                </div>
                <div class="col-sm-9">
                   <span style="color: #888; font-size:0.9em;">
                     <fmt:formatNumber  value="${contentsVO.deliveryCharge}" pattern="#,###.##" />원
                   </span>
                </div>
              </div>
            </div>
            <div> 
              <div style="padding: 10px; background: #dbdbdb; margin-top: 5px; border-radius: 20px;">
                <span style="margin-right: 10px; color: black;">${contentsVO.title}</span>
                <input type="number" value="1"  style="border: 1px solid;   border-radius: 5px;width: 45px; padding-left: 5px;"  min="1" max="10" 
                onchange="sum(event)" id="productcnt">
              </div>
              <div style="margin-top: 10px;">
                <div style="text-align: right;">
                  총 상품금액 &nbsp <span id="price">
                   <fmt:formatNumber  value="${contentsVO.repositoryprice}" pattern="#,###.##" /></span>원
                </div>
                <div style="text-align: right;">
                  (택배비 포함 25000원 이상 무료 배송)총 합계금액 &nbsp 
                  <c:if test="${contentsVO.repositoryprice < 25000}">
                  	<c:set value="${contentsVO.repositoryprice}" var="repositoryprice"/>
                  	<c:set value="${contentsVO.deliveryCharge}" var="deliveryCharge"/>
                  	<span id="total_price"><fmt:formatNumber  value="${repositoryprice +  deliveryCharge}" pattern="#,###.##" /></span>원
                  </c:if>
                  <c:if test="${contentsVO.repositoryprice > 25000}">
                  	<span id="total_price"><fmt:formatNumber  value="${contentsVO.repositoryprice}" pattern="#,###.##" /></span>원
                  </c:if>
                </div>
              </div>
              <div class="row" style="margin-top: 20px;">
                <div class="col-sm-4">
                  <button type="button" class="btn btn-primary" style="width: 100%; height: 50px;">바로구매하기</button>
                </div>
                <div class="col-sm-4">
                  <button type="button" class="btn btn-primary" style="width: 100%; height: 50px;" id="showppingbarsket">장바구니</button>
                </div>
              </div>
            </div>
          </div>
      </div>
        
	    
      <DIV class='menu_line' style='clear: both;'></DIV>
      <div class="row" style="margin: 10px 0 10px 0;">
        <nav class="navbar navbar-inverse">
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
              <li><a href="#section1" style="color: white;">상품상제정보</a></li>
              <li><a href="#section2">배송안내</a></li>
              <li><a href="#section3">교환 및 반품 안내</a></li>
              <li><a href="#section4">상품 후기</a></li>
              <li><a href="#section5">상품 문의</a></li>
            </ul>
          </div>
        </nav>
        <div class="col-sm-12" id="section1">
          ${contentsVO.contents}
        </div>
      </div>
      <div id="section2" style="margin: 10px 0 10px 0;" class="row"><br>
        <nav class="navbar navbar-inverse">
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
              <li><a href="#section1">상품상제정보</a></li>
              <li><a href="#section2" style="color: white;">배송안내</a></li>
              <li><a href="#section3">교환 및 반품 안내</a></li>
              <li><a href="#section4">상품 후기</a></li>
              <li><a href="#section5">상품 문의</a></li>
            </ul>
          </div>
        </nav>
        <div style="margin-top: 10px; margin-bottom: 20px; font-size: 0.8em;">
            <strong>배송안내</strong><br>
            <br>
            &lt<strong>배송정보</strong>&gt<br>
            <strong>- 배송방법</strong> : 택배/소포/등기<br>
            
            - 배송지역 : 국내배송<br>
            
            - 택배사 : 한진택배<br>
            
            - 배송완료일수 : 2-3일정도 소요<br>
            
            - 배송비 : 2,500원<br>
            
            - 배송비 무료조건 : 30,000원 이상 주문 시 무료<br>
            
            - 추가 배송비 : 도서산간 지역<br>
            
            ※업체 직배송 제품이나 상품 종류에 따라 배송비가 추가될 수 있음 <br>
            <br>
            &lt<strong>반품주소</strong>&gt<br>
            
            - 반품지명 : 올라펫 물류센터<br>
            
            - 반품주소 : 경기도 화성시 서신면 전곡산단9길 5, 백운엔지니어링 A동 올라펫물류센터<br>
            
            - 반품 연락처 : 1544-7867<br>
            
            - 반품 택배사 : 한진택배<br>
            <br>
            &lt<strong>출하지주소</strong>&gt<br>
            
            - 출하지명 : 올라펫 물류센터<br>
            
            - 출하지 주소 : 경기도 화성시 서신면 전곡산단9길 5, 백운엔지니어링 A동 올라펫물류센터<br>
            
            - 출하지 연락처 : 1544-7867<br>
        </div>
      </div>
      <div id="section3" class="row" style="margin: 10px 0 10px 0;">
        <nav class="navbar navbar-inverse">
          <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
              <li><a href="#section1">상품상제정보</a></li>
              <li><a href="#section2">배송안내</a></li>
              <li><a href="#section3" style="color: white;">교환 및 반품 안내</a></li>
              <li><a href="#section4">상품 후기</a></li>
              <li><a href="#section5">상품 문의</a></li>
            </ul>
          </div>
        </nav>
         <div style="margin-top: 10px; margin-bottom: 20px; font-size: 0.8em;">
            <h3>교환 및 반품안내</h3>
            <img src="./image/menu.jpg">
            <div style="font-size: 0.8em; margin: 10px 0 10px 0;">
              <strong>환불안내</strong><br>
              - 환불관련 자세한 사항은 카카오톡 @올라펫 또는 올라펫샵 서비스센터 1544-7867 로 문의주시기 바랍니다.<br><br>
              <strong>AS안내</strong>
              - 소비자분쟁해결 기준(공정거래위원회 고시)에 따라 피해를 보상받을 수 있습니다.<br>
              - "식품"의 경우 A/S가 불가능 합니다.<br>
              - 상품 제조사의 A/S 기준에 따릅니다. <br>
              - A/S 관련 자세한 사항은 카카오톡 @올라펫 또는 올라펫샵 고객센터 1544-7867 로 문의주시기 바랍니다.<br>
            </div>
         </div>
      </div>
      <div id="section4" class="row" style="margin: 10px 0 10px 0;">
        <nav class="navbar navbar-inverse">
            <div class="collapse navbar-collapse" id="myNavbar">
              <ul class="nav navbar-nav">
                <li><a href="#section1">상품상제정보</a></li>
                <li><a href="#section2">배송안내</a></li>
                <li><a href="#section3" >교환 및 반품 안내</a></li>
                <li><a href="#section4" style="color: white;">상품 후기</a></li>
                <li><a href="#section5">상품 문의</a></li>
              </ul>
            </div>
        </nav>
      </div>
      <div id="section5" class="row" style="margin: 10px 0 10px 0;">
        <nav class="navbar navbar-inverse">
            <div class="collapse navbar-collapse" id="myNavbar">
              <ul class="nav navbar-nav">
                <li><a href="#section1">상품상제정보</a></li>
                <li><a href="#section2">배송안내</a></li>
                <li><a href="#section3" >교환 및 반품 안내</a></li>
                <li><a href="#section4" >상품 후기</a></li>
                <li><a href="#section5" style="color: white;">상품 문의</a></li>
              </ul>
            </div>
        </nav>
      </div>
      <DIV class='menu_line' style='clear: both;'></DIV>
      
      <!-- 상품 번호-->
      <input type="hidden" value="${contentsVO.productno }" id="productno">
      <!-- 상품 이름-->
      <input type="hidden" value="${contentsVO.repositoryname }" id="productrepositoryname">
      <!-- 구매자 -->
      <input type="hidden" value="${sessionScope.id }" id="memberid">
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html>
    