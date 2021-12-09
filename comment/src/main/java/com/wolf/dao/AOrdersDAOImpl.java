package com.wolf.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.wolf.domain.AMemberDTO;
import com.wolf.domain.AOrdersDTO;
import com.wolf.domain.ListDTO;

@Repository
public class AOrdersDAOImpl implements AOrdersDAO{

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.team.mapper.AOrdersMapper";

	@Override
	public ListDTO getProductinfo(int goodsNo) {
		return sqlSession.selectOne(namespace + ".getproductinfo", goodsNo);
	}

	@Override
	public AMemberDTO getMemberinfo(String memId) {
		return sqlSession.selectOne(namespace + ".getmemberinfo", memId);
	}

	@Override
	public void insertOrder(AOrdersDTO AOrdersdto) {
		sqlSession.insert(namespace + ".insertorder", AOrdersdto);
	}
}