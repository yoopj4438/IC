package com.ds.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.stereotype.Service;

import com.ds.domain.ProdVO;
import com.ds.excel.ExcelFileType;
import com.ds.mapper.ProdMapper;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;



@Service
@Log4j
@AllArgsConstructor
public class ProdServiceImpl implements ProdService {
	ProdMapper mapper;

	@Override
	public void register(ProdVO prod) {
		mapper.insert(prod);
	}

	@Override
	public List<ProdVO> getList(int snum) {
		return mapper.getList(snum);
	}
	
	@Override
	public void modify(ProdVO prod) {
		mapper.modify(prod);
	}
	
	@Override
	public void delete(ProdVO prod) {
		mapper.delete(prod);
	}
	public List<?> getExcelUpload(String excelFile){
        
        log.info("@@@@@@@@@@@@@@@getExcelUpload START@@@@@@@@@@@@@@@ "+excelFile);
        
        Map<String, Object> map = new HashMap<String, Object>();
        List<?> list = null;
        
        try {
//            Workbook wbs = WorkbookFactory.create(new FileInputStream(excelFile));
            Workbook wbs = ExcelFileType.getWorkbook(excelFile);
            
            Sheet sheet = (Sheet) wbs.getSheetAt(0);
 
            //excel file 두번쨰줄부터 시작
            for (int i = sheet.getFirstRowNum() + 1; i <= sheet.getLastRowNum(); i++) {
                
                log.info("@@@@@@@@map @@@@@@@@@@@@@@@@ i : "+i);
                
                Row row = sheet.getRow(i);
                
                
                map.put("PNUM", ""+ExcelFileType.cellValue(row.getCell(0)));
                map.put("PNAME", ""+ExcelFileType.cellValue(row.getCell(1)));
                map.put("PRICE", ""+ExcelFileType.cellValue(row.getCell(2)));
                map.put("QUANTITY", ""+ExcelFileType.cellValue(row.getCell(3)));
                map.put("SNUM", ""+ExcelFileType.cellValue(row.getCell(4)));
                
                //신규삽입
                mapper.insertDB(map);
            }
 
            log.info("@@@@@@@@map @@@@@@@@@@@@@@@@"+map.toString());
            //데이터가져옵니다.
            
            
        }catch(Exception e){
            log.error("error : "+e.getMessage());
            log.error("error : "+e);
        }
        
        log.info("@@@@@@@@@@@@@@@getExcelUpload END@@@@@@@@@@@@@@@");
        return list;
        
  }
}
