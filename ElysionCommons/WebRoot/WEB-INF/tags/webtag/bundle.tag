<%@tag body-content="empty" pageEncoding="GBK" import="java.util.*" %>
<%@tag trimDirectiveWhitespaces="true" %>
<%@tag import="java.text.MessageFormat"%>
<%@attribute name="key" required="true" rtexprvalue="true"  %>
<%@attribute name="bundle" required="false" rtexprvalue="true" %>
<%@attribute name="language" required="false" rtexprvalue="true" %>
<%@attribute name="arg1" required="false" rtexprvalue="true" type="java.lang.Object" %>
<%@attribute name="arg2" required="false" rtexprvalue="true" type="java.lang.Object" %>
<%@attribute name="arg3" required="false" rtexprvalue="true" type="java.lang.Object" %>
<%@attribute name="arg4" required="false" rtexprvalue="true" type="java.lang.Object" %>
<%!
/*
*日期转换标签 by 李海洋 2008.4
*/
private static final String defResource="/prop/resource";
private static final Locale defLocale=new Locale("cn");
%>
<%
String name=(String)jspContext.getAttribute("key");
String bundle=(String)jspContext.getAttribute("bundle");
String language=(String)jspContext.getAttribute("language");
Object arg1=jspContext.getAttribute("arg1");
Object arg2=jspContext.getAttribute("arg2");
Object arg3=jspContext.getAttribute("arg3");
Object arg4=jspContext.getAttribute("arg4");

if(bundle==null)bundle=defResource;
Locale loc=defLocale;
if(language!=null)loc=new Locale(language);
ResourceBundle resourceBundle=ResourceBundle.getBundle(bundle,loc);

if(name!=null && resourceBundle!=null){
	String message=null;
	try{
		message=resourceBundle.getString(name);
	}catch(Exception e){}
	if(message==null){
		message=name;
	}else{
		message=MessageFormat.format(message,new Object[]{arg1,arg2,arg3,arg4});
	}
	out.print(message);	
	
}
%>