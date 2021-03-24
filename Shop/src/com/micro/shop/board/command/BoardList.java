package com.micro.shop.board.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.micro.shop.board.vo.BoardVO;
import com.micro.shop.common.Command;

public class BoardList implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO 게시판 리스트 가져오기
		BoardVO vo = new BoardVO();
		vo.getId(Integer.parseInt(request.getParameter("id")));
		// request.setAtribute("list",list);
		return "board/boardList.jsp";
	}

}
