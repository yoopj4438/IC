package com.ds.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ds.domain.StoreVO;
import com.ds.mapper.UserMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UserServiceImpl implements UserService{
	@Autowired
	UserMapper userMapper;
	
	@Override
    public StoreVO login(String snum) {
		log.info("impl login");
        return userMapper.login(snum);
    }
}
