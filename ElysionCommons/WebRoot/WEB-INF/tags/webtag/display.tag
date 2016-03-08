<%@tag body-content="empty" pageEncoding="GBK" import="java.util.*" %>
<%@tag trimDirectiveWhitespaces="true" %>
<%@attribute name="labels" required="true" rtexprvalue="true"  %>
<%@attribute name="keys" required="true" rtexprvalue="true" %>
<%@attribute name="showKey" required="true" rtexprvalue="true" %>
<%@attribute name="defaultLabel" required="false" rtexprvalue="true" %>
<%@attribute name="ignoreCase" required="false" rtexprvalue="true" type="java.lang.Boolean" %>
<%
/*
*键值显示标签 by 李海洋 2008.4
*/
String labels=(String)jspContext.getAttribute("labels");
String keys=(String)jspContext.getAttribute("keys");
String showKey=(String)jspContext.getAttribute("showKey");
String defaultLabel=(String)jspContext.getAttribute("defaultLabel");
Boolean ignore=(Boolean)jspContext.getAttribute("ignoreCase");
if(defaultLabel==null){
defaultLabel="";
}
if(ignore==null){
ignore=false;
}

String[] labelList=labels.split("[|]");
String[] keyList=keys.split("[|]");
for(int i=0;i<labelList.length;i++){
	boolean flag=false;
	if(ignore){
		flag=keyList[i].equalsIgnoreCase(showKey);
	}else{
		flag=keyList[i].equals(showKey);
	}
	if(showKey!=null && flag){
		out.print(labelList[i]);
		return;
	}
}
out.print(defaultLabel);
%>
