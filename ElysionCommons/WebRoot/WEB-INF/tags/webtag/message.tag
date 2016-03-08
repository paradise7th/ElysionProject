<%@tag body-content="tagdependent" pageEncoding="GBK" import="java.util.*" %>
<%@tag import="java.text.MessageFormat"%>
<%@tag trimDirectiveWhitespaces="true" %>
<%@attribute name="arg1" required="false" rtexprvalue="true" type="java.lang.Object" %>
<%@attribute name="arg2" required="false" rtexprvalue="true" type="java.lang.Object" %>
<%@attribute name="arg3" required="false" rtexprvalue="true" type="java.lang.Object" %>
<%@attribute name="arg4" required="false" rtexprvalue="true" type="java.lang.Object" %>
<%@attribute name="arg5" required="false" rtexprvalue="true" type="java.lang.Object" %>
<jsp:doBody var="body"/>
<%
/*
*格式输出标签 by 李海洋 2008.4
*/
Object arg1=jspContext.getAttribute("arg1");
Object arg2=jspContext.getAttribute("arg2");
Object arg3=jspContext.getAttribute("arg3");
Object arg4=jspContext.getAttribute("arg4");
Object arg5=jspContext.getAttribute("arg5");
String body=(String)jspContext.getAttribute("body");
String message=MessageFormat.format(body,new Object[]{arg1,arg2,arg3,arg4,arg5});
out.print(message);	
%>