package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardModifyProService;
import vo.ActionForward;
import vo.BoardBean;

public class BoardModifyProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		int board_num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		String pass=request.getParameter("BOARD_PASS");
		String subject=request.getParameter("BOARD_SUBJECT");
		String content=request.getParameter("BOARD_CONTENT");
		String page=request.getParameter("page");
		
		BoardModifyProService boardModifyProService=new BoardModifyProService();
		Boolean isRightUser = boardModifyProService.isArticleWriter(board_num, pass);
		if(!isRightUser) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('수정 권한이 없습니다.')");
			out.println("history.back();");
			out.println("</script>");
		}else {
			BoardBean article=new BoardBean();
			article.setBOARD_NUM(board_num);
			article.setBOARD_SUBJECT(subject);
			article.setBOARD_CONTENT(content);
			boolean isModifySuccess=boardModifyProService.modifyArticle(article);
		
			if(! isModifySuccess) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('수정 실패')");
				out.println("history.back();");
				out.println("</script>");
			}else {
				
				forward=new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardDetail.bo?BOARD_NUM="+board_num+"&page="+page);
				
			}
		}
		return forward;
	}

}
