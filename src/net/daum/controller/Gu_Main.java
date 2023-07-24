package net.daum.controller;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Scanner;

import com.naver.dao.Gu2DAOImpl;

import net.daum.vo.Gu2Vo;

public class Gu_Main {

	public static void main(String[] args) {
		
		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "night";
		String password = "123456";
		String sql ;
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement ps = null;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,user,password);
			sql = "select * from tbl_gu order by gno asc";
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
			Gu2DAOImpl gdao = new Gu2DAOImpl();
			Gu2Vo gv = new Gu2Vo();
				Scanner scan = new Scanner(System.in);
				System.out.println("이름 입력:");
			 String gname = scan.next();
			 System.out.println("글 제목");
			 String gtitle = scan.next();
			 System.out.println("글 내용");
			 String gcont = scan.next();
			 gv.setGname(gname);
			 gv.setGtitle(gtitle);
			 gv.setGcont(gcont);
			 
			 
			  gdao.insertGu(gv);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
			if(rs != null)rs.close();
			if(con != null)con.close();
			if(rs != null)rs.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
	
		 
	}

}
