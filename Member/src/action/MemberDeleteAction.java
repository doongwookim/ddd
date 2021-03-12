package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import svc.MemberDeleteSvc;
import svc.MemberInfoSvc;
import vo.ActionForward;
import vo.MemberBean;

public class MemberDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		
		HttpSession session = request.getSession();
		
		if(session.getAttribute("id") == null || (!((String)session.getAttribute("id")).equals("admin"))) {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		
		out.println("<script>");
		out.println("alert('관리자로 로그인하세요')");
		out.println("location.href='loginForm.log'");
		out.println("</script>");
	}else {
		
		String id=request.getParameter("id");
		MemberDeleteSvc memberDeleteSvc=new MemberDeleteSvc();
		boolean isDeleteSuccess=memberDeleteSvc.deleteMember(id);
		if(isDeleteSuccess) {
			forward=new ActionForward();
			forward.setRedirect(true);
			forward.setPath("memberList.mem");
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			
			out.println("<script>");
			out.println("alert('삭제 실패')");
			out.println("histosy.back();");
			out.println("</script>");
		}
	}
		return forward;
	}

}
