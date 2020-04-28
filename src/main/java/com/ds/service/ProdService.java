package com.ds.service;

import java.util.List;

import com.ds.domain.ProdVO;

public interface ProdService {
	public void register(ProdVO prod); // 등록
	public List<ProdVO> getList(int snum); // 조회
	public void modify(ProdVO prod);
	public void delete(ProdVO prod);
	public List<?> getExcelUpload(String excelFile);
}
