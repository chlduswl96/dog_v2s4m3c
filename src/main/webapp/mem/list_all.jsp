<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="root" value='${pageContext.request.contextPath}' />
<jsp:useBean id="now" class='java.util.Date' />
<fmt:formatDate value='${now }' pattern="yyyy-MM-dd" var='today' />
 
<!DOCTYPE html> 
<html lang="ko"> 
<head> 
<meta charset="UTF-8"> 
<meta name="viewport" content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" /> 
<title>team6</title>
 
<link href="../css/style.css" rel="Stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	// 테이블 검색
  $("#myInput").on("keyup", function() {
    var value = $(this).val().toLowerCase();
    $("#myTable tr").filter(function() {
      $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
    });
  });
  
  $('[data-toggle="tooltip"]').tooltip(); // 토글
});

// 체크박스 전체 선택
$(function() {
    $("#checkall").click(function(){
        if ($("#checkall").prop("checked")) {
            $("input[name=memno]").prop("checked",true);
        } else {
            $("input[name=memno]").prop("checked",false);
        }
    });
});

// 등급 변경
function update_grade() {
	
	var sel = document.getElementById("gno");
	var memgradeno = sel.options[sel.selectedIndex].value;

	var list = '';
	$("input[name='memno']:checked").each(function(i) {   //jQuery로 for문 돌면서 check 된값 배열에 담는다
	    list += $(this).val() + "/";
	});
	
  $.ajax({
        url : './update_g.do',
        type : 'get',
        async : true,  // true: 비동기
        cache : false,   // 브라우저 캐시영역 사용여부
        dataType : 'json', // 응답형식
        data : 'memgradeno=' + memgradeno + '&list=' + list,  // $("#frm").serialize(), : 서버로 전달하는 데이터
        success : function(rdata) {
        	
          var msg ="회원 " + rdata.count + "명" + rdata.gname + "등급으로 변경완료.";
          
          if (rdata.count > 0) {
        	  $("#update").hide();
          }
          
          $('#modal_content').attr('class', 'alert alert-success');
          $('#modal_title').html('회원 등급 변경');
          $('#modal_content').html(msg);
          $("#modal_panel").modal(); // 다이얼로그 출력
        },
        // ajax 통신 에러 브라우저 콘솔에 출력
        error : function(request, status, error) {
          var msg = 'ERROR<br><br>';
          msg += '<strong>request.status</strong><br>' + request.status
              + '<hr>';
          msg += '<strong>error</strong><br>' + error + '<hr>';
          console.log(msg);
        }
  });
  
  return;   
}

// 회원 삭제
function delete_mem() {
	var conf = confirm("선택 회원을 삭제 하시겠습니까?");

	var sel = document.getElementById("gno");

	var list = '';
	$("input[name='memno']:checked").each(function(i) {
	    list += $(this).val() + "/";
	});
	
	if(conf) {
    $.ajax({
        url : './delete.do',
        type : 'post',
        async : true,  // true: 비동기
        cache : false,   // 브라우저 캐시영역 사용여부
        dataType : 'json', // 응답형식
        data : 'list=' + list,  // $("#frm").serialize(), : 서버로 전달하는 데이터
        success : function(rdata) {

        	if (rdata.count > 0) {
            var msg ="회원 " + rdata.count + "명 삭제완료.";
            $('#modal_content').attr('class', 'alert alert-success');
          } else {
        	  var msg = rdata.fail_msg;
            $('#modal_content').attr('class', 'alert alert-danger');
          }

          $("#update").hide();
          $('#modal_title').html('회원 삭제');
          $('#modal_content').html(msg);
          $("#modal_panel").modal(); // 다이얼로그 출력
        },
        // ajax 통신 에러 브라우저 콘솔에 출력
        error : function(request, status, error) {
        	var msg = 'ERROR<br><br>';
            msg += '<strong>request.status</strong><br>' + request.status
                + '<hr>';
                
          msg += '<strong>error</strong><br>' + error + '<hr>';
          console.log(msg);
        }
    });
  }  
  return;   
}

// 회원에게 메일 보내기
function send_mail() {
  var sel = document.getElementById("gno");
  var memgradeno = sel.options[sel.selectedIndex].value;
  
  var list = '';
  $("input[name='memno']:checked").each(function(i) {   //jQuery로 for문 돌면서 check 된값 배열에 담는다
      list += $(this).val() + "/";
  });
  
  var url = './send_mail.do?list=' + list;
  var win = window.open(url, '메일 보내기', 'width=1200px, height=750px');
    
  var x = (screen.width - 1200) / 2;
  var y = (screen.height - 750) / 2;
  win.moveTo(x, y); // 지정된 좌표로 이동
}

