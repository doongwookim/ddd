package svc;

import java.sql.Connection;

import dao.BoardDAO;

import static db.JdbcUtill.*;
import vo.BoardBean;

public class BoardModifyProService {

	public boolean isArticleWriter(int board_num, String pass) {
		boolean isArticleWriter=false;
		Connection con=null;
		try {
			con=getConnection();
			BoardDAO boardDAO=BoardDAO.getInstance();
			boardDAO.setConnction(con);
			isArticleWriter=boardDAO.isArticleBoardWriter(board_num,pass);
						
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(con);
		}
		return isArticleWriter;
	}

	public boolean modifyArticle(BoardBean article) {
		boolean isModifySuccess=false;
		Connection con=null;
		try {
		con=getConnection()	;
		BoardDAO boardDAO=BoardDAO.getInstance();
		boardDAO.setConnction(con);
		int updateCount=boardDAO.updateArticle(article);
		if(updateCount>0) {
			commit(con);
			isModifySuccess=true;
		}else {
			rollback(con);
		}
	
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		return isModifySuccess;
	}



}
