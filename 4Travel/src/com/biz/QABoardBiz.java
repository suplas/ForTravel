package com.biz;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;
import com.entity.PackageThirdDTO;
import com.entity.QABoardDTO;
import com.exception.CommonException;

public class QABoardBiz {
	String namespace="com.fortravel.QABoardMapper.";
	
	public List<QABoardDTO> QABoardSelect() throws CommonException{
		SqlSession session=MySqlSessionFactory.openSession();
		List<QABoardDTO> list=null;
		try{
		list=session.selectList(namespace+"QABoardSelect");
		System.out.println(list.size());
		}catch(Exception e){
			System.out.println("불러오기실패");
			e.printStackTrace();
			throw new CommonException("QA게시판 불러오기 실패");
		}finally {
			session.close();
		}
		return list;
	}
	
}//end class
