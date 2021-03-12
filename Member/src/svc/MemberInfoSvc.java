package svc;

import java.sql.Connection;
import dao.MemberDAO;
import static db.JdbcUtil.*;
import vo.MemberBean;

public class MemberInfoSvc {

	public MemberBean getMember(String id) {
		MemberBean member= null;
		Connection con=null;
		try {
			con=getConnection();
			MemberDAO memberDao=MemberDAO.getInstance();
			memberDao.setConnection(con);
			
			member=memberDao.selectMember(id);
		}catch (Exception e) {
			e.printStackTrace();
			}finally {
				close(con);
			}
		return member;
	}

}
