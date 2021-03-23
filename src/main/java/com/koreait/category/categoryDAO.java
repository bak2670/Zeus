package com.koreait.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.koreait.db.SqlMapConfig;

public class categoryDAO {
   Connection conn;
   PreparedStatement pstmt;
   ResultSet rs;
   String sql = "";
   List<String> middleList = new ArrayList<>();
   List<String> smallList = new ArrayList<>();   
   
   
   SqlSessionFactory ssf = SqlMapConfig.getSqlMapInstance();  // MyBatis와 Mysql 서버를 연동
   SqlSession sqlsession;
   
   public categoryDAO() {
      sqlsession = ssf.openSession(true);   // openSession(true) 설정시 자동 commit
      System.out.println("마이바티스 설정 성공");
   }
   
   
   public List<String> selectMiddle (String big_ct){
      middleList = sqlsession.selectOne("category.middle", big_ct);
      
      // 중복제거
      List<String> resultList = new ArrayList<String>();   
      int middleSize = middleList.size();
      for(int a=0; a < middleSize; a++ ) {
         if(!resultList.contains(middleList.get(a))) {
            resultList.add(middleList.get(a));              
         }
      }
         
      return resultList;
            
   }  
   
   public List<String> selectSmall (String middle_ct){
      smallList = sqlsession.selectOne("category.small",middle_ct );
      return smallList;
      
   
   }
   
   
   
   
   
   
   
   
   
   

}