package com.naver.dao;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.daum.vo.Jdbc_vo;

public class Jdbc_Dao {
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "night";
	String password = "123456";
	String sql;
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));

	public  void Jdbc_insert(Jdbc_vo jdbcVo) {
		List<Jdbc_vo> jv = new ArrayList<>();

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user ,password);
			
			
		
			
			sql = "insert into JDBC_Test values(?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
		     ps.setInt(1, jdbcVo.getEmpNo());
	            ps.setString(2, jdbcVo.getEmpName());
	            ps.setString(3, jdbcVo.getJob());
	            ps.setInt(4, jdbcVo.getSal());
	            ps.setInt(5, jdbcVo.getComm());
	            ps.setInt(6, jdbcVo.getDeptNo());
			int re =ps.executeUpdate();
			if(re == 1) {
				sql = "select * from JDBC_Test order by empNo";
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				System.out.println("번호\t 이름 \t 직업 \t 월급 \t 보너스 \t 사원번호");
				System.out.println("=========================================>");
				while (rs.next()) {
					System.out.println(rs.getInt("empNo") + "\t" + rs.getString("empName") + "\t" + rs.getString("job")
					+ "\t " + rs.getInt("sal") + "\t " + rs.getInt("comm") + "\t" + rs.getInt("deptNo"));
				}
			}
			else {
				System.out.println("등록된게 없습니다");
			}
		}
			catch(Exception e) {
				e.printStackTrace();
			}
			





		
	} //list
} //dao