<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="root" value='${pageContext.request.contextPath}' />

<ul class="dropdown-menu list-group" style='width: 200px;'>
  
  <li class="list-group-item">
    <a href="${root }/contents/list_all.do?PageNumber=&col=&categrpno=&search=&keyword='"> 전체 리스트<span class="badge" style='float: right;'>${total_count }</span></a>
  </li>
  
  <c:forEach var="categrpVO" items = "${ list }">
    <c:set var="categrpno" value="${categrpVO.categrpno }" />
    <li class="list-group-item" >
      <A href='${root}/contents/list_all.do?PageNumber=&col=&categrpno=${categrpno }&search=&keyword=' style='font-size: 0.9em;'>
      ${categrpVO.name }
      <span class="badge" style='float: right;'>${categrpVO.cnt }</span></a>
    </li>
  </c:forEach>
  
</ul>
