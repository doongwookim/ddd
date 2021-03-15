package svc;

import java.sql.Connection;
import static db.JdbcUtill.*;
import dao.BoardDAO;
import vo.BoardBean;

public class BoardModifyFormSvc {

	public BoardBean getArticle(int board_num) {
		BoardBean article=null;
		Connection con=null;
		
		try {
			con=getConnection();
			BoardDAO boardDAO=BoardDAO.getInstance();
			boardDAO.setConnction(con);
			article=boardDAO.selectArticle(board_num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return article;
	}

}
