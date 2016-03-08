<%@tag body-content="empty" pageEncoding="GBK" import="java.util.*" %>
<%@tag trimDirectiveWhitespaces="true" %>
<%@attribute name="labels" required="true" rtexprvalue="true" type="java.lang.Object" %>
<%@attribute name="values" required="false" rtexprvalue="true" type="java.lang.Object" %>
<%@attribute name="selectedValue" required="false" rtexprvalue="true" type="java.lang.Object"  %>
<%
/*
*选项生成标签 by 李海洋 2008.4
*/

Object _labels=jspContext.getAttribute("labels");
Object _values=jspContext.getAttribute("values");
Object select=jspContext.getAttribute("selectedValue");
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
		out.println("<option value='"+values.get(i)+"' selected>"+labels.get(i)+"</option>");
	}else{
		out.println("<option value='"+values.get(i)+"'>"+labels.get(i)+"</option>");
	}
}
%>
