package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.LoginService;
import vo.ActionForward;
import vo.MemberBean;

public class LoginProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		
		LoginService loginSvc = new LoginService();
		MemberBean member = loginSvc.getMember(id);
		
		if(member != null) {
			if(member.getPass().equals(pass)) {
				HttpSession session = request.getSession(); // session 객체 생성
				session.setAttribute("id", id);
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("main.jsp");
			} else {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('로그인실패');");
				out.println("history.back();");
				out.println("</script>");
			}
		} else { //로그인 실패
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('로그인실패');");
			out.println("history.back();");
			out.println("</script>");
		}
		return forward;
	}

}
