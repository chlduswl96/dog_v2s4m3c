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
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- <script type="text/javascript">
  function delete_by_contentsno() {
    frm_delete_by_contentsno.submit();
  }
</script> -->
</head> 
 
<body>

<%-- <FORM name='frm_delete_by_contentsno' method='POST' 
            action='../attachfile/delete_by_contentsno.do'>
  <input type='hidden' name='memno' value='${param.memno }'>            
  <input type='hidden' name='iqynum' value='${param.iqynum }'>
</FORM> --%>

<jsp:include page="/menu/mypage_top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <a href='../mypage/mypage_main.jsp'>마이페이지</a> > 
    <A href='./oneinquiry_list.do?memno=${oneinquiryVO.memno }'>1대1 문의</A>
  </ASIDE>
  <ASIDE style='float: right;'>
    <%-- <span class='menu_divide' >│</span>
    <A href='./create.do?categrpno=${categrpVO.categrpno }&memberno=1'>등록</A> --%>
  </ASIDE> 
  
  <div class='menu_line'></div>
 
  <FORM name='frm' method='POST' action='./delete.do'>
      <input type='hidden' name='memno' value='${oneinquiryVO.memno }'>            
      <input type='hidden' name='iqynum' value='${oneinquiryVO.iqynum }'>
            
      <div class="form-group">   
        <div class="col-md-12" style='text-align: center; margin: 30px;'>
          삭제 되는글: ${oneinquiryVO.title }<br><br>
          삭제하시겠습니까? 삭제하시면 복구 할 수 없습니다.<br><br>
          <%-- <c:choose>
            <c:when test="${count_by_contentsno > 0 }">
              <DIV style="text-decoration: underline;">
                관련된 첨부파일 ${count_by_contentsno } 건이 발견되었습니다.
              </DIV>
              <DIV> 
                관련된 첨부파일을 삭제해야 글을 삭제 할 수 있습니다.<br>
                <span style='color: #FF0000'>첨부 파일이 삭제되면 복구 할 수 없습니다.</span><br>
                첨부 파일을 삭제 하시겠습니까?
                <button type='button' onclick="delete_by_contentsno();" class="btn btn-info">예(삭제진행)</button> 
              </DIV>
            </c:when>
            <c:otherwise>
              <button type = "submit" class="btn btn-info">삭제 진행</button>
            </c:otherwise>
          </c:choose> --%>
          <button type = "submit" class="btn btn-default">삭제 진행</button>
          <button type = "button" onclick = "history.back()" class="btn btn-default">취소</button>
        </div>
      </div>   
  </FORM>
</div>
</div>
</div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
 
</html> 
 
  