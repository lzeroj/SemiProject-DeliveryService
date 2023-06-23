package org.kosta.semiproject.model;

import javax.sql.DataSource;

import org.apache.tomcat.dbcp.dbcp2.BasicDataSource;

/*
 * 		Database Connection Pool : DBCP
 * 		객체를 생성해 Connection을 빌려주고 반납받는 방식으로 
 * 		시스템을 운영하기 위한 클래스
 * 		다양한 DBCP 구현체가 존재하므로 javax.sql.DataSource 타입으로 관리한다
 * 		( spring 에서도 같은 방식으로 관리 )
 */
public class DataSourceManager {
	private static DataSourceManager instance = new DataSourceManager();
	private DataSource dataSource;
	private DataSourceManager() {
		//apache tomcat에서 제공하는 dhcp를 사용한다
		BasicDataSource dbcp = new BasicDataSource();	
		dbcp.setDriverClassName("oracle.jdbc.OracleDriver");
		dbcp.setUrl("jdbc:oracle:thin:@54.180.83.218:1521:xe");
		dbcp.setUsername("duck");
		dbcp.setPassword("fly");
		this.dataSource=dbcp;
	}
	public static DataSourceManager getInstance() {
		return instance;
	}
	public DataSource getDataSource() {
		return dataSource;
	}
}