// 페이징, 검색
function search_mem() {
	var col = $('#col').val();
	var word = $('#word').val();
	if (word == null) {
		word = "";
	}
	var nowPage = ${pagingVO.nowPage};
	
	if (nowPage == 0) {
		nowPage = 1;
	}
	var recordPerPage = $("#recordPerPage").val();
	if (word.length > 0) {
	  location.href='./list_all.do?col=' + col + '&word=' + word + '&recordPerPage=' + recordPerPage + '&nowPage=1'
	} else {
	  location.href='./list_all.do?col=' + col + '&recordPerPage=' + recordPerPage + '&nowPage=1'
	}
}

// 검색 취소
function search_cancle() {
  location.href = './list_all.do?&nowPage=1'
}

// 조회개수 변경시
$(function() {
	$("#recordPerPage").on('change', function(){
		// alert($("#recordPerPage").val());
		search_mem();
	});
});
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" />
  
  <ASIDE style='float: left;'>
    회원등급 > ALL
  </ASIDE>
  
  <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span> 
    <A href='./create_agr.do'>회원가입 test</A>
  </ASIDE> 
  
<DIV class='title_line'>전체 회원 목록</DIV>
<DIV id='panel_create' style='padding: 10px 0px 10px 10px; background-color: #F9F9F9; width: 100%;'>
  관리자만 접근가능합니다.
</DIV>

  <!-- Modal 알림창 시작 -->
  <div class="modal fade" id="modal_panel" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">X</button>
          <h4 class="modal-title" id='modal_title'></h4>  <!--  제목 -->
        </div>
        <div class="modal-body">
          <p id='modal_content'>
            변경할 등급 : 
            <select name='gno' id='gno'>
              <c:forEach var="memgradeVO" items="${grade_list }">
                <c:if test="${memgradeVO.memgradeno != -1 }">
                 <option value="${memgradeVO.memgradeno }">${memgradeVO.gname }</option>
                </c:if>
              </c:forEach>
            </select>
          </p> <!-- 내용 -->
        </div>
        <div class="modal-footer">
          <button id='update' type='button' onclick="update_grade();" class="btn btn-info btn-md">변경</button>
          <button type="button" class="btn btn-default" data-dismiss="modal" onclick='window.location.reload();'>취소</button>
        </div>
      </div>
    </div>
  </div>
  <!-- Modal 알림창 종료 -->
              
<table class="table table-bordered table-striped" style='width: 100%;'>
<c:set var="recordPerPage" value='${pagingVO.recordPerPage }' />
<c:set var="col" value='${pagingVO.col }' />
<c:set var="word" value='${pagingVO.word }' />
  <caption>
    <button type='button' class="btn btn-info btn-md" onclick="send_mail();">메일 보내기</button>
    <button type='button' class="btn btn-info btn-md" data-toggle="modal" data-target="#modal_panel">등급변경</button>
    <button type='button' class="btn btn-info btn-md" onclick='delete_mem();'>삭제</button>
    
    <select name='col' id='col'>
      <option value='mname' ${col == 'mname' ? "selected='selected'" : "" }>성명</option>
      <option value='id'  ${col == 'id' ? "selected='selected'" : "" }>id</option>
      <option value='tel' ${col == 'tel' ? "selected='selected'" : "" }>전화번호</option>
      <option value='address1' ${col == 'address1' ? "selected='selected'" : "" }>주소</option>
    </select>
    <input type='text' name='word' id='word' value="${word }" placeholder="검색어">
    <button type='button' onclick="search_mem();">검색</button>
    <c:if test="${param.word ne null }">
      <button type='button' onclick="search_cancle();">검색취소</button>
    </c:if>
    <select name='recordPerPage' id='recordPerPage' >
      <option value='5' ${recordPerPage == 5 ? "selected='selected'" : "" }>5개씩</option>
      <option value='10' ${recordPerPage == 10 ? "selected='selected'" : "" }>10개씩</option>
      <option value='15' ${recordPerPage == 15 ? "selected='selected'" : "" }>15개씩</option>
      <option value='20' ${recordPerPage == 20 ? "selected='selected'" : "" }>20개씩</option>
    </select>
    
  </caption>
