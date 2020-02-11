<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

  <table class="table table-striped" style='width: 100%;'>
    <colgroup>
      <col style="width: 15%;"></col>
      <col style="width: 70%;"></col>
      <col style="width: 15%;"></col>
    </colgroup>
    <thead>
      <tr>
        <th class="th_basic">번호</th>
        <th class="th_basic">제목</th>
        <th class="th_basic">등록일</th>
      </tr>
    </thead>
    <tbody>
      <c:set var="cnt"  value="${param.cnt }" />
      <c:forEach var='oneinquiryVO' items="${list }">
        <c:choose>
          <c:when test="${cnt >= 1}">
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
            </tr>
            <c:set var="cnt" value="${cnt - 1 }"/>
          </c:when>
        </c:choose>
      </c:forEach>
    </tbody>
  </table>
