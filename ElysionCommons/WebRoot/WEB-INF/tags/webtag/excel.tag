<%@tag import="cn.com.ragnarok.elysion.common.web.WebUtils"%>
<%@tag body-content="scriptless" pageEncoding="GBK" import="java.util.*" %>
<%@tag trimDirectiveWhitespaces="true" %>
<%@tag isELIgnored="false" %>
<%@attribute name="expandStyle" required="false" rtexprvalue="true"  %>
<%@attribute name="filename" required="false" rtexprvalue="true"  %>
<%
/* 
*EXECEL�����ǩ  ʹ��EXCEL��XML��ʽ�������  by ��� 2010.8 �����Ŀʹ��
*/
//response.reset();
Object name=jspContext.getAttribute("filename");
if(name==null)name="����";
response.setContentType("application/vnd.ms-excel;charset=utf-8");
String filename=WebUtils.encodeUTF8(name.toString());
response.setHeader("Content-Disposition","attachment;filename="+filename+".xls ");

%>
<?xml version="1.0" encoding="UTF-8" ?>

<?mso-application progid="Excel.Sheet"?>
<Workbook xmlns="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:o="urn:schemas-microsoft-com:office:office"
 xmlns:x="urn:schemas-microsoft-com:office:excel"
 xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
 xmlns:html="http://www.w3.org/TR/REC-html40">
 <Styles>
  <Style ss:ID="head">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Alignment ss:Horizontal="Center" ss:Vertical="Center"/>
   <Font ss:FontName="����" x:CharSet="134" ss:Size="9" ss:Bold="1"/>
   <Interior ss:Color="#99CC00" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="cell">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="����" x:CharSet="134" ss:Size="9"/>
  </Style>
  <Style ss:ID="cell0">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="����" x:CharSet="134" ss:Size="9"/>
   <NumberFormat ss:Format="General;-General;"/>
  </Style>
  <Style ss:ID="rowhead">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="����" x:CharSet="134" ss:Size="9"/>
   <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="rowhead0">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="����" x:CharSet="134" ss:Size="9"/>
   <Interior ss:Color="#FFFF99" ss:Pattern="Solid"/>
   <NumberFormat ss:Format="General;-General;"/>
  </Style>
  <Style ss:ID="rowhead_green">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="����" x:CharSet="134" ss:Size="9"/>
   <Interior ss:Color="#CCFFCC" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="rowhead_blue">
   <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="����" x:CharSet="134" ss:Size="9"/>
   <Interior ss:Color="#99CCFF" ss:Pattern="Solid"/>
  </Style>
  <Style ss:ID="title">
   <Font ss:FontName="����" x:CharSet="134" ss:Size="14" ss:Bold="1"/>
  </Style>
  <Style ss:ID="money">
  <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="����" x:CharSet="134" ss:Size="9"/>
   <NumberFormat ss:Format="&quot;��&quot; #,##0.00;[Red]&quot;��&quot; -#,##0.00"/>
  </Style>
  <Style ss:ID="money0">
  <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="����" x:CharSet="134" ss:Size="9"/>
   <NumberFormat ss:Format="&quot;��&quot; #,##0.00;[Red]&quot;��&quot; -#,##0.00;"/>
  </Style>
  <Style ss:ID="money_sub">
  <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="����" x:CharSet="134" ss:Size="9"/>
   <NumberFormat ss:Format="[Red]&quot;��&quot; #,##0.00;&quot;��&quot; -#,##0.00"/>
  </Style>
  <Style ss:ID="money0_highlight">
  <Borders>
    <Border ss:Position="Bottom" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Left" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Right" ss:LineStyle="Continuous" ss:Weight="1"/>
    <Border ss:Position="Top" ss:LineStyle="Continuous" ss:Weight="1"/>
   </Borders>
   <Font ss:FontName="����" x:CharSet="134" ss:Size="9"/>
   <NumberFormat ss:Format="[Blue]&quot;��&quot; #,##0.00;[Red]&quot;��&quot; -#,##0.00;"/>
  </Style>
  ${expandStyle }
 </Styles>
 
 <jsp:doBody/>
</Workbook>



