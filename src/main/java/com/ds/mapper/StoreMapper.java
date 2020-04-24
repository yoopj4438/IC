package com.ds.mapper;

import java.util.List;
import java.util.Map;

import com.ds.domain.StoreVO;

public interface StoreMapper {
	public List<StoreVO> read();
	public List<Map<String,String>> cateList();
	public int Regist(StoreVO storeVO);
}
