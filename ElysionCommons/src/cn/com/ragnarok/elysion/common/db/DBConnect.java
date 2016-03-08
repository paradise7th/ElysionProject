﻿package cn.com.ragnarok.elysion.common.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Arrays;
import java.util.Hashtable;
import java.util.Timer;
import java.util.TimerTask;
import java.util.Vector;

import cn.com.ragnarok.elysion.common.util.ConfigLoader;

public class DBConnect {
	private final static org.apache.log4j.Logger log = org.apache.log4j.LogManager
			.getLogger(DBConnect.class);

	private static final String DATABASE="database";
	private static DBConnect instance = null;
	
	private Connection m_Con = null;
	String driver = "";

	String connUrl = "";

	String user = "";

	String password ="";

	int keepTime = 0;

	String keepSql ="";
	String columnCase="";
	
	
	public DBConnect() {
		
	}

	public static DBConnect getInstance() {
		if (instance == null) {
			instance = new DBConnect();
			instance.init(DATABASE);
		}
		return instance;
	}
	
	
	
	protected void init(String option) {
		driver = ConfigLoader.getInstance().getValue(option, "driver","");
		connUrl = ConfigLoader.getInstance().getValue(option, "url", "");
		user = ConfigLoader.getInstance().getValue(option, "user", "");
		password = ConfigLoader.getInstance().getValue(option,"password", "");
		keepTime = ConfigLoader.getInstance().getIntValue(option,"keep_time", 0);
		keepSql = ConfigLoader.getInstance().getValue(option,"keep_sql", "select 1");
		columnCase=ConfigLoader.getInstance().getValue(option, "column_case","");

		if (keepTime > 5000) {
			Timer timer = new Timer();
			timer.schedule(new KeepTask(), keepTime, keepTime);
		}
	}

	public Connection getDBConnect() {
		try {
			if (m_Con == null || m_Con.isClosed()) {
				Class.forName(driver);
				m_Con = java.sql.DriverManager.getConnection(connUrl, user,
						password);
			}
		} catch (Exception e) {
			log.warn("connect fail", e);
		}
		return m_Con;
	}
	
	public void closeConnection(){
		if(m_Con!=null){
			try {
				m_Con.close();
			} catch (SQLException e) {
			}
			m_Con=null;
		}
	}

