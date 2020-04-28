package com.ds.mapper;

import java.util.List;
import java.util.Map;

import com.ds.domain.ProdVO;


public interface ProdMapper {
	public void insert(ProdVO prod);
	public List<ProdVO> getList(int snum);
	public void modify(ProdVO prod);
	public void delete(ProdVO prod);
	public int insertDB(Map<String, Object> map);
}
