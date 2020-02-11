package dev.mvc.notice;

import java.util.List;

public interface NoticeProcInter {
  
  public int create(NoticeVO noticeVO);

  public List<NoticeVO> list();
  
  public NoticeVO read(int noticeno);
  
  public int update(NoticeVO noticeVO);

  public int delete(int noticeno);
  
  public int count_by_noticeno(int noticeno);
  
  public int delete_by_noticeno(int noticeno);
  
}