	public Vector getResultStringSql(String sql) {
		log.debug("sql:" + sql);
		Vector data = new Vector();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = getDBConnect().createStatement();
			rs = st.executeQuery(sql);
			ResultSetMetaData rsmt = rs.getMetaData();
			int count = rsmt.getColumnCount();
			while (rs.next()) {
				Hashtable row = new Hashtable();
				for (int i = 1; i <= count; i++) {
					String value = rs.getString(i);
					if (value == null) {
						value = "";
					}
					row.put(formatColumn(rsmt.getColumnLabel(i)), value);
				}
				data.add(row);
			}
		} catch (Exception e) {
			log.warn("query fail", e);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (st != null) {
				try {
					st.close();
				} catch (SQLException ex1) {
				}
			}
		}
		log.debug("result:" + data.size());
		return data;

	}

	public Vector getResultObjectSql(String sql) {
		log.debug("sql:" + sql);
		Vector data = new Vector();
		Statement st = null;
		ResultSet rs = null;
		try {
			st = getDBConnect().createStatement();
			rs = st.executeQuery(sql);
			ResultSetMetaData rsmt = rs.getMetaData();
			int count = rsmt.getColumnCount();
			while (rs.next()) {
				Hashtable row = new Hashtable();
				for (int i = 1; i <= count; i++) {
					Object value = rs.getObject(i);
					if (value == null) {
						value = "";
					}
					row.put(formatColumn(rsmt.getColumnLabel(i)), value);
				}
				data.add(row);
			}
		} catch (Exception e) {
			log.warn("query fail", e);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (st != null) {
				try {
					st.close();
				} catch (SQLException ex1) {
				}
			}
		}
		log.debug("result:" + data.size());
		return data;

	}
	
	private String formatColumn(String col){
		if(columnCase.length()==0){
			return col;
		}else if(columnCase.equalsIgnoreCase("lowercase")){
			return col.toLowerCase();
		}else if(columnCase.equalsIgnoreCase("uppercase")){
			return col.toUpperCase();
		}else{
			return col;
		}
		
	}


	public int updateSql(String sql, Object... params) {
		log.debug("sql:" + sql);
		log.debug("params:"+Arrays.toString(params));
		int result = -1;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			if (params == null) {
				params = new Object[] {};
			}
			st = getDBConnect().prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				st.setObject(i + 1, params[i]);
			}
			result = st.executeUpdate();

		} catch (Exception e) {
			log.warn("update fail", e);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (st != null) {
				try {
					st.close();
				} catch (SQLException ex1) {
				}
			}
		}
		log.debug("updates:" + result);
		return result;
	}


	public Vector getResultObjectSql(String sql, Object... params) {
		log.debug("sql:" + sql);
		log.debug("params:"+Arrays.toString(params));
		Vector data = new Vector();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			if (params == null) {
				params = new Object[] {};
			}
			st = getDBConnect().prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				st.setObject(i + 1, params[i]);
			}

			rs = st.executeQuery();
			ResultSetMetaData rsmt = rs.getMetaData();
			int count = rsmt.getColumnCount();
			while (rs.next()) {
				Hashtable row = new Hashtable();
				for (int i = 1; i <= count; i++) {
					Object value = rs.getObject(i);
					if (value == null) {
						value = "";
					}
					row.put(formatColumn(rsmt.getColumnLabel(i)), value);
				}
				data.add(row);
			}
		} catch (Exception e) {
			log.warn("query fail", e);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (st != null) {
				try {
					st.close();
				} catch (SQLException ex1) {
				}
			}
		}
		log.debug("result:" + data.size());
		return data;

	}
	
	public Vector getResultStringSql(String sql, Object... params) {
		log.debug("sql:" + sql);
		log.debug("params:"+Arrays.toString(params));
		Vector data = new Vector();
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			if (params == null) {
				params = new Object[] {};
			}
			st = getDBConnect().prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				st.setObject(i + 1, params[i]);
			}

			rs = st.executeQuery();
			ResultSetMetaData rsmt = rs.getMetaData();
			int count = rsmt.getColumnCount();
			while (rs.next()) {
				Hashtable row = new Hashtable();
				for (int i = 1; i <= count; i++) {
					String value = rs.getString(i);
					if (value == null) {
						value = "";
					}
					row.put(formatColumn(rsmt.getColumnLabel(i)), value);
				}
				data.add(row);
			}
		} catch (Exception e) {
			log.warn("query fail", e);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (st != null) {
				try {
					st.close();
				} catch (SQLException ex1) {
				}
			}
		}
		log.debug("result:" + data.size());
		return data;

	}
	


	
	public Object scaleResultSql(String sql,Object... params){
		log.debug("sql:" + sql);
		log.debug("params:"+Arrays.toString(params));
		Object obj=null;
		PreparedStatement st = null;
		ResultSet rs = null;
		try {
			if (params == null) {
				params = new Object[] {};
			}
			st = getDBConnect().prepareStatement(sql);
			for (int i = 0; i < params.length; i++) {
				st.setObject(i + 1, params[i]);
			}

			rs = st.executeQuery();
			if(rs.next()){
				obj=rs.getObject(1);
			}
		} catch (Exception e) {
			log.warn("query fail", e);
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			}
			if (st != null) {
				try {
					st.close();
				} catch (SQLException ex1) {
				}
			}
		}
		log.debug("result:" + obj);
		return obj;
	}
	

	public class KeepTask extends TimerTask {
		public void run() {
			Statement st = null;
			ResultSet rs = null;
			try {
				st = getDBConnect().createStatement();
				rs = st.executeQuery(keepSql);
			} catch (Exception e) {
				log.warn("keep task query fail", e);
				if(e.getMessage().contains("Connection")){
					log.warn("try to reConnect...");
					m_Con=null;
					getDBConnect();
				}
			} finally {
				if (rs != null) {
					try {
						rs.close();
					} catch (SQLException ex) {
					}
				}
				if (st != null) {
					try {
						st.close();
					} catch (SQLException ex1) {
					}
				}
			}
		}

	}
}
