package com.koreait.db;

import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

public class SqlMapConfig {
	private static SqlSessionFactory sqlsession;
	
	// static{} : 단 한번만 실행되고 더이상 실행되지 않는다.
	static {
		try {
			String resource = "com/koreait/db/config.xml";	// 리소스(설정파일)등록
			Reader reader = Resources.getResourceAsReader(resource);	// 
			sqlsession = new SqlSessionFactoryBuilder().build(reader);		// myBatis 사용 가능한 세션 객체 생성
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
	}
	public static SqlSessionFactory getSqlMapInstance() {
		return sqlsession;
	}
}
