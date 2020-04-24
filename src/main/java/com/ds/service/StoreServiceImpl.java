package com.ds.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.domain.StoreVO;
import com.ds.mapper.StoreMapper;

@Service
public class StoreServiceImpl implements StoreService {
	@Autowired
	private StoreMapper mapper;
	@Override
	public List<StoreVO> read() {
		return mapper.read();
	}
	
}
