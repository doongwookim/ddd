package com.micro.shop.main.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.micro.shop.common.Command;

public class MainCommand implements Command {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		// TODO main.jsp 파일 호출.
		return "main/main.jsp";// 보여줄 페이지
	}

}
