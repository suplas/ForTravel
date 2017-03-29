package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PageDisCountController")
public class PageDisCountController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int pageCount=(int)session.getAttribute("pageCount");
		int endPageCount=(int)session.getAttribute("endPageCount");
		int startPageCount=(int)session.getAttribute("startPageCount");
		int totalPageCount=(int)session.getAttribute("totalPageCount");
		if(endPageCount > pageCount) endPageCount -=pageCount;
		if((startPageCount - pageCount)>= 1)startPageCount -=pageCount;
		System.out.println(endPageCount);
		System.out.println(startPageCount);
		session.setAttribute("endPageCount", endPageCount);
		session.setAttribute("startPageCount", startPageCount);

		System.out.println(endPageCount);
		System.out.println(startPageCount);
		
		String orders=(String)session.getAttribute("orders");
		String searchValue=(String)session.getAttribute("searchValue");
		String searchName=(String)session.getAttribute("searchName");
		String perP=(String)session.getAttribute("perPage");
		String travelNation=(String)session.getAttribute("travelNation");
		String travelLoc=(String)session.getAttribute("travelLoc");
		int perpa=Integer.parseInt(perP);
		
		RequestDispatcher dis=request.getRequestDispatcher("ReviewBoardController?travelNation="+travelNation+"&travelLoc="+travelLoc+"&orders="+orders+"&searchName="+searchName+"&searchValue="+searchValue+"&curpage="+startPageCount);
		dis.forward(request, response);
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
