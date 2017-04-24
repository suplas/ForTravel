package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.PackageThirdBiz;
import com.entity.PackageThirdDTO;
import com.exception.CommonException;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/PackageThirdListController")
public class PackageThirdListController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String startdate = request.getParameter("startdate");
		int packageno= Integer.parseInt(request.getParameter("packageno"));
		/*PackageThirdDTO dto = new PackageThirdDTO();
		dto.setStartdate(startdate);*/
		String target="";
		PackageThirdBiz biz=new PackageThirdBiz();
		
		try {
			List<PackageThirdDTO> list=biz.packageAllList(packageno);
			
         	
			//List<PackageThirdDTO> list2=biz.packageTableAllList(dto);
			request.setAttribute("Plist", list);
			//request.setAttribute("Plist2", list2);
			target="PackageThird.jsp";
			
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
