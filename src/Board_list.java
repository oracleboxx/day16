import java.util.List;

import net.daum.vo.BoardVo;

public class Board_list {

	public static void main(String[] args) {
		BoardDAOImpl bdao = new BoardDAOImpl();
		List<BoardVo> blist = bdao.getBoardList();
	}

}
