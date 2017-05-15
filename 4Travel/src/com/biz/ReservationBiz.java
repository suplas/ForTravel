package com.biz;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;
import com.entity.MemberDTO;
import com.entity.ReservationDTO;
import com.exception.CommonException;

public class ReservationBiz {
	String namespace="com.fortravel.ReservationMapper.";
	
	public void Reservation(ReservationDTO dto)throws CommonException{
		SqlSession session=MySqlSessionFactory.openSession();
		try{
			int n = session.insert(namespace+"reservation",dto);
			System.out.println("biz통과");
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
