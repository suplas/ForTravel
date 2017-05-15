package com.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biz.BannerImageBiz;
import com.biz.PackageFirstBiz;
import com.biz.PackageThirdBiz;
import com.biz.ReviewBoardBiz;
import com.entity.BannerImageDTO;
import com.entity.PackageFirstDTO;
import com.entity.PackageThirdDTO;
import com.entity.ReviewBoardDTO;
import com.exception.CommonException;

/**
 * Servlet implementation class HomeController
 */
@WebServlet("/MHome")
public class MobileHomeController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int readcnt = 0;
		int page=0;
		int totalPage = 0;
		if(request.getParameter("page")==""||request.getParameter("page")==null){//페이지번호가 없으면 기본값 1 삽입			
			page = 1;			
		}else{
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String target ="";
		PackageFirstBiz service = new PackageFirstBiz();
		ReviewBoardBiz biz = new ReviewBoardBiz();
		BannerImageBiz bannerBiz=new BannerImageBiz();
	
		try {
			List<PackageFirstDTO> list = service.packageNewlist();
			request.setAttribute("Plist", list);
			List<ReviewBoardDTO> list2 = biz.bestredcnt(readcnt);
			request.setAttribute("Plist2", list2);
			BannerImageDTO bannerdto=bannerBiz.BannerImageSelect();
			request.setAttribute("bannerdto", bannerdto);
			target="JqueryMobile/JQueryMobile.jsp";
			
		} catch (CommonException e) {
			e.printStackTrace();
			target="error.jsp";
		}
		
		
		response.sendRedirect(target);
		 /* RequestDispatcher dis =
	        		request.getRequestDispatcher(target);
	        dis.forward(request, response);*/
	        
	        
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
}
