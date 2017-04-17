package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.PackageBiz;
import com.biz.ReviewBoardBiz;
import com.entity.PackageThirdDTO;
import com.entity.ReviewBoardDTO;
import com.exception.CommonException;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/AdminUIController")
public class AdminUIController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target ="";
		target="AdminUI.jsp";
		  RequestDispatcher dis =
	        		request.getRequestDispatcher(target);
	        dis.forward(request, response);
	        
	        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
}
