package svc;
import static db.JdbcUtil.*;
import java.sql.Connection;

import dao.MemberDAO;
import vo.MemberBean;

public class MemberModProSvc {

	public boolean modifyMember(MemberBean member) {
		boolean isModifySuccess=false;
		Connection con=null;
		try {
			con=getConnection();
			MemberDAO memberDao=MemberDAO.getInstance();
			memberDao.setConnection(con);
			
			int updateCount=memberDao.updateMember(member);		
			if(updateCount>0) {
				commit(con);
				isModifySuccess=true;
			}else {
				rollback(con);
			}
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			close(con);
		}
		
		return isModifySuccess;
	}

}
