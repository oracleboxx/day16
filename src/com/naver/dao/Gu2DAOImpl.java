package com.naver.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import net.daum.vo.Gu2Vo;

public class Gu2DAOImpl {
	String driver = "oracle.jdbc.driver.OracleDriver";

	String url = "jdbc:oracle:thin:@localhost:1521:xe";

	String user = "night";
	String password = "123456";
String sql; // 쿼리문 저장변수
	Connection con = null;// 쿼리문 연결 실행
	PreparedStatement ps = null;//쿼리문 수행 
	ResultSet rs = null;// 검색 결과 레코드를 저장
	Scanner scan = new Scanner(System.in);
	
		public int insertGu(Gu2Vo g) {
			int re =-1;
			try {
				Class.forName(driver);
			con = DriverManager.getConnection(url,user,password);
			sql = "insert into tbl_gu values(gno_seq10.nextval, ?,?,?,sysdate)";
			
			ps = con.prepareStatement(sql); // 쿼리문을 미리 컴파일 하여 수행할 pt생성
			
			ps.setString(1, g.getGname());
			ps.setString(2, g.getGtitle());
			ps.setString(3, g.getGcont());
			
			re = ps.executeUpdate(); //저장 쿼리문 수행 후 성공한 레코드 행의 개수를 반환
			if(re == 1) {
				System.out.println("데이터 저장성공");
			}else {
				System.out.println("데이터 저장실패");
			}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(con != null)con.close();
					if(ps != null)ps.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			
			}
			
			return re;
		}
		public List<Gu2Vo> getGulist(){
			List<Gu2Vo>  glist = new ArrayList<>();
			try {
				con = DriverManager.getConnection(url,user,password);
				sql = "select * from tbl_gu order by gno ";
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while(rs.next()) {
					Gu2Vo gv =new Gu2Vo();
					
					gv.setGno(rs.getInt("gno"));
					gv.setGname(rs.getString("gname"));
					gv.setGtitle(rs.getString("gtitle"));
					gv.setGcont(rs.getNString("gcont"));
					gv.setGdate(rs.getNString("gdate"));
					glist.add(gv);
				}
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(rs != null)rs.close();
					if(con != null)con.close();
					if(ps != null )ps.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
			return glist;
		}

}
