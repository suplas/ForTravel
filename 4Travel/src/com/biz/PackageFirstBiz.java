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

public class PackageFirstBiz {
	String namespace="com.fortravel.PackageFirstMapper.";
	
	
	public List<PackageFirstDTO> countryAllList(String loc) throws CommonException{
		SqlSession session=MySqlSessionFactory.openSession();
		List<PackageFirstDTO> list = null;
		try{
		list = session.selectList(namespace+"countryAllList",loc);
		
		}catch(Exception e){
			e.printStackTrace();
			throw new CommonException("패키지리스트 불러오기 실패");
		}finally {
			session.close();
		}
		return list;
	}
	
	
}//end class
