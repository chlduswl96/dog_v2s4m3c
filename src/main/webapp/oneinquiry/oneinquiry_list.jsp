<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title></title>
<link href="../css/style.css" rel="Stylesheet" type="text/css">

<script type="text/JavaScript"
          src="http://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

</head>
<body>
<jsp:include page="/menu/mypage_top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <a href='../mypage/mypage_main.jsp'>마이페이지</a> > 
    <A href='./oneinquiry_list.do?memno=${param.memno }'>1대1 문의</A>
  </ASIDE>
  <%-- <ASIDE style='float: right;'>
    <A href="javascript:location.reload();">새로고침</A>
    <span class='menu_divide' >│</span>
    <A href='./create.do?memno=${param.memno }'>등록</A>
  </ASIDE>  
  --%>
  <DIV style='clear: both; height: 2px; margin: 10px 0px; background-color: #dedede;'></DIV>
  
     <!-- 리스트 시작 -->
    <table class="table table-striped" style='width: 100%;'>
      <colgroup>
        <col style="width: 10%;"></col>
        <col style="width: 60%;"></col>
        <col style="width: 15%;"></col>
        <col style="width: 15%;"></col>
      </colgroup>
      <!-- table 컬럼 -->
      <thead>
        <tr>
          <th class="th_basic">번호</th>
          <th class="th_basic">제목</th>
          <th class="th_basic">등록일</th>
          <th class="th_basic">기타</th>
        </tr>
      </thead>
      
      <!-- table 내용 -->
      <tbody>
        <c:forEach var="oneinquiryVO" items="${list }">
          <c:set var='memno' value='${oneinquiryVO.memno }' />
          <tr> 
            <td class="td_basic">${oneinquiryVO.iqynum}</td>
            <td class="td_basic">
              <a href="./read.do?iqynum=${oneinquiryVO.iqynum}" >${oneinquiryVO.title}</a>
              <c:choose>
                <c:when test="${oneinquiryVO.status.equals('N') }">
                  (답변중)
                </c:when>
                <c:otherwise>
                  (답변 완료)
                </c:otherwise>
              </c:choose>
            </td> 
            <td class="td_basic">${oneinquiryVO.idate.substring(0, 10)}</td>
            <td class="td_basic">
              <a href="./update.do?memno=${oneinquiryVO.memno }&iqynum=${oneinquiryVO.iqynum}"><img src="./images/update.png" title="수정" /></a>
              <a href="./delete.do?memno=${oneinquiryVO.memno }&iqynum=${oneinquiryVO.iqynum}"><img src="./images/delete.png" title="삭제" /></a>
            </td>
          </tr>
        </c:forEach>
        
      </tbody>
    </table>
    <div style='margin: 10px; width: 100%; text-align: right;'>
      <div class='bottom_menu'>${paging }</div>
      <button type='button' onclick="location.href='./create.do?memno=${param.memno }'" class='btn btn-default' style='margin-right: 15px;'>등록</button>
    </div>
  </div>
</div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>
</html>