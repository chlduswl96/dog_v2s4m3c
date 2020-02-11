package dev.mvc.attachfile;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

// 빈의 이름 지정
@Component("dev.mvc.attachfile.AttachfileProc")
public class AttachfileProc implements AttachfileProcInter {
  @Autowired
  private AttachfileDAOInter attachfileDAO; 
  
  @Override
  public int create(AttachfileVO attachfileVO) {
    int count = attachfileDAO.create(attachfileVO);
    return count;
  }

  @Override
  public List<AttachfileVO> list() {
    List<AttachfileVO> list = attachfileDAO.list();
    return list;
  }

  @Override
  public List<AttachfileVO> list_by_iqynum(int iqynum) {
    List<AttachfileVO> list = attachfileDAO.list_by_iqynum(iqynum);
    return list;
  }

  @Override
  public int delete(int attachfileno) {
    int count = attachfileDAO.delete(attachfileno);
    return count;
  }

  @Override
  public int count_by_iqynum(int iqynum) {
    int count = attachfileDAO.count_by_iqynum(iqynum);
    return count;
  }

  @Override
  public int delete_by_iqynum(int iqynum) {
    int count = attachfileDAO.delete_by_iqynum(iqynum);
    return count;
  }

}




