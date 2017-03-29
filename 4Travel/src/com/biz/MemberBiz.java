package com.biz;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;
import com.entity.MemberDTO;
import com.exception.CommonException;

public class MemberBiz {
	String namespace="com.fortravel.MemberMapper.";
	
	 public MemberDTO login(HashMap<String, String> map)
	    		throws CommonException{
	    	MemberDTO dto = null;
	    	SqlSession session = MySqlSessionFactory.openSession();
			try{
	    	 dto = session.selectOne(namespace+"login", map);
			}catch(Exception e){
				e.printStackTrace();
				throw new CommonException("로그인 실패");
			}finally {
				session.close();
			}
			return dto;
	    }//end login
	
	
	public void memberJoin(MemberDTO mDTO)throws CommonException{
		SqlSession session=MySqlSessionFactory.openSession();
		try{
			int n=session.insert(namespace+"memberJoin",mDTO);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
			throw new CommonException("회원가입 실패");
		}
		finally {
			session.close();
		
		}
	}	
}
