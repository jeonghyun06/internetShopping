package com.lee.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lee.dao.BoardDao;
import com.lee.model.Board;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	BoardDao boardDao;

	public BoardController() {
		this.boardDao = new BoardDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String forward = "";
		HttpSession session = request.getSession();
		try {
			if (action.equalsIgnoreCase("BoardList")) {
				forward = "/board.jsp";
				request.setAttribute("board", boardDao.getAllBoards());
			}
			else if (action.equalsIgnoreCase("deleteBoard")) {
				int id = Integer.parseInt(request.getParameter("delete"));
				boardDao.deleteBoard(id);
				forward = "/BoardController?action=BoardList";
			}
			else if(action.equalsIgnoreCase("detail")) {
				int id = Integer.parseInt(request.getParameter("title"));
				System.out.println(id);
				Board board =  boardDao.getBoard(id);
				request.setAttribute("board", board);
				forward = "/boardContent.jsp";
			}
		} catch (Exception e) {

		}

		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String forward = "";
		HttpSession session = request.getSession();
		if (action.equalsIgnoreCase("addBoard")) {
			Board board = new Board();
			Date date = new Date();
			board.setTitle(request.getParameter("title"));
			board.setContent(request.getParameter("content"));
			board.setDate(date);
			board.setAuthor(session.getAttribute("sessionId").toString());
			boardDao.addBoard(board);
			forward = "/BoardController?action=BoardList";
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}

}
