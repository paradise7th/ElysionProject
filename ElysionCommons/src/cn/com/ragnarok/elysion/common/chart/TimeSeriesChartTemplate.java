package cn.com.ragnarok.elysion.common.chart;

import java.awt.Paint;
import java.awt.Shape;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.DateAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.labels.StandardXYItemLabelGenerator;
import org.jfree.chart.plot.XYPlot;
import org.jfree.chart.renderer.xy.XYItemRenderer;
import org.jfree.chart.renderer.xy.XYLineAndShapeRenderer;
import org.jfree.data.Range;
import org.jfree.data.time.RegularTimePeriod;
import org.jfree.data.time.Second;
import org.jfree.data.time.TimeSeries;
import org.jfree.data.time.TimeSeriesCollection;


public class TimeSeriesChartTemplate implements ChartTemplate {

  private TimeSeries tsData;
  private boolean showLine=true;
  private boolean showShape=false;
  private boolean showLabel=false;
  private String dateFormat;
  private Range valueRange;
  private Paint linePaint;
  private Shape shapePaint;



  public TimeSeriesChartTemplate() {
  }



  public void clearData(){
    if(tsData!=null){
      tsData.clear();
    }
  }

  public void setData(TimeSeries ts){
    this.tsData=ts;
  }

  public void initData(String name){
    if(tsData==null){
      tsData=new TimeSeries(name);
    }
  }

  public void addData(Date time,double value){
    addData(new Second(time),value);
  }

  public void addData(RegularTimePeriod time,double value){
    if(tsData!=null){
      tsData.addOrUpdate(time,value);
    }
  }

  public JFreeChart buildChart(String title,String x,String y,boolean legend){
    JFreeChart chart=ChartFactory.createTimeSeriesChart(title,x,y,new TimeSeriesCollection(tsData),legend,false,false);
    
    XYPlot plot= chart.getXYPlot();
    XYItemRenderer render = plot.getRenderer();
    if (render instanceof XYLineAndShapeRenderer)
    {
      XYLineAndShapeRenderer xyrender = (XYLineAndShapeRenderer)render;
      xyrender.setBaseShapesVisible(showShape);
      xyrender.setBaseLinesVisible(showLine);
      if(showLabel){
        render.setBaseItemLabelGenerator(new StandardXYItemLabelGenerator());
        render.setBaseItemLabelsVisible(true);
      }

      if(linePaint!=null){
        xyrender.setSeriesPaint(0, linePaint);
      }
      if(shapePaint!=null){
        xyrender.setSeriesShape(0, shapePaint);
      }

    }

    DateAxis dateAxis = (DateAxis)plot.getDomainAxis();
    if(dateFormat!=null){
      dateAxis.setDateFormatOverride(new SimpleDateFormat(dateFormat));
    }
    dateAxis.setUpperMargin(0.10);
    //dateAxis.setTickUnit(new DateTickUnit(DateTickUnit.YEAR,1));
    NumberAxis numberAxis=(NumberAxis)plot.getRangeAxis();
    numberAxis.setAutoRangeIncludesZero(true);
    if(valueRange!=null){
      numberAxis.setAutoRange(false);
      numberAxis.setRange(valueRange);
    }
    numberAxis.setUpperMargin(0.10);

    return chart;
  }

  public void setDateFormat(String dateFormat) {
    this.dateFormat = dateFormat;
  }

  public void setLinePaint(Paint linePaint) {
    this.linePaint = linePaint;
  }

  public void setShapePaint(Shape shapePaint) {
    this.shapePaint = shapePaint;
  }

  public void setShowLine(boolean showLine) {
    this.showLine = showLine;
  }

  public void setShowShape(boolean showShape) {
    this.showShape = showShape;
  }

  public void setShowLabel(boolean showLabel) {
    this.showLabel = showLabel;
  }

  public void setRange(double min,double max){
    this.valueRange=new Range(min,max);
  }

}
