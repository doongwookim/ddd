package svc;

import java.sql.Connection;
import dao.BoardDAO;
import static db.JdbcUtill.*;
import vo.BoardBean;

public class BoardWriteProService {

	public boolean registArticle(BoardBean boardBean) throws Exception{
		boolean isWriteSuccess=false;
		Connection con=null;
		try {
		con=getConnection();
		BoardDAO boardDAO=BoardDAO.getInstance();
		boardDAO.setConnction(con);
		int insertCount=boardDAO.insertArticle(boardBean);
		
		if(insertCount>0) {
			commit(con);
			isWriteSuccess=true;
		}
		else {
			rollback(con);
		}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
		close(con);
		}
		return isWriteSuccess;
	}

}
