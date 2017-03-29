package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.MemberBiz;
import com.entity.MemberDTO;
import com.exception.CommonException;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/MemberJoinController")
public class MemberJoinController extends HttpServlet{

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		String userid=request.getParameter("userid");
		String passwd=request.getParameter("passwd");
		String username=request.getParameter("username");
		int post1=Integer.parseInt(request.getParameter("post1"));
		int post2=Integer.parseInt(request.getParameter("post2"));
		String addr1=request.getParameter("addr1");
		String addr2=request.getParameter("addr2");
		int phone1=Integer.parseInt(request.getParameter("phone1"));
		int phone2=Integer.parseInt(request.getParameter("phone2"));
		int phone3=Integer.parseInt(request.getParameter("phone3"));
		String email1=request.getParameter("email1");
		String email2=request.getParameter("email2");
		String birth=request.getParameter("birth");
		
		MemberDTO mDTO=new MemberDTO(userid, passwd, username, post1, post2, addr1, addr2, phone1, phone2, phone3, email1, email2, birth, 0);
		
		MemberBiz biz=new MemberBiz();
		
		try {
			biz.memberJoin(mDTO);
		} catch (CommonException e) {
			e.printStackTrace();
		}
		
		RequestDispatcher dis =
	        		request.getRequestDispatcher("Home");
	        dis.forward(request, response);
	        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
