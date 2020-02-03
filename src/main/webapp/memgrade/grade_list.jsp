<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value='${pageContext.request.contextPath}' />

<c:if test="${sessionScope.id ne null }">
<ul class="dropdown-menu list-group" style='width: 200px;'>
  <li class="list-group-item">
    <a href="${root }/mem/list_all.do"> 전체회원<span class="badge" style='float: right;'>${cnt_tot }</span></a>
  </li>
  <c:forEach var="memgradeVO" items="${list }">
    <c:set var='memgradeno' value='${memgradeVO.memgradeno }' />
    <li class="list-group-item" >
      <a href='${root}/mem/list_by_memgradeno.do?memgradeno=${memgradeno}' >${memgradeVO.gname }
      <span class="badge" style='float: right;'>${memgradeVO.count }</span></a>
    </li>
  </c:forEach>
</ul>
</c:if>
