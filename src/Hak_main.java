import java.util.List;
import java.util.Scanner;

import com.naver.dao.Hak_DAO;

import net.daum.vo.Hak_vo;

public class Hak_main {

    public static void main(String[] args) {
        Scanner scan = new Scanner(System.in);
        String driver = "oracle.jdbc.OracleDriver";
        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String user = "night";
        String password = "123456";

        Hak_DAO hakDao = new Hak_DAO(); // Create a Hak_DAO object

        try {
            Class.forName(driver);
            Hak_vo hv = new Hak_vo(); // Create a Hak_vo object

            System.out.println("테이블에 레코드 저장하기 >>");
            System.out.println("나이 입력:");
            hv.setAge(Integer.parseInt(scan.next()));
            System.out.println("이름 입력 >>");
            hv.setName(scan.next());
            System.out.println("주소 입력 >>");
            hv.setAddress(scan.next());
            System.out.println("번호 입력 >>");
            hv.setTel(scan.next());
            System.out.println("성별 입력 >>");
            hv.setGender(scan.next());
            System.out.println("직업 입력 >>");
            hv.setJob(scan.next());

            int re = hakDao.Hak_insert(hv); // Call the Hak_insert method of Hak_DAO to insert the data
            if (re == 1) {
                System.out.println("게시판 저장 성공~");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            scan.close();
        }
        List<Hak_vo> hakList = hakDao.getHakList();

     // Display the retrieved data
     System.out.println("=== Data Retrieved from Database ===");
     for (Hak_vo hv : hakList) {
    	 System.out.println("Age: "+ hv.getAge());
         System.out.println("Name: " + hv.getName());
         System.out.println("Address: " + hv.getAddress());
         System.out.println("Tel: " + hv.getTel());
         System.out.println("Gender: " + hv.getGender());
         System.out.println("Job: " + hv.getJob());
         System.out.println("--------------------");
     }
    }
    
}