package com.controller;

import java.io.File;
import java.io.IOException;
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

import com.biz.BannerImageBiz;
import com.entity.BannerImageDTO;
import com.exception.CommonException;

@WebServlet("/AdminBannerUpdateController")
public class AdminBannerUpdateController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Create a factory for disk-based file items
		String target="";
		DiskFileItemFactory factory = new DiskFileItemFactory();
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
		Iterator<FileItem> ite = items.iterator();
		String fieldName = null;
		String fieldValue = "";
		long fileSize = 0;
		String fileName = null;
		String imageName="";
		
		while (ite.hasNext()) {
			FileItem fileItem = ite.next();
			if (fileItem.isFormField()) { //type = "file" false
				fieldName = fileItem.getFieldName();
				fieldValue += fileItem.getString("UTF-8")+"/";
			} else { //type = "file" true
				fileName = fileItem.getName();  
				fileSize = fileItem.getSize();
				File f=null;
				if(fileName.trim() != ""){
				f = new File("C:\\temp\\upload",fileName);
				imageName += fileName+"/";
				}
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
		BannerImageBiz biz=new BannerImageBiz();
		BannerImageDTO dto=new BannerImageDTO(1,imageName,fieldValue);
		try {
			biz.BannerUpdate(dto);
			target="Home";
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
