package com.biz;

import java.util.HashMap;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;

import com.dao.MySqlSessionFactory;
import com.entity.ReviewBoardDTO;
import com.entity.ReviewBoardPageDTO;
import com.exception.CommonException;

public class ReviewBoardBiz {
	String namespace="com.fortravel.ReviewBoardMapper.";
	
	public List<ReviewBoardDTO> bestredcnt(int readcnt) throws CommonException{
		
		SqlSession session=MySqlSessionFactory.openSession();
		List<ReviewBoardDTO> list=null;
		try{
		list=session.selectList(namespace+"bestredcnt",readcnt);
		System.out.println("biz통과");
		}catch(Exception e){
			System.out.println("불러오기실패");
			throw new CommonException("게시판 불러오기 실패");
		}finally {
			session.close();
		}
		return list;
	}	
	
	public void reviewBoardWrite(HashMap<String, String> map) throws CommonException{
		SqlSession session = MySqlSessionFactory.openSession();
		try{
			session.insert(namespace+"reviewBoardWrite", map);
			session.commit();
		}catch(Exception e){
			e.printStackTrace();
			throw new CommonException("글쓰기 실패");
		}
		finally {
			session.close();
		}
		
	}//end boardWrite
	
	public void boardReadcnt(int num){
		SqlSession session=MySqlSessionFactory.openSession();
		try{
			session.update(namespace+"boardReadcnt",num);
			session.commit();
		}finally {
			session.close();
		
		}
	}	
	
	public ReviewBoardDTO boardRetrieve(int num){
		boardReadcnt(num);
		SqlSession session=MySqlSessionFactory.openSession();
		ReviewBoardDTO dto=null;
		try{
			dto=session.selectOne(namespace+"boardRetrieve",num);
		}finally {
			session.close();
		}
		return dto;
	}
	public List<ReviewBoardDTO> ReviewBoardSelect() throws CommonException{
		SqlSession session=MySqlSessionFactory.openSession();
		List<ReviewBoardDTO> list=null;
		try{
		list=session.selectList(namespace+"ReviewBoardSelect");
		System.out.println(list.size());
		}catch(Exception e){
			System.out.println("불러오기실패");
			throw new CommonException("게시판 불러오기 실패");
		}finally {
			session.close();
		}
		return list;
	}
	//전체 레코드
		private int totalrecord(){
			SqlSession session=MySqlSessionFactory.openSession();
			int count=0;
			try{
				count=session.selectOne("totalrecord");
			}finally {
				session.close();
			}
			return count;
		}//end total record
	
	public ReviewBoardPageDTO boardNewPage(HashMap<String, String> map){
		ReviewBoardPageDTO page=new ReviewBoardPageDTO();
		int curPage=Integer.parseInt(map.get("curpage"));
		int perPage=Integer.parseInt(map.get("perPage"));
		
		SqlSession session=MySqlSessionFactory.openSession();
		List<ReviewBoardDTO> list=null;
		int skip=(curPage-1)*page.getPerpage();
		page.setPerpage(perPage);
		try{
			list=session.selectList(namespace+"boardNewPage",map,new RowBounds(skip,page.getPerpage()));
		}finally {
			session.close();
		}
			//pageDTO에 4가지 정보 저장
		page.setList(list);
		page.setCurpage(curPage);
		page.setTotalrecord(totalrecord());
		return page;
	}
	
	public List<String> locSelect(HashMap<String, String> map){
		
		SqlSession session=MySqlSessionFactory.openSession();
		List<String> list=null;
		try{
			list=session.selectList(namespace+"locSelect", map);
		}finally {
			session.close();
		}
			//pageDTO에 4가지 정보 저장
		return list;
	}
	
}//end class
