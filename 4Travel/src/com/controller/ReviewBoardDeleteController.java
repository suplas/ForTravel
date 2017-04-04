package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.ReviewBoardBiz;
import com.biz.ReviewReplyBiz;
import com.entity.ReviewBoardDTO;
import com.entity.ReviewReplyDTO;
import com.exception.CommonException;

@WebServlet("/ReviewBoardDeleteController")
public class ReviewBoardDeleteController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String target="";
		String snum=request.getParameter("num");
		int num=Integer.parseInt(snum);
		ReviewBoardBiz biz=new ReviewBoardBiz(); 
		

		try {
			biz.reviewBoardDelete(num);
			target="ReviewBoardController";
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			target="error.jsp";
		}
		
		response.sendRedirect(target); 
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
