package com.wolf.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.wolf.dao.AOrdersDAO;
import com.wolf.domain.AMemberDTO;
import com.wolf.domain.AOrdersDTO;
import com.wolf.domain.ListDTO;

@Service
public class AOrdersServiceImpl implements AOrdersService{

	@Inject
	private AOrdersDAO AOrdersDAO;
	
	@Override
	public ListDTO getProductinfo(int goodsNo) {
		return AOrdersDAO.getProductinfo(goodsNo);
	}

	@Override
	public AMemberDTO getMemberinfo(String memId) {
		return AOrdersDAO.getMemberinfo(memId);
	}

	@Override
	public void insertOrder(AOrdersDTO AOrdersdto) {
		AOrdersDAO.insertOrder(AOrdersdto);
	}

}
