package com.naver.dao;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import net.daum.vo.BoardVo;

public class BoardDAOImpl {
	String driver = "oracle.jdbc.OracleDriver"; // oracle.jdbc는 패키지명, OracleDriver는 jdbc
	//드라이버 클래스명
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	// 호스트 이름 , 1521은 오라클 연결 포트번호, xe는 데이터 베이스명
	String user ="night"; //오라클 사용자
	String password = "123456";
	
	Connection con = null; //데이터 베이스 연결 con
PreparedStatement pt =null;
	ResultSet rs =null; //검색 결과 레코드를 저장할 rs
	String sql =null;
	
	
	//게시판 목록
	public List<BoardVo> getBoardList() {
		List<BoardVo> blist =new ArrayList<>();
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url,user,password);
			sql= "insert into BoardTest values(24,'홍길동','010-1111-2222','서울 강남구','남자');";
			pt =con.prepareStatement(sql); //쿼리문을 미리 컴파일 하여 수행할 pt생성
			rs=pt.executeQuery(); //select문 수행 후 검색 결과 레코드를 rs에 저장
			while(rs.next()) {//복수개의 레코드 행을 검색할 때는 while반복문으로 처리
				BoardVo b= new BoardVo();
				b.setBno(rs.getInt("bno")); //bno 컬럼 레코드가 정수숫자이면 getInt()메서드로 가져온다
				b.setBname(rs.getString("bname")); //bname컬럼 레코드가 문자열이면 getString()메서드로
				//가져와서 setter() 메서드에 저장함
				b.setBtitle(rs.getString("btitle"));
				b.setBcont(rs.getNString("bcont"));
				b.setBdate(rs.getNString("bdate"));
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(rs != null)rs.close();
				if(pt != null)pt.close();
				if(con != null)con.close();
				
			}
			catch(Exception e) {
				e.printStackTrace();
				
			}
		}
		return blist;
	}

}
