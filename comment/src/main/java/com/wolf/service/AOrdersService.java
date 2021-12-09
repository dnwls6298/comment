package com.wolf.service;

import com.wolf.domain.AMemberDTO;
import com.wolf.domain.AOrdersDTO;
import com.wolf.domain.ListDTO;

public interface AOrdersService {

	public ListDTO getProductinfo(int goodsNo);
	
	public AMemberDTO getMemberinfo(String memId);
	
	public void insertOrder(AOrdersDTO AOrdersdto);
}
