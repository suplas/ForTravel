package com.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;
import com.entity.MemberDTO;
import com.entity.PackageFirstDTO;
import com.entity.PackageThirdDTO;
import com.exception.CommonException;

public class PackageThirdBiz {
	String namespace="com.fortravel.PackageThirdMapper.";
	
	public List<PackageThirdDTO> packageAllList(int packageno) throws CommonException{
		SqlSession session=MySqlSessionFactory.openSession();
		List<PackageThirdDTO> list = null;
		try{
		list = session.selectList(namespace+"packageAllList",packageno);
		
		}catch(Exception e){
			e.printStackTrace();
			throw new CommonException("패키지리스트 불러오기 실패");
		}finally {
			session.close();
		}
		return list;
	}
	public List<PackageThirdDTO> packageList(String city) throws CommonException{
		SqlSession session=MySqlSessionFactory.openSession();
		List<PackageThirdDTO> 
		list = null;
		try{
		list = session.selectList(namespace+"packageList",city);
		
		}catch(Exception e){
			e.printStackTrace();
			throw new CommonException("패키지리스트 불러오기 실패");
		}finally {
			session.close();
		}
		return list;
	}
	
	public int selectCountList(String loc) throws CommonException{
		SqlSession session=MySqlSessionFactory.openSession();
		
		int cnt = 0;
		try{
			cnt = session.selectOne(namespace+"selectCountList",loc);
		
		}catch(Exception e){
			e.printStackTrace();
			throw new CommonException("패키지리스트 불러오기 실패");
		}finally {
			session.close();
		}
		return cnt;
	}
	
	
	public List<PackageThirdDTO>packageTableAllList(PackageThirdDTO dto) throws CommonException{
		SqlSession session=MySqlSessionFactory.openSession();
		List<PackageThirdDTO> list = null;
		try{
		list = session.selectList(namespace+"packageTableAllList",dto);
		
		}catch(Exception e){
			e.printStackTrace();
			throw new CommonException("패키지리스트 불러오기 실패");
		}finally {
			session.close();
		}
		return list;
	}
	
}//end class
