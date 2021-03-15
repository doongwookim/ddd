package svc;

import java.sql.Connection;

import dao.BoardDAO;

import static db.JdbcUtill.*;
import vo.BoardBean;

public class BoardReplyProService {

	public boolean replyArticle(BoardBean article) {
		boolean isReplySuccess=false;
		Connection con=null;
		try {
			con=getConnection();
			BoardDAO boardDAO=BoardDAO.getInstance();
			boardDAO.setConnction(con);
			int insertCount=boardDAO.insertReplyArticle(article);
			
			if(insertCount>0) {
				commit(con);
				isReplySuccess=true;
			}else {
				rollback(con);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return isReplySuccess;
	}

}
