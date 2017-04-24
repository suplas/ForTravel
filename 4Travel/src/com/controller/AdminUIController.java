package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.biz.PackageFirstBiz;
import com.biz.ReviewBoardBiz;
import com.entity.MemberDTO;
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
		HttpSession session=request.getSession();
		MemberDTO admindto=(MemberDTO)session.getAttribute("adminlogin");
		if(admindto!=null){
		target="AdminUI.jsp";
		}else{
			target="Home";
		}
		  RequestDispatcher dis =
	        		request.getRequestDispatcher(target);
	        dis.forward(request, response);
	        
	        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
}
