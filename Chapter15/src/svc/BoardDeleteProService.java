package svc;

import java.sql.Connection;
import java.sql.ResultSet;
import static db.JdbcUtill.*;
import dao.BoardDAO;

public class BoardDeleteProService {

	public boolean isArticleWriter(int board_num, String pass) {
		boolean isArticleWriter=false;
		Connection con=null;
		BoardDAO boardDAO=BoardDAO.getInstance();
		boardDAO.setConnction(con);
		isArticleWriter=boardDAO.isArticleBoardWriter(board_num, pass);
		close(con);
			
		return isArticleWriter;
	}
	public boolean removeArticle(int board_num) {
		boolean isRemoveSuccess=false;
		
			Connection con=getConnection();
			BoardDAO boardDAO=BoardDAO.getInstance();
			boardDAO.setConnction(con);
			
				int deleteCount=boardDAO.deleteArticle(board_num);
				
				if(deleteCount>0) {
					commit(con);
					isRemoveSuccess=true;
				}else {
					rollback(con);
				}
			
			close(con);
		return isRemoveSuccess;
	}

}
