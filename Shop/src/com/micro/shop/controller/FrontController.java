package com.micro.shop.controller;//서블릿

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.micro.shop.board.command.BoardList;
import com.micro.shop.common.Command;
import com.micro.shop.main.command.MainCommand;

/**
 * Servlet implementation class FrontController
 */
@WebServlet("/FrontController")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private HashMap<String, Command> map = new HashMap<String, Command>();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FrontController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {

		map.put("/main.do", new MainCommand());// 처음 접근할 페이지
		map.put("/boardList.do", new BoardList());// 게시판 목록 보기
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();// 요청값 처리
		String context = request.getContextPath();
		String path = uri.substring(context.length());

		Command command = map.get(path);// 실행할 command 를 가져옴

		String viewPage = command.exec(request, response); // 결과갑 도출

		if ((viewPage.endsWith(".jsp"))) {
			viewPage = "/WEB-INF/views/" + viewPage;
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);// 리퀘스트 리스폰스 세션 자동 생성
		dispatcher.forward(request, response); // 리퀘스트 리스폰스 사용

	}

}
