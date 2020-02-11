package dev.mvc.repository;

import java.util.HashMap;
import java.util.List;

public interface RepositoryProcInter {
  
  public int create(RepositoryVO repositoryVO);
  public List<RepositoryVO> list();
  public int child_delete(int categrpno);
  public RepositoryVO read(int repositoryno);
  public int update(RepositoryVO repositoryVO);
  public int product_cnt(int repositoryno);
  public int product_delete(int repositoryno);
  public int delete(int repositoryno);
  public int cate_cnt_down(HashMap<Object,Object> map);


}
