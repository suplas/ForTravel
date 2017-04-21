package com.biz;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;
import com.entity.MemberDTO;
import com.exception.CommonException;

public class ReservationBiz {
	String namespace="com.fortravel.MemberMapper.";
	
	public void Reservation(MemberDTO mDTO)throws CommonException{
		SqlSession session=MySqlSessionFactory.openSession();
		try{
			int n=session.insert(namespace+"memberJoin",mDTO);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("예약실패");
		}
		finally {
			session.close();
		
		}
	}	
}
