package controller;

import java.io.IOException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;

import action.BoardDeleteProAction;
import action.BoardDetailAction;
import action.BoardListAction;
import action.BoardModifyFormAction;
import action.BoardModifyProAction;
import action.BoardReplyFormAction;
import action.BoardReplyProAction;
import action.BoardWriteProAction;
import vo.ActionForward;

/**
 * Servlet implementation class BoardFrontController
 */
@WebServlet("*.bo")
public class BoardFrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardFrontController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doProcess(request,response);
	}
	private void doProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		request.setCharacterEncoding("utf-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		
		ActionForward forward=null;
		Action action=null;
		System.out.println(command);
		
		if(command.equals("/boardWriteForm.bo")) {
			forward=new ActionForward();
			forward.setPath("/board/qna_board_write.jsp");
		}else if(command.equals("/boardWritePro.bo")) {
			action=new BoardWriteProAction();
			try {
			forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/boardList.bo")) {
			action=new BoardListAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/boardDetail.bo")) {
			action=new BoardDetailAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/boardModifyForm.bo")) {
			action=new BoardModifyFormAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/boardModifyPro.bo")) {
			action=new BoardModifyProAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/boardReplyForm.bo")) {
			action=new BoardReplyFormAction();
			System.out.println("dsdfsf");
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				e.printStackTrace();
			}
		}else if (command.equals("/boardReplyPro.bo")) {
			
			action=new BoardReplyProAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				
				e.printStackTrace();
			}
		}else if (command.equals("/boardDeleteForm.bo")) {
			String board_num= request.getParameter("BOARD_NUM");
			String page=request.getParameter("page");
			
			request.setAttribute("BOARD_NUM", board_num);
			request.setAttribute("page", page);
			forward=new ActionForward();
			forward.setPath("/board/qna_board_delete.jsp");
			
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				
				e.printStackTrace();
			}
		}else if (command.equals("/boardDeletePro.bo")) {
			
			action=new BoardDeleteProAction();
			try {
				forward=action.execute(request, response);
			}catch(Exception e) {
				
				e.printStackTrace();
			}
		}
		System.out.println(forward);
		if(forward!=null) {
			if(forward.isRedirect()) {
				response.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher=request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
		}
	}

}
