<%@tag body-content="empty" pageEncoding="GBK" import="java.util.*" %>
<%@tag trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="page" required="true" rtexprvalue="true" type="java.lang.Long" %>
<%@attribute name="totalRows" required="true" rtexprvalue="true" type="java.lang.Long" %>
<%@attribute name="rowsPerPage" required="true" rtexprvalue="true" type="java.lang.Long"%>
<%@attribute name="target" required="true" rtexprvalue="true"%>
<%@attribute name="pageParam" required="false" rtexprvalue="true"%>
<%
/*
*��ҳ��ǩ by ��� 2008.4
*/
long page=(Long)jspContext.getAttribute("page");
long total=(Long)jspContext.getAttribute("totalRows");
long per=(Long)jspContext.getAttribute("rowsPerPage");
if(page<1){
	page=1;
}

if(per<1){
	per=1;
}
long maxPage=total%per==0 ? total/per :total/per+1 ;
long prevPage=page-1<1 ? 1 : page-1;
long nextPage=page+1>maxPage ? maxPage : page+1;
jspContext.setAttribute("maxPage",maxPage);
jspContext.setAttribute("prevPage",prevPage);
jspContext.setAttribute("nextPage",nextPage);



%>
<script type="text/javascript">
<!--
function _goPage(index){
	var target="${target}";
	var currentPage="${page}";
	var pageParam="${pageParam}";
	if(index==currentPage)return;
	if(target=="")return;
	if(pageParam=="")pageParam="page";
	if(target.indexOf("?")>=0){
		location.href=target+"&"+pageParam+"="+index;
	}else{
		location.href=target+"?"+pageParam+"="+index;
	}
}
//-->
</script>
<a href="javascript:_goPage(1);" >��ҳ</a>
<a href="javascript:_goPage(${prevPage});" >��һҳ</a>
<a href="javascript:_goPage(${nextPage});" >��һҳ</a>
<a href="javascript:_goPage(${maxPage});" >βҳ</a>
ÿҳ${rowsPerPage }��
��${totalRows }��
<select name="_pagetag_page" onchange="_goPage(this.options[this.selectedIndex].value)">
<c:forEach begin="1" end="${maxPage}" var="_page">
<c:if test="${page==_page}">
<option value="${_page}" selected>��${_page }ҳ</option>
</c:if>
<c:if test="${page!=_page}">
<option value="${_page}" >��${_page }ҳ</option>
</c:if>
</c:forEach>
</select>
/��${maxPage }ҳ

