package com.controller;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/WarningListUpdateController")
public class WarningListUpdateController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Calendar cal = Calendar.getInstance();
		String warningdate=cal.getTime().toString();
		
		FileOutputStream fos = null;
	        InputStream is = null;
	        try {

			// 다운로드할 URL 주소
				String sourceUrl = "http://apis.data.go.kr/1262000/TravelWarningService/getTravelWarningList?ServiceKey=Mf2l3D3UqYuFtvFpn8hCECfVaMTxH9HCvqZTuAmsPYNNqJ8i8rrBH5ExjOsYcbJ1kYpixDEzmiN7dWQRk6ZXhw%3D%3D&numOfRows=150";	 
			// 생성될 TEXT 파일 경로,파일명
				String targetFilename = "C:\\temp\\upload\\getTravelWarningList.xml";

	            fos = new FileOutputStream(""+ targetFilename);
	            URL url = new URL(sourceUrl);
	            URLConnection urlConnection = url.openConnection();
	            is = urlConnection.getInputStream();
	            byte[] buffer = new byte[1024];
	            int readBytes;
	            while ((readBytes = is.read(buffer)) != -1) {
	                fos.write(buffer, 0, readBytes);
	            }
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        } catch (MalformedURLException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } finally {
	            try {
	                if (fos != null) {
	                    fos.close();
	                }
	                if (is != null) {
	                    is.close();
	                }
	            } catch (IOException e) {
	                e.printStackTrace();
	            }
	        }
	        System.out.println("banlistupdate완료");
	        System.out.println("banddate"+warningdate);
	        response.sendRedirect("Notice.jsp");
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
