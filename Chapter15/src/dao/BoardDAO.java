package dao;

import static db.JdbcUtill.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.sql.DataSource;
import vo.BoardBean;

public class BoardDAO {
	
	DataSource ds;
	Connection con;
	private static BoardDAO boardDAO;

	public static BoardDAO getInstance() {
		if(boardDAO==null) {
			boardDAO=new BoardDAO();
		}
		return boardDAO;
	}

	public void setConnction(Connection con) {
		this.con=con;
		
		
	}

	public int insertArticle(BoardBean article) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int num=0;
		String sql="";
		int insertCount=0;
		
		try {
			pstmt=con.prepareStatement("select max(board_num) from board");
			rs=pstmt.executeQuery();
			if(rs.next())
				num=rs.getInt(1)+1;
			else
				num=1;
//				
//			sql="insert into board (BOARD_NUM,BOARD_NAME,BOARD_PASS,BOARD_SUBJECT,";
//			sql+="BOARD_CONTENT,BOARD_FILE,BOARD_RE_REF,"+"BOARD_RE_LEV,BOARD_RE_SEQ,BOARD_READCOUNT,"+"BOARD_DATE) values(?,?,?,?,?,?,?,?,?,?,now())";
//			
			sql="insert into board values(?,?,?,?,?,?,?,0,0,0,now())";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBOARD_NAME());
			pstmt.setString(3, article.getBOARD_PASS());
			pstmt.setString(4, article.getBOARD_SUBJECT());
			pstmt.setString(5, article.getBOARD_CONTENT());
			pstmt.setString(6, article.getBOARD_FILE());
			pstmt.setInt(7, num);
//			pstmt.setInt(8, 0);
//			pstmt.setInt(9, 0);
//			pstmt.setInt(10, 0);
			
			insertCount=pstmt.executeUpdate();
					
		}catch(Exception ex) {
			System.out.println("boardInsert 에러 : "+ex);
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return insertCount;
	}

	public int selectListCount() {
		int listCount=0;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=con.prepareStatement("select count(*) from board" );
			rs=pstmt.executeQuery();
			
			if(rs.next())listCount=rs.getInt(1);
		}catch(Exception e) {
			System.out.println("getListCount 애러"+e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return listCount;
	}

	public ArrayList<BoardBean> selectArticleList(int page, int limit) {
		ArrayList<BoardBean>list=new ArrayList<BoardBean>();
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String board_list_sql="select * from board order by BOARD_RE_REF desc,BOARD_RE_SEQ asc limit ? , ?";
		
		int startrow=(page-1)*limit;
		
		try {
			pstmt=con.prepareStatement(board_list_sql);
			pstmt.setInt(1, startrow);
			pstmt.setInt(2, limit);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				BoardBean boardBean=new BoardBean();
				boardBean.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				boardBean.setBOARD_NAME(rs.getString("BOARD_NAME"));
				boardBean.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				boardBean.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				boardBean.setBOARD_FILE(rs.getString("BOARD_FILE"));
				boardBean.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				boardBean.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				boardBean.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				boardBean.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				boardBean.setBOARD_DATE(rs.getDate("BOARD_DATE"));
				list.add(boardBean);
			}
		}catch(Exception e){
			System.out.println("getBoardList 에러"+e);
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int updateReadCount(int board_num) {
		int updateCount=0;
		PreparedStatement pstmt=null;
		String sql="update board set BOARD_READCOUNT = BOARD_READCOUNT+1 where BOARD_NUM = ?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			updateCount=pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return updateCount;
	}

	public BoardBean selectArticle(int board_num) {
		BoardBean article = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from board where board_num = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				article = new BoardBean();
				article.setBOARD_NUM(rs.getInt("BOARD_NUM"));
				article.setBOARD_NAME(rs.getString("BOARD_NAME"));
				article.setBOARD_SUBJECT(rs.getString("BOARD_SUBJECT"));
				article.setBOARD_CONTENT(rs.getString("BOARD_CONTENT"));
				article.setBOARD_FILE(rs.getString("BOARD_FILE"));
				article.setBOARD_RE_REF(rs.getInt("BOARD_RE_REF"));
				article.setBOARD_RE_LEV(rs.getInt("BOARD_RE_LEV"));
				article.setBOARD_RE_SEQ(rs.getInt("BOARD_RE_SEQ"));
				article.setBOARD_READCOUNT(rs.getInt("BOARD_READCOUNT"));
				article.setBOARD_DATE(rs.getDate("BOARD_DATE"));
			}
		} catch (Exception e) {
			System.out.println("getDetail 에러 : " +e);
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return article;
	}


	public boolean isArticleBoardWriter(int board_num, String pass) {
		boolean isWriter=false;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from board where BOARD_NUM = ? and BOARD_PASS= ?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			pstmt.setString(2, pass);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				isWriter=true;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return isWriter;
	}
	
	

	public int updateArticle(BoardBean article) {
		int updateCount=0;
		PreparedStatement pstmt=null;
		String sql="update board set BOARD_SUBJECT = ? , BOARD_CONTENT = ? where BOARD_NUM = ?";
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, article.getBOARD_SUBJECT());
			pstmt.setString(2, article.getBOARD_CONTENT());
			pstmt.setInt(3, article.getBOARD_NUM());
			updateCount=pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return updateCount;
	}

	public int insertReplyArticle(BoardBean article) {
		int insertCount=0;
		
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			//sql 업데이터
			String sql="update board set BOARD_RE_SEQ = BOARD_RE_SEQ+1 where BOARD_RE_REF = ? and BOARD_RE_SEQ> ? ";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, article.getBOARD_RE_REF());
			pstmt.setInt(2, article.getBOARD_RE_SEQ());
			
			pstmt.executeUpdate();
			//입력할 글의 번호 생성
			int num=1;
			pstmt=con.prepareStatement("select max(BOARD_NUM) from board");
			rs=pstmt.executeQuery();
			if(rs.next())
				num=rs.getInt(1)+1;
			
			//답글 입력
			sql="insert into board value (?,?,?,?,?,'',?,?,?,0,now())";
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, article.getBOARD_NAME());
			pstmt.setString(3, article.getBOARD_PASS());
			pstmt.setString(4, article.getBOARD_SUBJECT());
			pstmt.setString(5, article.getBOARD_CONTENT());
			pstmt.setInt(6, article.getBOARD_RE_REF());
			pstmt.setInt(7, article.getBOARD_RE_LEV()+1);
			pstmt.setInt(8, article.getBOARD_RE_SEQ()+1);
			insertCount=pstmt.executeUpdate();
			
		}catch(Exception e){
			rollback(con);
			e.printStackTrace();
		
		}finally {
			close(rs);
			close(pstmt);
		}
		return insertCount;
	}

	public int deleteArticle(int board_num) {
		PreparedStatement pstmt=null;
		String sql="delete from board where BOARD_NUM= ?";
		int deleteCount=0;
		
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_num);
			deleteCount=pstmt.executeUpdate();
		}catch(Exception e) {
			System.out.println("boardDelete 에러"+e);
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return deleteCount;
	}

	
}
