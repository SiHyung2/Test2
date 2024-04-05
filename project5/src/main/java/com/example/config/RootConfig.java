package com.example.config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;

//import javax.activation.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;

@Configuration
@ComponentScan(basePackages={"com.example.service", "org.zerock.service"})
@MapperScan(basePackages= {"com.example.mapper", "org.zerock.mapper"})

public class RootConfig {
	 @Bean
	  public HikariDataSource dataSource() 
	  {
	    HikariConfig hikariConfig = new HikariConfig();
	    
//	    hikariConfig.setDriverClassName("oracle.jdbc.driver.OracleDriver");
//	    hikariConfig.setDriverClassName("oracle.jdbc.OracleDriver");
	    hikariConfig.setDriverClassName("net.sf.log4jdbc.sql.jdbcapi.DriverSpy");
	    hikariConfig.setJdbcUrl("jdbc:log4jdbc:oracle:thin:@localhost:1522:XE");

	    //히카리 드라이버 네트워크타임아웃 안정성을 높이는 코드 (중요하진 않음)
	    hikariConfig.addDataSourceProperty("connectTimeout", "5000");
	    hikariConfig.addDataSourceProperty("socketTimeout", "300000");
	    
	    hikariConfig.setUsername("c##madang");
	    hikariConfig.setPassword("c##madang");

	    HikariDataSource dataSource = new HikariDataSource(hikariConfig);

	    return dataSource;
	  }
	 
	 @Bean
	 public SqlSessionFactory sqlSessionFactory() throws Exception{
		 SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
		 sqlSessionFactory.setDataSource(dataSource());
		return (SqlSessionFactory) sqlSessionFactory.getObject();
	 }
	 
}
