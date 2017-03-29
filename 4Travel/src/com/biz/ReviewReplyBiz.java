package com.biz;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;
import com.entity.ReviewReplyDTO;
import com.exception.CommonException;

public class ReviewReplyBiz {
	String namespace="com.fortravel.ReviewReplyMapper.";
	public void replyWrite(ReviewReplyDTO dto){
		SqlSession session = MySqlSessionFactory.openSession();
		try{
	 session.insert(namespace+"replyWrite", dto);
	 session.commit();
		}finally {
			session.close();
		}
		
	}//end boardWrite
	
	public int replyUpdate(ReviewReplyDTO dto){
		int n=0;
		SqlSession session = MySqlSessionFactory.openSession();
		try{
	 n=session.insert(namespace+"replyUpdate", dto);
	 session.commit();
		}finally {
			session.close();
		}
		return n;
	}
	public int replyInsert(ReviewReplyDTO dto){
		int n=0;
		int m=replyUpdate(dto);
		SqlSession session = MySqlSessionFactory.openSession();
		try{
			n=session.insert(namespace+"replyInsert", dto);
			session.commit();
		}finally {
			session.close();
		}
	return n+m;
	}
	
	
	
	public List<ReviewReplyDTO> replyList(int reviewNum){
		 SqlSession session = MySqlSessionFactory.openSession();
		 List<ReviewReplyDTO> list = null;
		   try{
			   	list = session.selectList(namespace+"replyList", reviewNum);
			}finally {
				session.close();
			}
		   return list;
	}
	
	
	
}//end class
