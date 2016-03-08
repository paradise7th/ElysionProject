<%@tag body-content="scriptless" pageEncoding="GBK" import="java.util.*" %>
<%@tag trimDirectiveWhitespaces="true" %>
<%@tag isELIgnored="false" %>
<%@attribute name="permitCode" required="true" rtexprvalue="true"  %>
<%@attribute name="permitCodeListSessionKey" required="false" rtexprvalue="true"  %>
<%@attribute name="permitCheck" required="false" rtexprvalue="true"   %>
<%
/* 
*权限标签 by 李海洋 2010.3
*/
String pid=(String)jspContext.getAttribute("permitCode");
String pidkey=(String)jspContext.getAttribute("permitCodeListSessionKey");
String ispermit=(String)jspContext.getAttribute("permitCheck");
if(ispermit==null)ispermit="true";
if(pidkey==null)pidkey="s_permitlist";

boolean chkflag=true;
try{
chkflag=Boolean.parseBoolean(ispermit);
}catch(Exception e){}

boolean flag=false;
try{
	int id=Integer.parseInt(pid);
	List permits=(List)request.getSession().getAttribute(pidkey);
	flag=(permits!=null && permits.contains(pid));
	
}catch(Exception e){e.printStackTrace();}

if(flag==chkflag){%>
<jsp:doBody/>
<%}%>