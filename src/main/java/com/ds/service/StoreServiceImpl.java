package com.ds.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.domain.StoreVO;
import com.ds.mapper.StoreMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreMapper storeMapper;
	@Override
	public List<StoreVO> read() {
		return storeMapper.read();
	}
public List<Map<String, String>> cateList(){
		
		return storeMapper.cateList(); 
	};
	@Override
	public int Regist(StoreVO storeVO) {
		log.info("storeRegist");
		return storeMapper.Regist(storeVO);
	}
	
}
