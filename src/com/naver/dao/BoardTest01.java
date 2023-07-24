package com.naver.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import net.daum.vo.BoardVoTest;

public class BoardTest01 {

	String driver = "oracle.jdbc.OracleDriver"; // oracle.jdbc는 패키지명, OracleDriver는 jdbc
	// 드라이버 클래스명
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	// 호스트 이름 , 1521은 오라클 연결 포트번호, xe는 데이터 베이스명
	String user = "night"; // 오라클 사용자
	String password = "123456";

	Connection con = null; // 데이터 베이스 연결 con
	PreparedStatement pt = null;
	ResultSet rs = null; // 검색 결과 레코드를 저장할 rs
	String sql = null;
	Scanner scan = new Scanner(System.in);

	public List<BoardVoTest> BoardListTest() {
		List<BoardVoTest> btest = new ArrayList<>();

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, user, password);

			System.out.println("나이 입력:");
			int age = scan.nextInt();

			System.out.println("이름 입력:");
			String name = scan.next();

			System.out.println("전화번호 입력:");
			String tel = scan.next();

			System.out.println("지역 입력:");
			String address = scan.next();

			System.out.println("성별 입력:");
			String gender = scan.next();

			sql = "insert into BoardTest01 values(?,?,?,?,?)";
			pt = con.prepareStatement(sql);
			pt.setInt(1, age);
			pt.setString(2, name);
			pt.setString(3, tel);
			pt.setString(4, address);
			pt.setString(5, gender);
			int re = pt.executeUpdate();
			if (re == 1) {
				sql = "select * from BoardTest01 order by age ";
				pt = con.prepareStatement(sql);
				rs = pt.executeQuery();
				System.out.println("나이 \t 이름 \t 전화번호 \t 주소 \t  성별");
				System.out.println("=========================================>");
				while (rs.next()) {
					System.out.println(rs.getInt("age") + "\t" + rs.getString("name") + "\t" + rs.getString("tel")
							+ "\t " + rs.getString("address") + "\t " + rs.getString("gender"));
				}
			} else {
				System.out.println("등록된게 없습니다");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return btest;

	}
	//번호값 검색
	public BoardVoTest getFindNo(int age) {
		BoardVoTest bt = null;
		try {
			Class.forName(driver);
			con=DriverManager.getConnection(url, user,password);
			sql =" select * from BoardTest01 where bno =?";
			pt= con.prepareStatement(sql);
			rs = pt.executeQuery();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs != null) rs.close();
				if(pt != null) pt.close();
				if(con != null) con.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
		
	}