<colgroup>
    <col style='width: 15%;'/>
    <col style='width: 10%;'/>
    <col style='width: 12%;'/>
    <col style='width: 15%;'/>
    <col style='width: 26%;'/>
    <col style='width: 12%;'/>
    <col style='width: 10%;'/>
  </colgroup>
  <thead>
  <tr>
    <td colspan="7"><input class="form-control" id="myInput" type="text" placeholder="Search.."></td>
  </tr>
  
  <TR>
    <TH class='th'>
      <input type='checkbox' id='checkall'>
      등급
    </TH>
    <TH class='th'>ID</TH>
    <TH class='th'>성명</TH>
    <TH class='th'>전화번호</TH>
    <TH class='th'>주소</TH>
    <TH class='th'>등록일</TH>
    <TH class='th'>기타</TH>
  </TR>
  </thead>
  
  <tbody id='myTable'>

  <c:forEach var="memVO" items="${list }">
    <fmt:parseDate value='${memVO.rdate }' pattern="yyyy-mm-dd" var='rdate' />
    <fmt:formatDate value='${rdate }' pattern="yyyy-mm-dd" var='rdate' />
    <c:set var="memno" value ="${memVO.memno}" />
  <TR>
    <TD class='td'>
      <input type='checkbox' name='memno' value='${memno }'>
      ${memVO.gradename}(${memno})
    </TD>
    <TD class='td'><A href="./read.do?memno=${memno}">${memVO.id}</A></TD>
    <TD class='td'>
      <A href="./read.do?memno=${memno}">${memVO.mname}</A>
      <c:if test="${today == rdate }">
        <span class="label label-default" style='font-size: 0.3em;'>New</span>
      </c:if>
    </TD>
    <TD class='td'>${memVO.tel}</TD>
    <TD class='td'>
      <c:choose>
        <c:when test="${memVO.address1.length() > 15 }">
          ${memVO.address1.substring(0, 15) }...
        </c:when>
        <c:otherwise>
          ${memVO.address1}
        </c:otherwise>
      </c:choose>
    </TD>
    <TD class='td'>${memVO.rdate.substring(0, 10)}</TD> <!-- 년월일 -->
    <TD class='td' style='text-align: center;'>
      <A href="./read.do?memno=${memno}"><IMG src='./images/update.png' data-toggle="tooltip" title='수정'></A>
      <A href="./delete.do?memno=${memno}"><IMG src='./images/delete.png' data-toggle="tooltip" title='삭제'></A>
    </TD>
    
  </TR>
  </c:forEach>
  </tbody>
  <tbody id='searchTable'>
  </tbody>
 
</TABLE>

<!-- 페이지 시작-->
<DIV id='paging' style="text-align: center;">
  <c:set var="endPage" value='${pagingVO.endPage}' />
  <c:if test="${pagingVO.totalPage < endPage }">
    <c:set var="endPage" value='${pagingVO.totalPage}' />
  </c:if>
    
  <c:if test="${pagingVO.nowGrp >= 2 }">
    <c:set var="forPage" value="${(pagingVO.nowGrp - 1) * pagingVO.pagePerBlock }" />
      <span class='span_box_1'>
        <a href="./list_all.do?nowPage=${forPage }&col=${col}&word=${word}&recordPerPage=${recordPerPage}">
          이전
        </a>
      </span>
  </c:if>
      
  <c:forEach var='page' begin='${pagingVO.startPage}' end='${endPage }' step='1'>
      <span class='span_box_1'>
      <c:choose>
        <c:when test="${pagingVO.nowPage == page}">
          <strong>
          ${page }
          </strong>
        </c:when>
        <c:otherwise>
          <a href="./list_all.do?nowPage=${page }&col=${col}&word=${word}&recordPerPage=${recordPerPage}"> 
          ${page }
          </a>
        </c:otherwise>
      </c:choose>
      </span>
      
  </c:forEach>
  
  <c:if test="${pagingVO.nowGrp < pagingVO.totalGrp}">
    <c:set var="nextPage" value="${(pagingVO.nowGrp * pagingVO.pagePerBlock) + 1}"></c:set>
      <span class='span_box_1'>
        <a href="./list_all.do?nowPage=${nextPage }&col=${col}&word=${word}&recordPerPage=${recordPerPage}"> 
          다음
        </a>
      </span>
  </c:if>

</DIV>
<!-- 페이지 종료 -->

<jsp:include page="/menu/bottom.jsp" />
</body>
</html> 