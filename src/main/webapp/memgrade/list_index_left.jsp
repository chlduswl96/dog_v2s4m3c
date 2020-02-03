<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value='${pageContext.request.contextPath}' />


<!-- 관리자 -->
<c:if test="${sessionScope.id_admin ne null }">
${sessionScope.mname }<br>

<ul class="list-group">
  <li class="list-group-item" >
    <a href="${root }/mem/list_all.do?nowPage=1"> 전체회원</a>
    <span class="badge">${cnt_tot }</span>
  </li>
  <c:forEach var="memgradeVO" items="${list }">
    <c:set var='memgradeno' value='${memgradeVO.memgradeno }' />
      <li class="list-group-item" >
        <a href='${root}/mem/list_by_memgradeno.do?memgradeno=${memgradeno}&nowPage=1' >
          ${memgradeVO.gname }
        </a><span class="badge">${memgradeVO.count }</span>
      </li>
  </c:forEach>
</ul>

</c:if>

<!-- 회원, 관리자 -->
<c:if test="${sessionScope.id ne null }">
  ${sessionScope.mname }<br>
  <li class="list-group-item" >
    <a href="${root }/mem/read.do?memno=${memVO.memno}">개인 정보 수정</a>
  </li>
  <li class="list-group-item" >
    <a href="${root }/mem/update_passwd.do?memno=${memVO.memno}">비밀번호 변경</a>
  </li>
  <li class="list-group-item" >
    <a href="${root }/mem/update_passwd.do?memno=${memVO.memno}">회원 탈퇴</a>
  </li>
</c:if>
