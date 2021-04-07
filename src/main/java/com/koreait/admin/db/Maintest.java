package com.koreait.admin.db;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Scanner;

public class Maintest {

	public static void main(String[] args) {
		
		Scanner sc;
		String file1 = "C:/CODE/category.txt";
		
		String c_big = "";
		String c_middle = "";
		
		// String c_small = "";
		String sql = "";
		Connection conn;
		PreparedStatement pstmt;
		try {
			sc = new Scanner(new FileInputStream(file1));
			conn = Dbconn.getConnection();
			while(sc.hasNextLine()) {    //한줄한줄 가져오기
				String[] str = sc.nextLine().split("%");  //퍼센트로 나누기
				System.out.println(str.length);
				c_big = str[0];
				c_middle = str[1];
				if(str.length == 3) {
					String[] smallstr = str[2].split(",");
					for(String c_small : smallstr) {
						sql = "insert into tb_category(c_big, c_middle, c_small) values(?,?,?)";
						pstmt = conn.prepareStatement(sql);
						pstmt.setString(1, c_big.trim());
						pstmt.setString(2, c_middle.trim());
						pstmt.setString(3, c_small.trim());
						pstmt.executeUpdate();
					}
				}else {  //소분류가 없다면
					sql = "insert into tb_category(c_big, c_middle) values(?,?)";
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, c_big.trim());
					pstmt.setString(2, c_middle.trim());
					pstmt.executeUpdate();
				}
				

			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
