package com.lee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lee.dao.UserDao;
import com.lee.model.User;

@WebServlet("/UserController")
public class UserController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	UserDao userDao;

	public UserController() {
		this.userDao = new UserDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String forward = "";
		HttpSession session = request.getSession();
		if (action.equalsIgnoreCase("logout")) {
			session.removeAttribute("sessionId");
			try {

				session.removeAttribute("manager");
			} catch (Exception e) {
				// TODO: handle exception
			}
			forward = "/index.jsp";
		} else if (action.equalsIgnoreCase("update")) {
			String id = session.getAttribute("sessionId").toString();
			User user = userDao.getUserById(id);
			request.setAttribute("user", user);
			forward = "/userUpdate.jsp";
		} else if (action.equalsIgnoreCase("deleteUser")) {
			userDao.deleteUser(session.getAttribute("sessionId").toString());
			forward = "/UserController?action=logout";
		} else if (action.equalsIgnoreCase("showUsers")) {
			request.setAttribute("user", userDao.getAllUsers());
			forward = "/customer.jsp";
		} else if (action.equalsIgnoreCase("delete")) {
			String id = request.getParameter("delete");
			System.out.println(id);
			userDao.deleteUser(id);
			forward = "/UserController?action=showUsers";
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
		if (action.equalsIgnoreCase("addUser")) {
			User user = new User();
			user.setId(request.getParameter("id"));
			user.setPw(request.getParameter("pw"));
			user.setName(request.getParameter("name"));
			user.setEmail(request.getParameter("email"));
			userDao.addUser(user);
			forward = "/index.jsp";
		} else if (action.equalsIgnoreCase("login")) {
			String id = request.getParameter("id");
			String PW = request.getParameter("pw");
			String pw = userDao.getPw(id);
			try {
				if (id.equals("manager") && PW.equals("1234")) {
					session.setAttribute("manager", "true");
					session.setAttribute("sessionId", id);
					forward = "/index.jsp";
				} else if (pw.equals(request.getParameter("pw"))) {
					session.setAttribute("sessionId", id);
					if (id.equals("manager")) {
						session.setAttribute("manager", "true");
					}
					forward = "/index.jsp";
				} else {
					request.setAttribute("check", "wrongPW");
					forward = "/login.jsp";
				}
			} catch (Exception e) {
				request.setAttribute("check", "wrongID");
				forward = "/login.jsp";
			}
		} else if (action.equalsIgnoreCase("updateUser")) {
			User user = new User();
			user.setId(session.getAttribute("sessionId").toString());
			user.setPw(request.getParameter("pw"));
			user.setName(request.getParameter("name"));
			user.setEmail(request.getParameter("email"));
			userDao.updateUser(user);
			forward = "/UserController?action=update";
		} else if (action.equalsIgnoreCase("update")) {
			String id = session.getAttribute("sessionId").toString();
			User user = userDao.getUserById(id);
			request.setAttribute("user", user);
			forward = "/userUpdate.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
		view.forward(request, response);
	}
}
