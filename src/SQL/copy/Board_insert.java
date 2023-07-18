package SQL.copy;

import java.sql.Connection;

// tbl_board 테이블에 레코드 저장 소스
public class Board_insert {

	public static void main(String[] args) {
		String = "oracla.jdbc.OracleDriver"; // oracle.jdbc는 패키지명, OracleDriver는 jdbc
		//드라이버 클래스명
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		// 호스트 이름 , 1521은 오라클 연결 포트번호, xe는 데이터 베이스명
		String user ="night"; //오라클 사용자
		String password = "123456";
		
		Connection con = null; //데이터 베이스 연결 con
		Statement stmt = null ; //쿼리문 수행 stmt
		
	}

}
