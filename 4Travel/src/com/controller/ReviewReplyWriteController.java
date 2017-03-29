package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.biz.ReviewReplyBiz;
import com.entity.MemberDTO;
import com.entity.ReviewReplyDTO;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/ReviewReplyWriteController")
public class ReviewReplyWriteController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String target=""; 
		String content=request.getParameter("rpContent");
		
		HttpSession session = request.getSession();
		MemberDTO mdto = (MemberDTO)session.getAttribute("login");
		ReviewReplyDTO rpDTO=new ReviewReplyDTO();
		if(mdto != null){
			int num=Integer.parseInt(request.getParameter("num"));
			ReviewReplyBiz biz=new ReviewReplyBiz();
			rpDTO.setContent(content);
			rpDTO.setReviewNum(num);
			rpDTO.setUserid(mdto.getUserid());
			biz.replyWrite(rpDTO);
			target="ReviewBoardDetailController?num="+num;
		}else{
			target="LoginUIController";
			session.setAttribute("loginFail", "로그인 후 시도하세요");
		}
		response.sendRedirect(target);
		
	        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
