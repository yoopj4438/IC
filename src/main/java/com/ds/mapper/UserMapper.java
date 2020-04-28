package com.ds.mapper;

import org.apache.ibatis.annotations.Param;

import com.ds.domain.StoreVO;

public interface UserMapper {
	public StoreVO login(String sid);
}
