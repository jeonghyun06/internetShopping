package com.lee.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.ha.session.ReplicatedSessionListener;

import com.lee.dao.ProductDao;
import com.lee.model.Order;
import com.lee.model.Product;

@WebServlet("/ProductController")
public class ProductController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ProductDao productDao;
    public ProductController() {
    	this.productDao = new ProductDao();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String forward="";
		HttpSession session = request.getSession();
		if(action.equalsIgnoreCase("add")) {
			Product product = new Product();
			product.setName(request.getParameter("name"));
			product.setPrice(Integer.parseInt(request.getParameter("price")));
			product.setColor(request.getParameter("color"));
			product.setQuentity(Integer.parseInt(request.getParameter("quentity")));
			productDao.addProduct(product);
			forward = "/ProductController?action=showProduct";
		}
		else if(action.equalsIgnoreCase("showProduct")) {
			forward="/ProductList.jsp";
			request.setAttribute("product", productDao.showProduct());
		}
		else if(action.equalsIgnoreCase("update")) {
			String id = request.getParameter("name");
			Product product = productDao.getProduct(id);
			request.setAttribute("product", productDao.getProduct(id));
			forward = "/updateProduct.jsp";
		}
		else if(action.equalsIgnoreCase("deleteProduct")) {
			String id = request.getParameter("name");
			productDao.deleteProduct(id);
			forward = "/ProductController?action=showProduct";
		}
		else if(action.equalsIgnoreCase("page")) {
			String id=request.getParameter("product");
			request.setAttribute("product", productDao.getProduct(id));
			forward="/product.jsp";
		}
		else if(action.equalsIgnoreCase("main")) {
			try {
			request.setAttribute("product", productDao.showProduct());
			forward="/index.jsp";
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String action = request.getParameter("action");
		String forward="";
		HttpSession session = request.getSession();
		if(action.equalsIgnoreCase("add")) {
			Product product = new Product();
			product.setName(request.getParameter("name"));
			product.setPrice(Integer.parseInt(request.getParameter("price")));
			product.setColor(request.getParameter("color"));
			product.setQuentity(Integer.parseInt(request.getParameter("quentity")));
			productDao.addProduct(product);
			forward="/ProductController?action=showProduct";
		}
		else if(action.equalsIgnoreCase("updateProduct")) {
			Product product = new Product();
			product.setName(request.getParameter("name"));
			product.setPrice(Integer.parseInt(request.getParameter("price")));
			product.setColor(request.getParameter("color"));
			product.setQuentity(Integer.parseInt(request.getParameter("quentity")));
			productDao.updateProduct(product);
			forward="/ProductController?action=showProduct";
		}
		else if(action.equalsIgnoreCase("update")) {
			String id = request.getParameter("name");
			Product product = productDao.getProduct(id);
			request.setAttribute("product", product);
			forward = "/updateProduct.jsp";
		}
		RequestDispatcher view = request.getRequestDispatcher(forward);
        view.forward(request, response);
	}

}
