package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.ReviewBoardBiz;
import com.biz.ReviewReplyBiz;
import com.entity.ReviewBoardDTO;
import com.entity.ReviewReplyDTO;

/**
 * Servlet implementation class ReviewBoardUpdateController
 */
@WebServlet("/ReviewBoardUpdateUIController")
public class ReviewBoardUpdateUIController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String num=request.getParameter("num");
		ReviewBoardBiz biz=new ReviewBoardBiz(); 
		ReviewReplyBiz rpbiz=new ReviewReplyBiz();
		
		ReviewBoardDTO dto = biz.boardRetrieve(Integer.parseInt(num));
		List<ReviewReplyDTO> rpList=rpbiz.replyList(Integer.parseInt(num));
		request.setAttribute("boardRetrieve", dto);
		request.setAttribute("rpList", rpList);
		request.setAttribute("updateNum", Integer.parseInt(num));
		RequestDispatcher dis=request.getRequestDispatcher("ReviewBoardUpdateUI.jsp");
		dis.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
