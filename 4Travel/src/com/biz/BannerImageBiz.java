package com.biz;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;
import com.entity.BannerImageDTO;
import com.entity.MemberDTO;
import com.entity.QABoardDTO;
import com.exception.CommonException;

public class BannerImageBiz {
	String namespace="com.fortravel.BannerImageMapper.";
	
	public BannerImageDTO BannerImageSelect() throws CommonException{
		SqlSession session=MySqlSessionFactory.openSession();
		BannerImageDTO dto=null;
		try{
			dto=session.selectOne(namespace+"BannerImageSelect");
		}catch(Exception e){
			System.out.println("BannerImageSelect실패");
			e.printStackTrace();
			throw new CommonException("BannerImageSelect실패");
		}finally {
			session.close();
		}
		return dto;
	}
	public void BannerImageInsert(BannerImageDTO dto)throws CommonException{
		SqlSession session=MySqlSessionFactory.openSession();
		try{
			int n=session.insert(namespace+"BannerImageInsert",dto);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("삽입 실패");
		}
		finally {
			session.close();
		
		}
	}
	public void BannerUpdate(BannerImageDTO dto) throws CommonException{
		SqlSession session=MySqlSessionFactory.openSession();
		try{
			session.update(namespace+"BannerUpdate",dto);
			session.commit();
		}catch(Exception e){
			System.out.println("BannerImageupdate실패");
			e.printStackTrace();
			throw new CommonException("BannerImageupdate실패");
		}finally {
			session.close();
		}
	}
}
