<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="root" value="${pageContext.request.contextPath}" />
 		<div style="margin: 5px 0 5px 0;" class="glyphicon glyphicon-th-list">
	       <A href='${root}/contents/list_all.do?PageNumber=&col=&categrpno=${categrpno }&search=&keyword=' >전체글(${total_count })</A>
 		</div>
    
       <UL style='padding-left: 10px;'>   
         <c:forEach var="categrpVO" items = "${ list }">
           <c:set var="categrpno" value="${categrpVO.categrpno }" />
           <li style='font-size: 0.9em; width: 100%;' class="glyphicon glyphicon-asterisk">
             <A href='${root}/contents/list_all.do?PageNumber=&col=&categrpno=${categrpno }&search=&keyword=' style='font-size: 0.9em;'>${categrpVO.name }</A>(${categrpVO.cnt })           
           </li>     
         </c:forEach> 
       </UL>
  
  
       