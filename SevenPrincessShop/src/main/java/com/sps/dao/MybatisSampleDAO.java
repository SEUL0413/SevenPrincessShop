package com.sps.dao;

import com.sps.vo.ClientVO;

public interface MybatisSampleDAO {

	void insertMember(ClientVO clientVO);

	int countMember();

	ClientVO selectMember();

	ClientVO selectMember(int count);

}
