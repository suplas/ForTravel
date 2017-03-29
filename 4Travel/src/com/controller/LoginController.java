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

import com.biz.MemberBiz;
import com.entity.MemberDTO;
import com.exception.CommonException;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/LoginController")
public class LoginController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userid = request.getParameter("userid");
		String passwd = request.getParameter("passwd");
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userid", userid);
		map.put("passwd", passwd);		 
		
		MemberBiz biz=new MemberBiz();
		
		String target = "";
		try {
			MemberDTO dto = biz.login(map);
			if(dto==null){
				//아이디 또는 비번 틀리다.
				target = "LoginUIController";
				request.setAttribute("loginFail", "아이디와 비번을 확인해주세요.");
			}else{
				// 아이디와 비번이 모두 맞다.
				target = "Home";
				HttpSession session = request.getSession();
				session.setAttribute("login", dto);
			}
			
		} catch (CommonException e) {
			target = "error.jsp";
			request.setAttribute("message", e.getMessage());
			request.setAttribute("link", "LoginFormController");
		}

		  RequestDispatcher dis =
	        		request.getRequestDispatcher(target);
	        dis.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
