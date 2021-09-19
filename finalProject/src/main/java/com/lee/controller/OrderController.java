package com.lee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.lee.dao.OrderDao;
import com.lee.dao.ProductDao;
import com.lee.model.Order;

@WebServlet("/OrderController")
public class OrderController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	OrderDao orderDao;
	ProductDao productDao;
	public OrderController() {
		this.orderDao = new OrderDao();
		this.productDao = new ProductDao();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String forward = "";
		HttpSession session = request.getSession();
		if(action.equalsIgnoreCase("orderlist")) {
			session.setAttribute("order", orderDao.getOrders());
			forward="/orderlist.jsp";
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
		if (action.equalsIgnoreCase("order")) {
			Order order = new Order();
			order.setCustomer(session.getAttribute("sessionId").toString());
			order.setProduct(request.getParameter("product"));
			order.setQuentity(Integer.parseInt(request.getParameter("quentity")));
			orderDao.addOrder(order);
			productDao.order(order);
			forward="/OrderController?action=orderlist";
		}
		else if(action.equalsIgnoreCase("orderlist")) {
			session.setAttribute("order", orderDao.getOrders());
			forward="/orderlist.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

}
