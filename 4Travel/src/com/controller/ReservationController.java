package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.ReservationBiz;
import com.entity.ReservationDTO;
import com.exception.CommonException;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/ReservationController")
public class ReservationController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String phoneno = request.getParameter("phoneno");
		String phoneno2 = request.getParameter("phoneno2");
		String phoneno3 = request.getParameter("phoneno3");
		
		System.out.println(username+"\t"+phoneno+"\t"+phoneno2+"\t"+phoneno3);
		
		ReservationDTO rdto = new ReservationDTO();
		rdto.setUsername(username);
		rdto.setPhoneno(Integer.parseInt(phoneno));
		rdto.setPhoneno2(Integer.parseInt(phoneno2));
		rdto.setPhoneno2(Integer.parseInt(phoneno3));
		System.out.println(rdto.getUsername()+"\t"+rdto.getPhoneno()+"-"+rdto.getPhoneno2()+"-"+rdto.getPhoneno3());
		
		ReservationBiz biz = new ReservationBiz();
		try {
			biz.Reservation(rdto);
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		  RequestDispatcher dis =
	        		 request.getRequestDispatcher("reservationSuccess.jsp");
	        dis.forward(request, response);
	        
	        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
