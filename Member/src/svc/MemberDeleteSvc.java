package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import dao.MemberDAO;

public class MemberDeleteSvc {

	public boolean deleteMember(String id) {
		boolean isDeleteSuccess=false;
		Connection con=null;
		try {
			con=getConnection();
			MemberDAO memberDao=MemberDAO.getInstance();
			memberDao.setConnection(con);
			
			int deleteCount=memberDao.deleteMember(id);		
			if(deleteCount>0) {
				commit(con);
				isDeleteSuccess=true;
			}else {
				rollback(con);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isDeleteSuccess;
	}

}
