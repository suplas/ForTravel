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

@WebServlet("/ReviewBoardWriteController")
public class ReviewBoardWriteController extends HttpServlet {

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
		String image1 = null;
		while (ite.hasNext()) {
			FileItem fileItem = ite.next();
			System.out.println(fileItem);
			if (fileItem.isFormField()) { //type = "file" false
				fieldName = fileItem.getFieldName();
				fieldValue = fileItem.getString("UTF-8");
				map.put(fieldName, fieldValue);
				System.out.println("if 파일 네임:"+fieldName+"\t"+"if필드 밸류"+fieldValue);
			} else { //type = "file" true
				image1 = fileItem.getName();  
				fileSize = fileItem.getSize();
				map.put("image1", image1);
				System.out.println("파일네임 : "+image1);
				File f = new File("C:\\temp\\upload",image1);
				try {
					fileItem.write(f);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		}// end while
		
		HttpSession session = request.getSession();
		MemberDTO dto=(MemberDTO)session.getAttribute("login");
		String userid=dto.getUserid();
		map.put("userid", userid);
		System.out.println("유저아이디입니다 : "+userid);
		request.setAttribute("map", map);
		request.setAttribute("fieldValue", fieldValue);
		request.setAttribute("image1", image1);
		request.setAttribute("fileSize", fileSize);
		request.setAttribute("content", content);
		System.out.println(map);
		ReviewBoardBiz biz=new ReviewBoardBiz();
		try {
			biz.reviewBoardWrite(map);
			target="ReviewBoardController";
		} catch (CommonException e) {
			// TODO Auto-generated catch block
			target="error.jsp";
			e.printStackTrace();
		}
		
		
		RequestDispatcher dis = request.getRequestDispatcher(target);
		dis.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
