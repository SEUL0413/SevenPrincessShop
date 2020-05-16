package com.sps.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.sps.vo.ClientVO;
import com.sps.vo.JoinVO;

public interface spsDAO {

	ClientVO selectById(String client_id);
	
	void insertMember(ClientVO clientVO);

	int countMember();

	ClientVO selectMember();

	ClientVO selectMember(int count);



	
	//판매 목록
//	List<JoinVO> selectSales(Map<String, String> map);
//	Integer countSales(Map<String, String> map);
	
	//판매건수
	Integer countSales(Map<String, Object> map);
	//판매목록
	List<JoinVO> selectSales(Map<String, Object> map);

	
	
	

	//회원 수
	int countClient(Map<String, Object> map);
	//회원목록
	ArrayList<ClientVO> selectClientList(Map<String, Object> map);
	
	
	//해당 회원의 주문 내역 
	List<JoinVO> selectOrderList(int client_idx);

	
	
	
	
	



}
