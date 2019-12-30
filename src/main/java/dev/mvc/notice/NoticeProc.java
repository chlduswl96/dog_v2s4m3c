package dev.mvc.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.notice.NoticeProc")
public class NoticeProc implements NoticeProcInter{
  @Autowired
  private NoticeDAOInter noticeDAO;
  
  @Override
  public int create(NoticeVO noticeVO) {
    int count = noticeDAO.create(noticeVO);
    return count;
  }

  @Override
  public List<NoticeVO> list() {
    List<NoticeVO> list = noticeDAO.list();
    return list;
  }

  @Override
  public NoticeVO read(int noticeno) {
    NoticeVO noticeVO = noticeDAO.read(noticeno);
    return noticeVO;
  }

  @Override
  public int update(NoticeVO noticeVO) {
    int count =noticeDAO.update(noticeVO);
    return count;
  }

  @Override
  public int delete(int noticeno) {
    int count =noticeDAO.delete(noticeno);
    return count;
  }

  @Override
  public int count_by_noticeno(int noticeno) {
    int count = noticeDAO.count_by_noticeno(noticeno);
    return count;
  }

  @Override
  public int delete_by_noticeno(int noticeno) {
    int count = noticeDAO.delete_by_noticeno(noticeno);
    return count;
  }
  
  

}
