package dev.mvc.categrp;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.categrp.CategrpProc")
public class CategrpProc implements CategrpProcInter{
  
  @Autowired
  private CategrpDAOInter categrpDAO;

  @Override
  public ArrayList<CategrpVO> list(){
    return categrpDAO.list();
  }

  @Override
  public int create(CategrpVO categrpVO) {
    return categrpDAO.create(categrpVO);
  }

  @Override
  public List<CategrpVO> tag_select() {
    return categrpDAO.tag_select();
  }

  @Override
  public List<CategrpVO> update_select(int categrpno) {
    return categrpDAO.update_select(categrpno);
  }

  @Override
  public int update(CategrpVO categrpVO) {
    return categrpDAO.update(categrpVO);
  }

  @Override
  public int delete_child_cnt(int categrpno) {
    return categrpDAO.delete_child_cnt(categrpno);
  }

  @Override
  public int delete(int categrpno) {
    return categrpDAO.delete(categrpno);
  }

  @Override
  public List<CategrpJoinVO> repository_select(int categrpno) {
    return categrpDAO.repository_select(categrpno);
  }

  @Override
  public int cnt_up_update(int categrpno) {
    return categrpDAO.cnt_up_update(categrpno);
  }

  @Override
  public int cnt_down_update(int categrpno) {
    return categrpDAO.cnt_down_update(categrpno);
  }

  @Override
  public int cnt_up_update_categrp(HashMap<Object, Object> map) {
    return categrpDAO.cnt_up_update_categrp(map);
  }

  @Override
  public int cnt_down_update_categrp(HashMap<Object, Object> map) {
    return categrpDAO.cnt_down_update_categrp(map);
  }

  @Override
  public List<CategrpVO> list_seqno_asc() {
    return categrpDAO.list_seqno_asc();
  }

  @Override
  public List<CategrpVO> tag_select2() {
    return categrpDAO.tag_select2();
  }
  
}
