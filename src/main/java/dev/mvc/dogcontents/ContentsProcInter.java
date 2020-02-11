package dev.mvc.dogcontents;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import dev.mvc.productfile.ProductfileVO;

public interface ContentsProcInter {

  /**
   * @param categrpno 카테고리 번호
   * @return 카테고리번호에 맞는 레코드들
   */
  public ArrayList<ContentsVO> list(int categrpno);
  public int create(ContentsVO contentsVO);
  public ContentsVO read(int productno);
  public int cnt_update(int productno);
  public ContentsVO update_read(int productno);
  public int update(ContentsVO contentsVO);
  public int delete(int productno);
  public int update_categrp(HashMap<Object,Object> map);
  public int select_productno();
  public ArrayList<ContentsVO> list_all(HashMap<String,Object> map);
  public int total_count();
  public List<ProductfileVO> images_load(int productno);
  public int images_cnt(int productno);
  public int images_delete(String fupname);
  public ProductfileVO thum_select(int productno);
  public int thum_delete(int productno);
  public int count(HashMap<String,Object> map);
}
