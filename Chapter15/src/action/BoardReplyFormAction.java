package action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardModifyFormSvc;
import vo.ActionForward;
import vo.BoardBean;

public class BoardReplyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=new ActionForward();
		int board_num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		String page=request.getParameter("page");
		
		BoardModifyFormSvc boardModifyFormsvc=new BoardModifyFormSvc();
		BoardBean article=boardModifyFormsvc.getArticle(board_num);
		request.setAttribute("article", article);
		request.setAttribute("page", page);
		forward.setPath("/board/qna_board_reply.jsp");
		
		return forward;
	}

}
