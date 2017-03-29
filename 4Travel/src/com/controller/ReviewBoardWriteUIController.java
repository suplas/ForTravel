package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.entity.MemberDTO;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/ReviewBoardWriteUIController")
public class ReviewBoardWriteUIController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target=""; 
		HttpSession session = request.getSession();
		MemberDTO dto = (MemberDTO)session.getAttribute("login");
		
		if(dto != null){
			target="ReviewBoardWriteUI.jsp";
		}else{
			target="LoginUIController";
			request.setAttribute("loginFail", "로그인 후 시도하세요");
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
