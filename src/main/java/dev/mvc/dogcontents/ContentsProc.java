package dev.mvc.dogcontents;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import dev.mvc.productfile.ProductfileVO;

@Component("dev.mvc.dogcontents.ContentsProc")
public class ContentsProc implements ContentsProcInter{

  @Autowired
  ContentsDAOInter ContentsDAO;
  @Override
  public ArrayList<ContentsVO> list(int categrpno) {
    return ContentsDAO.list(categrpno);
  }
  @Override
  public int create(ContentsVO contentsVO) {
    return ContentsDAO.create(contentsVO);
  }
  @Override
  public int cnt_update(int productno) {
    return ContentsDAO.cnt_update(productno);
  }
  @Override
  public ContentsVO read(int productno) {
    return ContentsDAO.read(productno);
  }
  @Override
  public ContentsVO update_read(int productno) {
    return ContentsDAO.update_read(productno);
  }
  @Override
  public int update(ContentsVO contentsVO) {
    return ContentsDAO.update(contentsVO);
  }
  @Override
  public int delete(int productno) {
    return ContentsDAO.delete(productno);
  }
  @Override
  public int update_categrp(HashMap<Object, Object> map) {
    return ContentsDAO.update_categrp(map);
  }
  @Override
  public int select_productno() {
    return ContentsDAO.select_productno();
  }
  @Override
  public ArrayList<ContentsVO> list_all(HashMap<String,Object> map) {
    return ContentsDAO.list_all(map);
  }
  @Override
  public int total_count() {
    return ContentsDAO.total_count();
  }
  @Override
  public List<ProductfileVO> images_load(int productno) {
    return ContentsDAO.images_load(productno);
  }
  @Override
  public int images_cnt(int productno) {
    return ContentsDAO.images_cnt(productno);
  }
  @Override
  public int images_delete(String fupname) {
    return ContentsDAO.images_delete(fupname);
  }
  @Override
  public ProductfileVO thum_select(int productno) {
    return ContentsDAO.thum_select(productno);
  }
  @Override
  public int thum_delete(int productno) {
    return ContentsDAO.thum_delete(productno);
  }
@Override
public int count(HashMap<String, Object> map) {
	return ContentsDAO.count(map);
}


}
