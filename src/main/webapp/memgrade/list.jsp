<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="root" value='${pageContext.request.contextPath}' />
 
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
  function seqno_up(memgradeno, seqno) {
    var url = './seqnoup.do?memgradeno=' + memgradeno;
    var win = window.open(url, '_self');
    
    if (seqno <= 1) {
      alert("출력 순서 번호는 1이하 불가능");
      return;
    }
    alert("우선순위가 증가하였습니다.");
  }
  
  function seqno_down(memgradeno, seqno) {
    var url = './seqnodown.do?memgradeno=' + memgradeno;
    var win = window.open(url, '_self');
    
    if (seqno >= 100) {
      alert("출력 순서 번호는 100이상 불가능");
      return;
    }
    alert("우선순위가 감소하였습니다.");
  }
  
  function delete_form(memgradeno) {
	  
	  var url = './delete.do?memgradeno=' + memgradeno;
	  var win = window.open(url, '등급삭제', 'width=500px, height=400px');
	  
	  var x = (screen.width - 500) / 2;
	  var y = (screen.height - 400) / 2;
	  win.moveTo(x, y); // 지정된 좌표로 이동
	  
	}
  function update(memgradeno) {
	  var url = './update.do?memgradeno=' + memgradeno;
	  var win = window.open(url, '회원 등급 수정', 'width=400px, height=260px');
	    
	  var x = (screen.width - 400) / 2;
	  var y = (screen.height - 260) / 2;
	  win.moveTo(x, y); // 지정된 좌표로 이동
	}

</script>
</head>
<body>
<jsp:include page="/menu/top.jsp" />

  <DIV class='title_line'>회원 등급</DIV>
  <DIV id='panel_create' style='padding: 10px 0px 10px 0px; background-color: #F9F9F9; width: 100%; text-align: center;'>
    <FORM name='frm_create' id='frm_create' method='POST' action='./create.do'>
        
      <label>등급 이름</label>
      <input type='text' name='gname' value='' required="required" style='width: 25%;'>
      
      <label>순서</label>
      <input type='number' name='seqno' value='1' required="required" min='1' max='1000' step='1' style='width: 5%;'>
                
      <button type="submit" id='submit'>등록</button>
      <button type="button" onclick="cancel();">취소</button>
    </FORM>
  </DIV>
  
<TABLE class='table table-striped' style="width: 50%; margin:0px auto;">

  <colgroup>
    <col style='width: 20%;'/>
    <col style='width: 30%;'/>
    <col style='width: 20%;'/>
  </colgroup>
 
  <thead>  
  <TR>
    <TH class='th_basic'>출력 번호</TH>
    <TH class='th_basic'>등급 이름</TH>
    <TH class='th_basic'>기타</TH>
  </TR>
  </thead>
  
  <tbody>
  <c:forEach var="memgradeVO" items="${list }">
    <c:set var='memgradeno' value='${memgradeVO.memgradeno }' />
    <tr>
      <td style='text-align: center;'>${memgradeVO.seqno }</td>
      <td style='text-align: center;'>
        <a href='${root}/mem/list_by_memgradeno.do?memgradeno=${memgradeno}&nowPage=1' >
          ${memgradeVO.gname }
        </a>
      </td>
      <td style='text-align: center;'>
        <a href="javascript:seqno_up(${memgradeno }, ${memgradeVO.seqno });">
          <img src='./images/up.png' title='우선순위 높임' style="width: 16px;">
        </a>
        <a href="javascript:seqno_down(${memgradeno }, ${memgradeVO.seqno });"> 
          <img src='./images/down.png' title='우선순위 낮춤' style="width: 16px;">
        </a> 
        <a href="javascript:update(${memgradeno });"><img src='./images/update.png' title='수정'></a>
        <a href="javascript:delete_form(${memgradeno });"><img src='./images/delete2.png' title='삭제'></a>
      </td>
    </tr> 
  </c:forEach>
  </tbody>

</TABLE>
 
<jsp:include page="/menu/bottom.jsp" />
</body>
</html> 