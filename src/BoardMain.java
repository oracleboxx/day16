import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.List;

import com.naver.dao.BoardTest01;

import net.daum.vo.BoardVoTest;


public class BoardMain {

	public static void main(String[] args) {
		BoardTest01 bt = new BoardTest01();
		
		List<BoardVoTest> btest = bt.BoardListTest();
	BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
	// 인풋스트림은 바이트를 문자로 변경
	System.out.print("게시판 번호 입력:");
	int age =Integer.parseInt(br.readLine());
	BoardVoTest bno = bt.getFindNo(age);
	
		if(btest != null && btest.size() >0 ) {
			for(BoardVoTest v:btest) {
				System.out.println(v.getAge()+" "+v.getName()+" "+v.getTel()+" "+
			v.getAddress()+" "+v.getGender());
			}
		}
		else {
			System.out.println("게시물 목록이 없습니다");
		}
	}

}
