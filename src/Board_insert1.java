import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.Statement;
import java.util.Scanner;

// tbl_board 테이블에 레코드 저장 소스
public class Board_insert1 {

	public static void main(String[] args) {
				String driver = "oracle.jdbc.OracleDriver"; // oracle.jdbc는 패키지명, OracleDriver는 jdbc
				//드라이버 클래스명
				String url = "jdbc:oracle:thin:@localhost:1521:xe";
				// 호스트 이름 , 1521은 오라클 연결 포트번호, xe는 데이터 베이스명
				String user ="night"; //오라클 사용자
				String password = "123456";
				
				Connection con = null; //데이터 베이스 연결 con
				Statement stmt = null ; //쿼리문 수행 stmt
				String sql =null;
				try {
					Class.forName(driver); //오라클 jdbc드라이브 클래스 로드
					con = DriverManager.getConnection(url,user,password); 
					//오라클 연결주소, 사용자,비번을 메서드 인자값으로 전달해서 데이터 베이스 연결 con생성
					Scanner scan =new Scanner(System.in);
					System.out.println("tbl_board 테이블에 레코드 저장하기>>");
					System.out.println("글쓴이 입력>>");
					String bname = scan.nextLine();
					System.out.println("글제목 입력>>");
					String btitle = scan.nextLine();
					System.out.println("글내용 입력>>");
					String bcont =scan.nextLine();
					stmt=con.createStatement();
					
					
					
					sql = "insert into tbl_board(bno,bname,btitle,bcont,bdate) values"
							+"(bno_seq.nextval,'"+bname+"','"+btitle+"','"+bcont+"',sysdate)";
					int re =stmt.executeUpdate(sql); // 저장 쿼리문 수행후 성공한 레코드 행의 개수를 반환
					if(re ==1) {
						System.out.println("게시판 저장 성공~");
					}
							
							
					
				}
					catch(Exception e) {
						e.printStackTrace();		
					}
				finally {
					try {
						if(stmt != null) 
							stmt.close();
	
						if(con != null) 
							con.close();
						
					}catch(Exception e) {
						e.printStackTrace();}
					}
				}
					

		}

