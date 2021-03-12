package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import action.Action;
import action.JoinProAction;
import action.LoginProAction;
import action.MemberDeleteAction;
import action.MemberInfoAction;
import action.MemberListAction;
import action.MemberModFormAction;
import action.MemberModProAction;
import vo.ActionForward;

/**
 * Servlet implementation class memberController
 */
@WebServlet(urlPatterns = {"*.mem", "*.log"})
public class memberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public memberController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			doProcess(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = requestURI.substring(contextPath.length());
		System.out.println(command);
		
		ActionForward forward = null;
		Action action = null;
		
		if(command.equals("/loginForm.log")) {
			forward = new ActionForward();
			forward.setPath("/member/loginForm.jsp"); // 디스페쳐로 보내서 경로를 서블릿 경로로 남겨둠
		} else if (command.equals("/joinForm.mem")) {
			forward = new ActionForward();
			forward.setPath("/member/joinForm.jsp");
		} else if (command.equals("/joinProcess.mem")) {
			action = new JoinProAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/loginProcess.log")) {
			action = new LoginProAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/logout.log")) {
			HttpSession session = request.getSession();
			session.invalidate();
			// session.removeAttribute("id"); // 둘다 session해제
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("main.jsp");
		} else if (command.equals("/memberList.mem")) {
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberInfo.mem")) {
			action = new MemberInfoAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberModForm.mem")) {
			action = new MemberModFormAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberModPro.mem")) {
			action = new MemberModProAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/memberDelete.mem")) {
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		
		if(forward != null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

}
