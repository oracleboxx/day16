import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import net.daum.vo.Board_vo;

public class Board_Insert_list {
	public static void main(String[] args) {
		Scanner scan = new Scanner(System.in);

		String driver = "oracle.jdbc.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:xe";
		String user = "night";
		String password = "123456";
		String sql ;
		Connection con = null;
		ResultSet rs = null;
		PreparedStatement prs = null;


		try {

			Class.forName(driver);
	        con = DriverManager.getConnection(url, user, password);
			System.out.println("나이 입력:");
			int age = scan.nextInt();

			System.out.println("이름 입력");
			String name = scan.next();

			System.out.println("전화번호 입력:");
			String tel =scan.next();

			System.out.println("지역 입력:");
			String address = scan.next();

			System.out.println("성별 입력:");
			String gender = scan.next();

			sql = "insert into BoardTest values(?,?,?,?,?)";
			prs = con.prepareStatement(sql);
			prs.setInt(1, age);//쿼리문의 첫번째 물음표에 정수 숫자로 나이를 저장
			prs.setString(2, name);
			prs.setString(3,tel);
			prs.setString(4,address);
            prs.setNString(5,gender);
			
			int re=prs.executeUpdate();//저장 쿼리문 수행 후 성공한 레코드 행의 개수를 반환

			if(re==1) {
				sql="select * from boardTest order by age asc";
				prs=con.prepareStatement(sql);
				rs = prs.executeQuery();//검색 문 실행후 검색 결과 레코드를 rs에 저장
				System.out.println("나이 \t 이름 \t 전화번호 \t 주소 \t  성별");
				System.out.println("=========================================>");
				while(rs.next()) {
					System.out.println(rs.getInt("age")+"\t"+ rs.getString("name") +"\t" +rs.getString("tel") +"\t "
					+rs.getString("address") +"\t "+rs.getString("gender"));
				}
			}//if
		}
		catch(Exception e) {
			e.printStackTrace();
			System.out.println("DB계정 불일치");
		}
		finally {
			try {
				if(rs != null)rs.close();
				if(prs != null)prs.close();
				if(con != null)con.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
	}

}
