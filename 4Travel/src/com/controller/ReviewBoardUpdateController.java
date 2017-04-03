package com.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.biz.ReviewBoardBiz;
import com.entity.MemberDTO;
import com.entity.ReviewBoardDTO;
import com.exception.CommonException;

@WebServlet("/ReviewBoardUpdateController")
public class ReviewBoardUpdateController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Create a factory for disk-based file items
		String target="";
		DiskFileItemFactory factory = new DiskFileItemFactory();
		String content=request.getParameter("content");
		// Configure a repository (to ensure a secure temp location is used)
		ServletContext servletContext = this.getServletConfig().getServletContext();
		File repository = (File) servletContext.getAttribute("javax.servlet.context.tempdir");
		factory.setRepository(repository);

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);

		// Parse the request
		List<FileItem> items = null; // 업로드한 파일 정보
		try {
			items = upload.parseRequest(request);
		} catch (FileUploadException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HashMap<String, String> map =new HashMap<>(); 
		Iterator<FileItem> ite = items.iterator();
		String fieldName = null;
		String fieldValue = null;
		long fileSize = 0;
		String fileName = null;
		String image1="";
		while (ite.hasNext()) {
			FileItem fileItem = ite.next();
			System.out.println("파일 아이템 임::::::::::"+fileItem);
			if (fileItem.isFormField()) { //type = "file" false
				fieldName = fileItem.getFieldName();
				fieldValue = fileItem.getString("UTF-8");
				map.put(fieldName, fieldValue);
				System.out.println("if 파일 네임:"+fieldName+"\t"+"if필드 밸류"+fieldValue);
			} else { //type = "file" true
				fileName = fileItem.getName();  
				fileSize = fileItem.getSize();
				File f=null;
				if(fileName.trim() != ""){
				f = new File("C:\\temp\\upload",fileName);
				image1 += fileName+"/";
				}
				System.out.println("파일네임!!!!!!!!!!!!!11111"+fileName);
				System.out.println("이미지 111111111111111111"+image1);
				map.put("image1", image1);
				try {
					fileItem.write(f);
				} catch (Exception e) {
					System.out.println("파일쓰기 에러");
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}// end while
		
		HttpSession session = request.getSession();
		MemberDTO dto=(MemberDTO)session.getAttribute("login");
		String userid=dto.getUserid();
		map.put("userid", userid);
		request.setAttribute("map", map);
		System.out.println(map);
		ReviewBoardBiz biz=new ReviewBoardBiz();
		try {
			biz.reviewBoardUpdate(map);
			System.out.println(map.get("num"));
			target="ReviewBoardDetailController?num="+map.get("num");
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			target="error.jsp";
			e.printStackTrace();
		}
		
		
		response.sendRedirect(target);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
