<%@tag body-content="empty" pageEncoding="GBK" import="java.util.*" %>
<%@tag trimDirectiveWhitespaces="true" %>
<%@tag import="java.text.SimpleDateFormat"%>
<%@attribute name="date" required="false" rtexprvalue="true" type="java.util.Date" %>
<%@attribute name="longValue" required="false" rtexprvalue="true" type="java.lang.Long" %>
<%@attribute name="format" required="false" rtexprvalue="true" %>
<%@attribute name="showTime" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%
/*
*日期转换标签 by 李海洋 2008.4
*/
Date date=(Date)jspContext.getAttribute("date");
Long longvalue=(Long)jspContext.getAttribute("longValue");
String formatStr=(String)jspContext.getAttribute("format");
Boolean showTime=(Boolean)jspContext.getAttribute("showTime");

if(date==null){
  date=new Date();
}


if(longvalue!=null){
  date=new Date(longvalue.longValue());
}

if(formatStr==null || formatStr.length()==0){
	if(showTime!=null && showTime){
		formatStr="yyyy-MM-dd HH:mm:ss";
	}else{
		formatStr="yyyy-MM-dd";
	}
}
SimpleDateFormat format=new SimpleDateFormat(formatStr,Locale.CHINA);
if(date!=null){
  out.print(format.format(date));
}
%>