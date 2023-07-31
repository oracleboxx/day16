package com.naver.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.daum.vo.Hak_vo;

public class Hak_DAO {

	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "night";
	String password = "123456";
	String sql;
	Connection con = null;
	ResultSet rs = null;
	PreparedStatement ps = null;

	public int Hak_insert(Hak_vo hv) {
		int re = -1;
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);

			sql = "insert into HakTable values(?,?,?,?,?,?)";
			ps = con.prepareStatement(sql);
			ps.setInt(1, hv.getAge());
			ps.setString(2, hv.getName());
			ps.setString(3, hv.getTel());
			ps.setString(4, hv.getAddress());
			ps.setString(5, hv.getGender());
			ps.setString(6, hv.getJob());

			re = ps.executeUpdate();

			if (re == 1) {

				System.out.println("게시판 저장 성공~");
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return re;
	}




	public List<Hak_vo> getHakList() {
		List<Hak_vo> hakList = new ArrayList<>();
		// ... (existing code)

		// Method to execute SELECT query

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);

			sql = "SELECT * FROM HakTable ORDER BY age ASC"; // You can change 'age' to the appropriate column for
																// ordering

			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				Hak_vo hv = new Hak_vo();
				hv.setAge(rs.getInt("age"));
				hv.setName(rs.getString("name"));
				hv.setAddress(rs.getString("address"));
				hv.setTel(rs.getString("tel"));
				hv.setGender(rs.getString("gender"));
				hv.setJob(rs.getString("job"));

				hakList.add(hv);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (con != null)
					con.close();
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

		return hakList;

	}
}
