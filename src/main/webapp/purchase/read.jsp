<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>구매하기</title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head> 

<script type="text/javascript">
/* 제이쿼리 시작 */
$(document).ready(function(){
	
	var list = new Array(); 
	<c:forEach var="ShowppingbasketVO" items="${list}">
			list.push(${ShowppingbasketVO.cnt} * ${ShowppingbasketVO.price});
	</c:forEach>	
	
	var total_price = 0;
	$.each(list, function(index, item){
		total_price += item;
	});
	
	if(25000 > total_price ){
		total_price += 2500;
		$("#delibery").html("2500원");
	}
	$("#total_price").html(comma(total_price));
	$("#total_price").attr('style','color:#1a1aff');
	/*  결제 금액 */
	$("#order_total_price1").html(comma(total_price));
	/*  총 상품 금액 표시 */
	$("#order_total_price2").html(comma(total_price) + "원");
	
	
	/*  결제 방법 기능*/
	$("input[name=payment_check]").change(function() {
		
		$("#div1").hide();
		$("#div2").hide();
		$("#div3").hide();
		var radioValue = $(this).val();
		if(radioValue == 'credit_card'){
			$("#div1").show();
		} else if(radioValue == 'account'){
			$("#div2").show();
		} else if(radioValue == 'deposit'){
			$("#div3").show();
		}
	});
	
	/* 결제시작 */
	$("#zxc").on('click',function(){
		
		var jsonObject = new Object();
		var memberInfoObject = new Object();
		var creditInfor = new Object();
		
		memberInfoObject.name = $("#ordername").val();
		memberInfoObject.zipcode = $("#zipcode").val();
		memberInfoObject.address1 = $("#address1").val();
		memberInfoObject.address2 = $("#address2").val();
		memberInfoObject.phone = $("#phone").val();
		
		var result = $("input[name=payment_check]:checked").val();
		console.log(result);
		
		if(result == 'credit_card'){
			console.log($("select[name=credit_card_back").val());
		}else if(result == "account"){
			console.log($("select[name=account_back").val());
		}else if(result == "deposit"){
			console.log($("select[name=deposit_back").val());
		}
		
		 var obj =  {
			      url : '../purchase/purchase_proc.do',
			      type : 'post',
			      cache: false,
			      async : true,
			      dataType : "json",
			      contentType : "application/json; charset=utf-8",//JSON으로 넘길때
			      //data :{"jsonData": jsonData},
			      data :JSON.stringify(obj),
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
			   //$.ajax(obj);
	});
	/* 결제끝 */
 });
 
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


/* 제이쿼리 끝 */
</script>

<style>
.image:hover{
	 opacity:  0.5;
}
</style>
 
<body>
<jsp:include page="/menu/top.jsp" flush="false"/>
 
  <DIV class='title_line'>주문 조회</DIV>
 
 <!-- 상품 리스트  -->
<TABLE class='table table-striped'>
  <colgroup>
    <col style='width: 5%;'/><!-- 상품 번호 -->
    <col style='width: 15%;'/><!-- 상품 이미지  -->
    <col style='width: 35%;'/><!-- 상품 제목 -->
    <col style='width: 10%;'/><!--  상품 갯수 -->
    <col style='width: 10%;'/><!-- 상품 가격 -->
    <col style='width: 20%;'/> <!-- 상품  총 가격  -->
  </colgroup>
  <tbody>
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
	        <td style="text-align: center;vertical-align: middle;">
	        	<span style="font-weight: 550;"><fmt:formatNumber  value="${cnt * price}" pattern="#,###.##" /></span>원</td>
	      </tr>
	  	</c:forEach>	
  </tbody>
</TABLE>
<DIV class='menu_line' style='clear: both;'></DIV>
<div class="row">
	<div class="col-sm-12" style="text-align: right;">
		<span>(20000원 이하는 택배비 2500원 추가)</span><span style="font-weight: 550;">총 가격 : </span><span id="total_price"></span>원
	</div>
</div>
 <DIV class='title_line'>주문 상세</DIV>
 
 <div class="row">
 	<div class="col-sm-12" style="text-align: left;">
 		<span class="glyphicon glyphicon-user" style="margin-right: 5px;"></span><span>회원 상세</span>
 	</div>
 	<DIV class='menu_line' style='clear: both;'></DIV>
 </div>
 
 <form name="frm">
 <!-- 구매자 상세 div -->
 <div class="row">	
 	<div style="text-align: right;width: 90px;display: inline-block;float: left;">
 		<span>이름</span>
 	</div>
 	<div class="col-sm-10">
 		<input type="text" class="input-sm" id="ordername">
 	</div>
 </div> 
 
 <div class="row">	
 	<div style="text-align: right;width: 90px;display: inline-block;float: left;">
 		<span>우편 주소</span>
 	</div>
 	<div class="col-sm-10">
 		<input type="text" class="input-sm" id="zipcode">
 	</div>
 </div> 
 
 <div class="row">	
 	<div style="text-align: right;width: 90px;display: inline-block;float: left;">
 		<span>주소</span>
 	</div>
 	<div class="col-sm-10">
 		<input type="text" class="input-sm" id="address1" style="width: 100%;">
 		<input type="text" class="input-sm" id="address2" style="width: 100%;">
 		<button class="btn btn-danger" onclick="DaumPostcode()" style="margin-top: 10px; margin-bottom: 10px;">주소 찾기</button>
 	</div>
 </div> 
 
 <div class="row">	
 	<div style="text-align: right;width:110px;display: inline-block;float: left;">
 		<span>핸드폰 번호</span>
 	</div>
 	<div class="col-sm-10">
 		<input type="text" class="input-sm" placeholder="ex) 010-0000-0000" id="phone">
 	</div>
 </div> 
 <div id="wrap" style="display:none; border:1px solid;width:500px;height:300px;margin:5px 110px;position:relative;">
 	<img src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png" id="btnFoldWrap" style="cursor:pointer;position:absolute;right:0px;top:-1px;z-index:1" onclick="foldDaumPostcode()" alt="접기 버튼">
 </div>
 </form>
 <!-- 구매자 상세 div -->	
 
<DIV class='menu_line' style='clear: both;'></DIV>

<!--  결제 정보 -->
 <div class="row">
 	<div class="col-sm-9 well">
 		<div style="margin: 0 auto; width: 80%;">
 			<h3>결제정보</h3>
 			<h3>일반결제</h3>
 			<div>
 				<input type="radio" id="a" name="payment_check" class="payment_check" value="credit_card"><label for="a" style="margin-left: 5px; font-size: 0.8em;">신용카드</label>
 				<input type="radio" id="b" name="payment_check" class="payment_check" value="account"><label for="b" style="margin-left: 5px; font-size: 0.8em;">실시간계좌이체</label>
 				<input type="radio" id="c" name="payment_check" class="payment_check"   value="deposit"><label for="c" style="margin-left: 5px; font-size: 0.8em;">무통장입금</label>
 			</div>
		</div>

		<div style="margin: 0 auto; width: 80%;" id="check">
 			<!--  신용카드 -->
 			<div id="div1" style="display: none;">
 				<span style="font-size: 0.8em;">은행사 : </span>
                <select class="input-sm" name="credit_card_back">
 					<option selected="selected">선택</option>
 					<option style="font-size: 1em;" value="KB">국민은행</option>
 					<option style="font-size: 1em;" value="SH">신한은행</option>
 					<option style="font-size: 1em;" value="NH">농협</option>
 					<option style="font-size: 1em;" value="WR">우리은행</option>
			    </select>
 			</div>
 			<!--  신용카드 -->
 			
 			<!--  실시간 계좌이체 -->
 			<div id="div2" style="display: none;"> 
 				<span style="font-size: 0.8em;">은행사 : </span>
                <select class="input-sm" name="account_back">
 					<option selected="selected">선택</option>
 					<option style="font-size: 1em;" value="KB">국민은행</option>
 					<option style="font-size: 1em;" value="SH">신한은행</option>
 					<option style="font-size: 1em;" value="NH">농협</option>
 					<option style="font-size: 1em;" value="WR">우리은행</option>
			    </select>
			    <!-- <label for="number" style="font-size: 0.8em;">계좌번호</label>
			    <input type="text" id="number" class="input-sm"> <button class="btn btn-danger">계좌확인</button> -->
 			</div>
 			<!--  실시간 계좌이체 -->
 			
 			<!--  무통장 계좌이체 -->
 			<div id="div3" style="display: none;">
 				<span style="font-size: 0.8em;">계좌번호 : </span>
                <select class="input-sm" style="width: 300px;" name="deposit_back">
 					<option selected="selected" >선택</option>
 					<option style="font-size: 1em;" value="KB">국민은행(919301-01-112658 이민욱)</option>
			    </select>
 			</div>
 			<!--  무통장 계좌이체 -->
		</div>
 	</div>
 	
 	<div class="col-sm-3 well">
 		<div style="margin: 0 auto; width: 80%;">
			<h3 style="font-weight: 550;">주문자 정보</h3>
			<div style="margin-bottom: 3px;"><span style="font-size: 0.8em;" id="order_name">${member_info.mname }</span></div>
			<div style="margin-bottom: 3px;"><span style="font-size: 0.8em;" id="order_phone">${member_info.tel }</span></div>
			
			<div style="margin-bottom: 3px;"><span style="font-size: 0.8em;">결제금액</span></div>
			<div style="margin-bottom: 3px;"><span style="font-weight: 1000; font-size: 40px;" id="order_total_price1"></span>원</div>
			
			<DIV class='menu_line' style='clear: both;'></DIV>
			<div><span style="font-size: 0.8em;">총 상품 금액</span> <span style="float: right;" id="order_total_price2"></span></div>
			<div><span style="font-size: 0.8em;">배송비</span> <span style="float: right;" id="delibery">0원</span></div>
			<div style="margin-top: 10px;"><button class="btn btn-danger" id="zxc">주문하기</button></div>
 		</div>
 	</div>
 </div>
<!--  결제 정보 -->

<jsp:include page="/menu/bottom.jsp" />
</body>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    // 우편번호 찾기 화면을 넣을 element
    var element_wrap = document.getElementById('wrap');
 
    function foldDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_wrap.style.display = 'none';
    }
 
    function DaumPostcode() {
        // 현재 scroll 위치를 저장해놓는다.
        var currentScroll = Math.max(document.body.scrollTop, document.documentElement.scrollTop);
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = data.address; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수
 
                // 기본 주소가 도로명 타입일때 조합한다.
                if(data.addressType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('zipcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('address1').value = fullAddr;
 
                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_wrap.style.display = 'none';
 
                // 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
                document.body.scrollTop = currentScroll;
                
                $('#address2').focus();
            },
            // 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
            onresize : function(size) {
                element_wrap.style.height = size.height+'px';
            },
            width : '100%',
            height : '100%'
        }).embed(element_wrap);
 
        // iframe을 넣은 element를 보이게 한다.
        element_wrap.style.display = 'block';
    }
    
    function move_scroll(){
        // 화면이동 id=wrap
        var offset = $("#move_top").offset();
        $('html, body').animate({scrollTop : offset.top}, 400);
    }
</script>
<!-- ----- DAUM 우편번호 API 종료----- -->
 
</html> 
 