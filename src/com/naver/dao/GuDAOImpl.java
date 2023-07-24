package com.naver.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import net.daum.vo.Gu2Vo;
import net.daum.vo.GuVo;

public class  GuDAOImpl {
	String driver = "oracle.jdbc.OracleDriver";

	String url = "jdbc:oracle:thin:@localhost:1521:xe";

	String user = "night";
	String password = "123456";
String sql;
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	Scanner scan = new Scanner(System.in);
	int re = -1;
	public int insertGu(GuVo g) {
		try {
			
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);
			
			
			
			
			
			sql = "insert into tbl_gu2 values(gno_seq10.nextval,?,?,?,sysdate)";
			ps = con.prepareStatement(sql);

			
			ps.setString(1, g.getGname());
			ps.setString(2, g.getGtitle());
			ps.setString(3, g.getGcont());
			
			re = ps.executeUpdate();
			if(re ==1 ) {
				System.out.println("데이터 저장성공 ");
			}
			else {
				System.out.println("데이터 저장실패");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(con != null) con.close();
				if(rs  != null )rs.close();
				if(ps != null)ps.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return re;

	}
	public List<GuVo> GuList(){
		List<GuVo> lg = new ArrayList();
		
		try {
		Class.forName(driver);
		con = DriverManager.getConnection(url, user ,password);
		sql = "select * from tbl_gu order by gno asc";
		ps = con.prepareStatement(sql);
		rs = ps.executeQuery();
		while(rs.next()) {
			Gu2Vo gv = new Gu2Vo();
			gv.setGname(rs.getString("gname"));
			gv.setGtitle(rs.getString("gtitle"));
			gv.setGcont(rs.getString("gcont"));
			
		}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return lg;
	}
	
}
