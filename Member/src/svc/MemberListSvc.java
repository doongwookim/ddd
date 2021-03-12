package svc;

import java.sql.Connection;
import java.util.ArrayList;
import dao.MemberDAO;
import vo.MemberBean;
import static db.JdbcUtil.*;

public class MemberListSvc {

	public int getListCount() {
		int listCount = 0;
		Connection con = null;
		
		try {
			con = getConnection();
			MemberDAO memberDao = MemberDAO.getInstance();
			memberDao.setConnection(con);
			listCount = memberDao.selectListCount();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}		
		return listCount;
	}

	public ArrayList<MemberBean> getMemberList(int page, int limit) {
		ArrayList<MemberBean> list = null;
		Connection con = null;
		try {
			con = getConnection();
			MemberDAO memberDao = MemberDAO.getInstance();
			memberDao.setConnection(con);
			list = memberDao.selectListCount(page, limit);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(con);
		}
		return list;
	}

}
