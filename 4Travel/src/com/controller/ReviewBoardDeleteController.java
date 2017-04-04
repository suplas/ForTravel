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

@WebServlet("/ReviewBoardDeleteController")
public class ReviewBoardDeleteController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String snum=request.getParameter("num");
		int num=Integer.parseInt(snum);
		ReviewBoardBiz biz=new ReviewBoardBiz(); 
		ReviewReplyBiz rpbiz=new ReviewReplyBiz();
		

		ReviewBoardDTO dto = biz.boardRetrieve(num);
		List<ReviewReplyDTO> rpList=rpbiz.replyList(num);
		request.setAttribute("boardRetrieve", dto);
		request.setAttribute("rpList", rpList);
		
		
		
		Cookie[] cookies = request.getCookies();
		 Cookie viewCookie = null;
		 
		 if(cookies != null && cookies.length > 0){
		  
		  for(int i = 0; i< cookies.length; i++){
		   if(cookies[i].getName().equals("VIEWCOOKIE")){ //Cookie의 name이 VIEWCOOKIE와 일치하는 쿠키를 viewCookie에 넣어준다.
		    viewCookie = cookies[i];
		   }
		  }  
		 }
		 
		 //만일 viewCookie없다면 
		 if(viewCookie == null){
		  System.out.println("VIEWCOOKIE 없음");
		  Cookie newCookie = new Cookie("VIEWCOOKIE","|"+num+"|"); //("VIEWCOOKIE"는 name, "|"+bbsno+"|" 는 value 다. 
		  response.addCookie(newCookie);
		  biz.boardReadcnt(num);
		 }else{
		  System.out.println("VIEWCOOKIE 있음");
		  String value = viewCookie.getValue();
		  
		  if(value.indexOf("|"+num+"|") <  0){ // 입력한 번화와 일치하는 번호가 없으면 추가한다.
		   value = value+"|"+num+"|";
		   viewCookie.setValue(value);
		   response.addCookie(viewCookie);
		   biz.boardReadcnt(num);
		  }
		 }
		 
		 RequestDispatcher dis=request.getRequestDispatcher("ReviewBoardDetail.jsp");
			dis.forward(request, response);
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
