package com.controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PageCountServlet
 */
@WebServlet("/PageCountController")
public class PageCountController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int pageCount=(int)session.getAttribute("pageCount");
		int endPageCount=(int)session.getAttribute("endPageCount");
		int startPageCount=(int)session.getAttribute("startPageCount");
		int totalPageCount=(int)session.getAttribute("totalPageCount");
		if((int)session.getAttribute("endPageCount") <= totalPageCount) endPageCount +=pageCount;
		if((int)session.getAttribute("startPageCount") <= (totalPageCount-pageCount))startPageCount +=pageCount;
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
		String tr=request.getParameter("travelNation");
		String travelLoc=(String)session.getAttribute("travelLoc");
		int perpa=Integer.parseInt(perP);
		System.out.println("페이지 카운트 컨트롤러 세션값"+travelNation);
		System.out.println("페이지 카운트 컨트롤러 요청값"+tr);
		
		RequestDispatcher dis=request.getRequestDispatcher("ReviewBoardController?travelNation="+travelNation+"&travelLoc="+travelLoc+"&orders="+orders+"&searchName="+searchName+"&searchValue="+searchValue+"&curpage="+startPageCount);
		dis.forward(request, response);
		//response.sendRedirect("BoardListServlet?searchName="+searchName+"&searchValue="+searchValue+"&perPageCount="+perpa+"&readcnts="+orderby+"&curpage="+startPageCount);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
