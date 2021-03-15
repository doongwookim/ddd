package action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.BoardDeleteProService;
import vo.ActionForward;

public class BoardDeleteProAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward=null;
		int board_num=Integer.parseInt(request.getParameter("BOARD_NUM"));
		String nowPage=request.getParameter("page");
		String pass=request.getParameter("BOARD_PASS");
		BoardDeleteProService boardDeleteProService=new BoardDeleteProService();
		
		boolean isArticleWriter=boardDeleteProService.isArticleWriter(board_num,pass);
		
		if(!isArticleWriter) {
			response.setContentType("text/html;charset=utf-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('삭제 권한 없음.')");
			out.println("history.back();");
			out.println("</script>");
			out.close();
		}
		else {
			boolean isDeleteSuccess=boardDeleteProService.removeArticle(board_num);
			
			if(!isDeleteSuccess) {
				response.setContentType("text/html;charset=utf-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('삭제 실패')");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			else {
				forward=new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardList.bo?page="+nowPage);
			}
		}
		return forward;
	}

}
