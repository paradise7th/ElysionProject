<%@tag import="cn.com.ragnarok.elysion.common.baseobject.PageBean"%><%@tag body-content="empty" pageEncoding="UTF-8" import="java.util.*" %>
<%@tag trimDirectiveWhitespaces="true" %>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@attribute name="pageBean" required="true" rtexprvalue="true" type="domain.PageBean" %>
<%@attribute name="targetForm" required="true" rtexprvalue="true"%>
<%@attribute name="pageParam" required="false" rtexprvalue="true"%>
<%
/*
*分页标签配合PageBean by 李海洋 2010.3
*/
PageBean pb=(PageBean)jspContext.getAttribute("pageBean");
System.out.println(pb);
if(pb==null){
	pb=new PageBean(0,0,10,new Vector());
}

int p=pb.getCurrentPageNo();
int maxPage=pb.getTotalPage();
int prevPage=1;
int nextPage=maxPage>0?maxPage:1;
if(pb.hasPrev()){
	prevPage=p-1;
}
if(pb.hasNext()){
	nextPage=p+1;
}





jspContext.setAttribute("page",p);
jspContext.setAttribute("maxPage",maxPage);
jspContext.setAttribute("prevPage",prevPage);
jspContext.setAttribute("nextPage",nextPage);
jspContext.setAttribute("pageSize",pb.getPageSize());
jspContext.setAttribute("totalRows",pb.getTotalCount());



%>
<script type="text/javascript">
<!--
function _goPage(index){
	var f=document.getElementById("${targetForm}");
	if(f==null){
		f=document.forms["${targetForm}"];
	}
	//alert(f);
	var currentPage="${page}";
	var pageParam="${pageParam}";
	if(index==currentPage)return;
	if(pageParam=="")pageParam="page";
	//alert(pageParam);
	//alert(f[pageParam]);
	f[pageParam].value=index;
	//alert(f[pageParam].value);
	f.submit();
}
//-->
</script>
<a href="javascript:_goPage(1);" >首页</a>
<a href="javascript:_goPage(${prevPage});" >上一页</a>
<a href="javascript:_goPage(${nextPage});" >下一页</a>
<a href="javascript:_goPage(${maxPage=='0'?'1':maxPage});" >尾页</a>
每页${pageSize }条&nbsp;
共${totalRows }条&nbsp;
<select name="_pagetag_page" onchange="_goPage(this.options[this.selectedIndex].value)">
<c:forEach begin="1" end="${maxPage}" var="_page">
<option value="${_page}" ${page==_page?'selected':'' }>第${_page }页</option>
</c:forEach>
</select>
/共${maxPage }页

