import java.util.List;

import com.naver.dao.BoardDAOImpl;

import net.daum.vo.BoardVo;

public class Board_list {

	public static void main(String[] args) {
		BoardDAOImpl bdao = new BoardDAOImpl();
		List<BoardVo> blist = bdao.getBoardList();
		System.out.println("게시판 목록>>>");
		System.out.println("번호 \t 제목 \t 글쓴이 \t 글내용 \t 등록날짜");
		System.out.println("===============================");
		if(blist != null && blist.size() >0 ) {
			for(BoardVo b:blist) {
				System.out.println(b.getBno()+" "+b.getBtitle()+" "+b.getBname()+" "+
			b.getBcont()+" "+b.getBdate());
			}
		}
		else {
			System.out.println("게시물 목록이 없습니다");
		}
	}

}
