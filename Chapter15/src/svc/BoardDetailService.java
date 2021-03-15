package svc;

import java.sql.Connection;

import dao.BoardDAO;

import static db.JdbcUtill.*;
import vo.BoardBean;

public class BoardDetailService {

	public BoardBean getArticle(int board_num) {
		BoardBean article=null;
		Connection con=null;
		try {
			con=getConnection();
			BoardDAO boardDAO=BoardDAO.getInstance();
			boardDAO.setConnction(con);
			
			int updateCount=boardDAO.updateReadCount(board_num);
			if(updateCount>0) {
				commit(con);
			}else {
				rollback(con);
			}
			article=boardDAO.selectArticle(board_num);
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(con);
		}
		return article;
	}

}
