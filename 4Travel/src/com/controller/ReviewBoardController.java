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
import javax.servlet.http.HttpSession;

import com.biz.ReviewBoardBiz;
import com.entity.ReviewBoardDTO;
import com.entity.ReviewBoardPageDTO;
import com.exception.CommonException;

@WebServlet("/ReviewBoardController")
public class ReviewBoardController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
				String target="";  
				//jsp 에서 넘어오는 curpage
				String curpage=request.getParameter("curpage");
				String perPage=request.getParameter("perPageCount");
				String orders=request.getParameter("orders");
				String travelNation=request.getParameter("travelNation");
				String travelLoc=request.getParameter("travelLoc");
				String searchName=request.getParameter("searchName");
				String searchValue = request.getParameter("searchValue");
				if(perPage ==null) perPage="3";
				if(curpage==null) curpage="1";
				if(travelNation==null) travelNation="전체보기";
				if(travelLoc==null) travelLoc="전체보기";
				if(orders==null) orders="writeday";
				System.out.println(orders);
				System.out.println(travelNation);
				HashMap<String, String> map=new HashMap<>();
				map.put("curpage", curpage);
				map.put("perPage", perPage);
				map.put("orders", orders);
				map.put("travelNation", travelNation);
				map.put("travelLoc", travelLoc);
				map.put("searchName", searchName);
				map.put("searchValue", searchValue);
				
				
				System.out.println("보드컨트롤러 "+travelNation);
				ReviewBoardBiz biz=new ReviewBoardBiz();
				ReviewBoardPageDTO pageDTO=new ReviewBoardPageDTO();
				HttpSession session = request.getSession();
				
				String tr=(String)session.getAttribute(travelNation);
				
				System.out.println("리뷰보드컨트롤러 세션값"+tr);
				
				session.setAttribute("hmap", map);
				session.setAttribute("curpage", curpage);
				session.setAttribute("perPage", perPage);
				session.setAttribute("orders", orders);
				session.setAttribute("travelNation", travelNation);
				session.setAttribute("travelLoc", travelLoc);
				session.setAttribute("searchName", searchName);
				session.setAttribute("searchValue", searchValue);
				session.setAttribute("pageCount", 3);
				List<String> locList=biz.locSelect(map);
				
				pageDTO=biz.boardNewPage(map);
				/*session.setAttribute("endPageCount", 3);
				session.setAttribute("startPageCount", 1);*/
				int endPageCount=0;
				int startPageCount=0;
				int totalrecord = pageDTO.getTotalrecord(); 
				int pageCount = (int)session.getAttribute("pageCount");
				int totalPageCount=totalrecord/Integer.parseInt(perPage);
				session.setAttribute("totalPageCount", totalPageCount);
				
				if(session.getAttribute("endPageCount") ==null) {
					endPageCount=3;
					session.setAttribute("endPageCount", endPageCount);
				}
					
				if(session.getAttribute("startPageCount") ==null){ 
					startPageCount=1;
					session.setAttribute("startPageCount", startPageCount);
				}
				
				System.out.println("ddddddddddddddddddddddddd"+curpage);
				
				session.setAttribute("pageDTO", pageDTO);
				session.setAttribute("locList", locList);
				//포워드
				
				response.sendRedirect("ReviewBoard.jsp");
		
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
