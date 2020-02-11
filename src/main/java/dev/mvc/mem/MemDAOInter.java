package dev.mvc.mem;

import java.util.HashMap;
import java.util.List;

public interface MemDAOInter {
  public List<MemVO> list_all();
  public List<MemVO> list_by_memgradeno(int memgradeno);
  public int count_by_memgradeno(int memgradeno);
  public int idcheck(String id);
  public int create(MemVO memVO);
  public int update_by_memgradeno(HashMap<String, Integer> map);
  public int count();
  public int check_passwd(HashMap<Object, Object> map);
  public int update_passwd(HashMap<Object, Object> map);
  public MemVO read_by_id(String id);
  public MemVO read(int memno);
  public int login(HashMap<Object, Object> map);
  public int update_grade(HashMap<Object, Object> map);
  public int update(MemVO memVO);
  public int delete(int memno);
  public List<MemVO> search_paging(PagingVO pagingVO);
  public List<MemVO> search_paging_by_memgradeno(PagingVO pagingVO);
  public int total_recod(PagingVO pagingVO);
  public int total_recod_by_memgradeno(PagingVO pagingVO);
  public MemVO read_by_email(String email);
  
}
