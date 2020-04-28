package com.ds.service;

import java.util.List;
import java.util.Map;

import com.ds.domain.StoreVO;

public interface StoreService {
	public List<StoreVO> read();
	public List<Map<String, String>> cateList();
	public int Regist(StoreVO storeVO);
	public List<StoreVO> getList(StoreVO store);
}
