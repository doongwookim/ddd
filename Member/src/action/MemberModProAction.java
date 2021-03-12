package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import svc.MemberModProSvc;
import vo.ActionForward;
import vo.MemberBean;

public class MemberModProAction implements Action {

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
		MemberBean member=new MemberBean();
		member.setId(request.getParameter("id"));
		member.setPass(request.getParameter("pass"));
		member.setName(request.getParameter("name"));
		member.setAge(Integer.parseInt(request.getParameter("age")==null||request.getParameter("age").trim().equals("")?"0":request.getParameter("age").trim()));
		member.setGender(request.getParameter("gender"));
		member.setEmail(request.getParameter("email"));
		
		MemberModProSvc memberModProSvc=new MemberModProSvc();
		
		boolean isModifySuccess=memberModProSvc.modifyMember(member);
		
		if(isModifySuccess) {
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("memberInfo.mem?id="+member.getId());
		}else {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out= response.getWriter();
			out.println("<script>");
			out.println("alert('수정 실패')");
			out.println("history.back();");
			out.println("</script>");
		}
		
	}
		
		return forward;
	}

}
