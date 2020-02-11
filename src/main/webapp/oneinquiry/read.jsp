<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set var="root" value="${pageContext.request.contextPath}" />

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
  function panel_img(file) {
    var tag = "";
    tag = "<A href=\"javascript: $('#attachfile_panel').hide();\">";
    tag +=" <img src='./storage/" + file + "' style='width: 100%;'>";
    tag+="</A>";
    
    $('#attachfile_panel').html(tag);    /* jQuery, id로 태그 찾기 */
    $('#attachfile_panel').show();
  }
</script>
</head>

<body>
 
<c:set var="memno" value="${oneinquiryVO.memno }" />
<c:set var="iqynum" value="${oneinquiryVO.iqynum}" />
 
<jsp:include page="/menu/mypage_top.jsp" flush='false' />
  <ASIDE style='float: left;'>
    <a href='../mypage/mypage_main.jsp'>마이페이지</a> > 
    <A href='./oneinquiry_list.do?memno=${oneinquiryVO.memno }'>1대1 문의</A>
  </ASIDE>
  <c:if test="${sessionScope.id_admin ne null }">
    <ASIDE style='float: right;'>
      <span class='menu_divide' style='font-size: 14px;'>│</span>
      <A href='./delete.do?memno=${memno }&iqynum=${iqynum}'>
        <sapn style='font-size: 14px;'>삭제</sapn>
      </A>
      
      <span class='menu_divide' style='font-size: 14px;'>│</span>
      <A href='./answer.do?iqynum=${iqynum}'>
        <sapn style='font-size: 14px;'>답변</sapn>
      </A>
    </ASIDE>
  </c:if>
  <c:if test="${sessionScope.id ne null}">
    <ASIDE style='float: right;'>
      <A href='./oneinquiry_list.do?memno=${oneinquiryVO.memno }'>
        <sapn style='font-size: 14px;'>목록</sapn>
      </A>
      <span class='menu_divide' style='font-size: 14px;'>│</span>
      
      <A href='./update.do?memno=${memno }&iqynum=${iqynum}'>
        <sapn style='font-size: 14px;'>수정</sapn>
      </A>
      <span class='menu_divide' style='font-size: 14px;'>│</span>
      <A href='../attachfile/create.do?memno=${memno }&iqynum=${iqynum}''>
        <sapn style='font-size: 14px;'>첨부 파일 등록</sapn>
      </A>
      <span class='menu_divide' style='font-size: 14px;'>│</span>
      <A href='./file_delete.do?memno=${memno }&iqynum=${iqynum}''>
        <sapn style='font-size: 14px;'>첨부 파일 삭제</sapn>
      </A>
      <span class='menu_divide' style='font-size: 14px;'>│</span>
      <A href='./delete.do?memno=${memno }&iqynum=${iqynum}'>
        <sapn style='font-size: 14px;'>삭제</sapn>
      </A>
    </ASIDE> 
  </c:if>
  
  <DIV style='clear: both; height: 2px; margin: 10px 0px; background-color: #dedede;'></DIV>

  <FORM name='frm' method="get" action='./update.do'>
      <input type="hidden" name="iqynum" value="${iqynum}">
      <fieldset class="fieldset">
        <ul>
          <li class="li_none" style='border-bottom: solid 1px #AAAAAA;'>
            <span>${oneinquiryVO.title}</span>
            <span>${oneinquiryVO.idate.substring(0, 16)}</span>
          </li>
          <li class="li_none">
            <div id='attachfile_panel' style='width: 80%; margin: 0px auto;'></div> <!-- 원본 이미지 출력 -->
          </li>
          <li class="li_none" style='text-align: center;'>
            <c:forEach var="attachfileVO" items="${attachfile_list }">
              <c:set var='fthumb' value='${attachfileVO.thumb.toLowerCase() }' />
              <c:choose>
                <c:when test="${fthumb.endsWith('jpg') || fthumb.endsWith('png') || fthumb.endsWith('gif') }">
                  <a href="javascript:panel_img('${attachfileVO.fname }');"><img src='./storage/${fthumb }' style='margin-top: 2px;'></a>
                </c:when>
                <c:otherwise>
                  ${attachfileVO.fname }
                </c:otherwise>
              </c:choose>
            </c:forEach>
          </li>
          <li class="li_none">
            <DIV>${oneinquiryVO.content }</DIV>
          </li>
          <%-- <li class="li_none">
            <DIV style='text-decoration: none;'>
              <span class="glyphicon glyphicon-search"></span>
              검색어: ${contentsVO.word }
            </DIV> --%>
          </li>
          <%-- <li class="li_none">
            <div>
              <span class="glyphicon glyphicon-download-alt"></span>
              파일명을 클릭하면 다운로드할 수 있습니다.
              <A href='../attachfile/downzip.do?contentsno=${contentsno}'><img src='./images/zip.png' title='zip 파일 다운로드'></A>
            </div>
            <div>
              <c:forEach var="attachfileVO" items="${attachfile_list }">
                <c:set var='fname' value='${attachfileVO.fname.toLowerCase() }' />
                <A href='${root}/download2?dir=/oneinquiry/storage&filename=${attachfileVO.fupname}&downname=${attachfileVO.fname}'>${attachfileVO.fname}</A> /
              </c:forEach>
            </div> 
          </li> --%>
          <li class="li_none"><div style='margin-top: 50px; border-bottom: solid 1px #AAAAAA;'></div></li>
        </ul>
      </fieldset>
  </FORM>
  <div>
    관리자 답변 : ${answerVO.awcontent }
  </div>
</div>
</div>
<jsp:include page="/menu/bottom.jsp" flush='false' />
</body>

</html>