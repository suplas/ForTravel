package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.PackageFirstBiz;
import com.biz.PackageThirdBiz;
import com.entity.PackageThirdDTO;
import com.exception.CommonException;


@WebServlet("/PackageFirstController")
public class PackageFirstController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String city = request.getParameter("city");
		
		
		String target ="";
		PackageThirdBiz biz=new PackageThirdBiz();
		try {
			List<PackageThirdDTO> list = biz.packageList(city);
			request.setAttribute("Plist", list);
			target="PackageFirst.jsp";
			
		} catch (CommonException e) {
			e.printStackTrace();
			target="error.jsp";
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
