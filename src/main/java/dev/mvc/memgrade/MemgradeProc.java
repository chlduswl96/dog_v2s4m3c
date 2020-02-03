package dev.mvc.memgrade;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component("dev.mvc.memgrade.MemgradeProc")
public class MemgradeProc implements MemgradeProcInter {
  @Autowired
  private MemgradeDAOInter memgradeDAO;

  @Override
  public int create(MemgradeVO memgradeVO) {
    return memgradeDAO.create(memgradeVO);
  }

  @Override
  public List<MemgradeVO> list() {
    return memgradeDAO.list();
  }

  @Override
  public int seqnoup(int memgradeno) {
    return memgradeDAO.seqnoup(memgradeno);
  }

  @Override
  public int seqnodown(int memgradeno) {
    return memgradeDAO.seqnodown(memgradeno);
  }

  @Override
  public int delete(int memgradeno) {
    return memgradeDAO.delete(memgradeno);
  }

  @Override
  public int update(MemgradeVO memgradeVO) {
    return memgradeDAO.update(memgradeVO);
  }

  @Override
  public MemgradeVO read(int memgradeno) {
    return memgradeDAO.read(memgradeno);
  }

  
}
