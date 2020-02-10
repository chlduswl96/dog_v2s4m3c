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
    
<script type="text/javascript">
function update_form(categrpno) {
  //alert("admin2no: " + admin2no);
  
  var url = './update.do?categrpno=' + categrpno;
  var win = window.open(url, '카테고리그룹 수정', 'width=500px, height=300px'); //create_form - 오프너
  
  var x = (screen.width - 500) / 2;
  var y = (screen.height - 300) / 2;
  
  win.moveTo(x, y);
}

function delete_form(categrpno) {
  //alert("admin2no: " + admin2no);
  
  var url = './delete.do?categrpno=' + categrpno;
  var win = window.open(url, '카테고리그룹 삭제', 'width=600px, height=400px'); //create_form - 오프너
  
  var x = (screen.width - 600) / 2;
  var y = (screen.height - 400) / 2;
  
  win.moveTo(x, y);
}

function update_seqno_up(categrpno, seqno) {
  var url = './update_seqno_up.do?categrpno=' + categrpno + '&seqno=' + seqno;
  var win = window.open(url, '_self');
}

function update_seqno_down(categrpno, seqno) {
  var url = './update_seqno_down.do?categrpno=' + categrpno + '&seqno=' + seqno;
  var win = window.open(url, '_self');
}
  
</script>
 
</head> 
 
<body>
<jsp:include page="/menu/top.jsp" />
  <div style='width: 70%; margin: 0px auto;'>
    <DIV class='title_line'>포 인 트 내 역</DIV>
 
    <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
      <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
        <!-- <input type='hidden' name='lang' id='lang' value='en'> --> <!-- ko, en -->
          
        <label>카테고리 그룹 이름</label>
        <input type='text' name='name' value='' required="required" style='width: 25%;'>
   
        <label>순서</label>
        <input type='number' name='seqno' value='1' required="required" 
                  min='1' max='1000' step='1' style='width: 5%;'>
    
        <label>형식</label>
        <select name='visible'>
          <option value='Y' selected="selected">Y</option>
          <option value='N'>N</option>
        </select>
         
        <button type="submit" id='submit'>등록</button>
        <button type="button" onclick="cancel();">취소</button>
      </FORM>
    </DIV>
  
    <TABLE class='table table-striped'>
      <colgroup>
        <col style='width: 15%;'/>
        <col style='width: 15%;'/>
        <col style='width: 15%;'/>
        <col style='width: 15%;'/>
        <col style='width: 15%;'/>    
        <col style='width: 15%;'/>
      </colgroup>
    
      <thead>  
      <TR>
        <TH class='th_basic'>적립일</TH>
        <TH class='th_basic'>구분</TH>
        <TH class='th_basic'>내역</TH>
        <TH class='th_basic'>적립된 포인트</TH>
        <TH class='th_basic'>사용</TH>
        <TH class='th_basic'>잔액</TH>
      </TR>
      </thead>
      
      <tbody>
        <c:forEach var="pointVO" items = "${list}">
          <c:set var="pnum" value="${pointVO.pnum }"/>
            <TR>
              <TD class='td_basic'>${pointVO.pdate.substring(0, 10) }</TD>
              <TD class='td_basic'>${pointVO.division}</TD>
              <TD class='td_basic'>${pointVO.history }</TD>
              <TD class='td_basic'>${pointVO.ampoint }</TD>
              <TD class='td_basic'>${pointVO.usep }</TD>
              <TD class='td_basic'>150</TD>
            </TR>
          </c:forEach> 
      </tbody>
    </TABLE>
  </div> 
 
<jsp:include page="/menu/bottom.jsp" />
</body>
 
</html> 
 
 