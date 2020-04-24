package com.ds.mapper;

import java.util.List;

import com.ds.domain.ProdVO;


public interface ProdMapper {
	public void insert(ProdVO prod);
	public List<ProdVO> getList();
	public void modify(ProdVO prod);
	public void delete(ProdVO prod);
}
