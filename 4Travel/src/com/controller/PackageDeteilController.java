package com.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.PackageFirstBiz;
import com.biz.PackageThirdBiz;
import com.entity.MemberDTO;
import com.entity.PackageThirdDTO;
import com.exception.CommonException;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/PackageDeteilController")
public class PackageDeteilController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String packagenum = request.getParameter("packageno");
		int packageno = Integer.parseInt(packagenum);
		String startdate = request.getParameter("startdate");
		String term = request.getParameter("term");
		System.out.println(startdate);
		String target="";
		PackageThirdBiz biz=new PackageThirdBiz();
		
		try {
			List<PackageThirdDTO> list=biz.packageAllList(packageno);
			request.setAttribute("Plist", list);
			target="PackageSecond.jsp";
			
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
