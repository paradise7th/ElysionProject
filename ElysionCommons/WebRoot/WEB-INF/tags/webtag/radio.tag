<%@tag body-content="empty" pageEncoding="GBK" import="java.util.*" %>
<%@tag trimDirectiveWhitespaces="true" %>
<%@attribute name="labels" required="true" rtexprvalue="true" type="java.lang.Object" %>
<%@attribute name="values" required="false" rtexprvalue="true" type="java.lang.Object" %>
<%@attribute name="selectedValue" required="false" rtexprvalue="true" type="java.lang.Object"  %>
<%@attribute name="spliter" required="false" rtexprvalue="true" type="java.lang.Object"  %>
<%@attribute name="name" required="false" rtexprvalue="true" type="java.lang.Object"  %>
<%
/*
*单选框生成标签 by 李海洋 2011.1
*/

Object _labels=jspContext.getAttribute("labels");
Object _values=jspContext.getAttribute("values");
Object select=jspContext.getAttribute("selectedValue");
Object spliter=jspContext.getAttribute("spliter");
Object name=jspContext.getAttribute("name");

if(name==null){
	name="";
}
if(spliter==null){
	spliter="";
}

if(_labels==null)return;

List labels=new Vector();
List values=new Vector();
if(_labels instanceof java.util.List){
  labels=(List)_labels;
}else if(_labels instanceof java.util.Map){
  Map mapping=(Map)_labels;
  labels=new Vector();
  _values=new Vector();
  for(Iterator it=mapping.entrySet().iterator();it.hasNext();){
	  Map.Entry entry=(Map.Entry)it.next();
	  labels.add(entry.getValue());
	  ((Vector)_values).add(entry.getKey());
  }
}else{
  String[] labelList=((String)_labels).split("[|]");
  for (int i = 0; i < labelList.length; i++) {
    labels.add(labelList[i]);
  }
}
if(_values==null){
  values=labels;
}else if(_values instanceof java.util.List){
  values=(List)_values;
}else{
   String[] valueList=((String)_values).split("[|]");
  for (int i = 0; i < valueList.length; i++) {
    values.add(valueList[i]);
  }
}

for(int i=0;i<labels.size();i++){
	if(select!=null && values.get(i).toString().equals(select.toString())){
		out.println("<input type='radio' name='"+name+"' value='"+values.get(i)+"' checked>"+labels.get(i)+"</input>");
	}else{
		out.println("<input type='radio' name='"+name+"' value='"+values.get(i)+"'>"+labels.get(i)+"</input>");
	}
	if(spliter!=null){
		out.print(spliter);
	}
}
%>
