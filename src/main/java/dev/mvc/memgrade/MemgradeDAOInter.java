package dev.mvc.memgrade;

import java.util.List;

public interface MemgradeDAOInter {
  
  public int create(MemgradeVO memgradeVO);
  public List<MemgradeVO> list();
  public int seqnoup(int memgradeno);
  public int seqnodown(int memgradeno);
  public int delete(int memgradeno);
  public int update(MemgradeVO memgradeVO);
  public MemgradeVO read(int memgradeno);
  
}
