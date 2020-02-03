package dev.mvc.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.repository.RepositoryProc")
public class RepositoryProc implements RepositoryProcInter{

  @Autowired
  RepositoryDAOInter repositoryDAO;
  
  @Override
  public int create(RepositoryVO repositoryVO) {
    return repositoryDAO.create(repositoryVO);
  }

  @Override
  public List<RepositoryVO> list() {
    return repositoryDAO.list();
  }

  @Override
  public int child_delete(int categrpno) {
    return repositoryDAO.child_delete(categrpno);
  }

  @Override
  public RepositoryVO read(int repositoryno) {
    return repositoryDAO.read(repositoryno);
  }

  @Override
  public int update(RepositoryVO repositoryVO) {
    return repositoryDAO.update(repositoryVO);
  }

  @Override
  public int product_cnt(int repositoryno) {
    // TODO Auto-generated method stub
    return repositoryDAO.product_cnt(repositoryno);
  }

  @Override
  public int product_delete(int repositoryno) {
    return repositoryDAO.product_delete(repositoryno);
  }

  @Override
  public int delete(int repositoryno) {
    return repositoryDAO.delete(repositoryno);
  }

  @Override
  public int cate_cnt_down(HashMap<Object, Object> map) {
    return repositoryDAO.cate_cnt_down(map);
  }
  

}
