package dev.mvc.notice;

import java.util.List;

public interface NoticeDAOInter {
  /**
   * <xmp> 등록 <insert id="create" parameterType="NoticeVO"> </xmp>
   * 
   * @param ReviewVO
   * @return 등록된 레코드 갯수
   */
  public int create(NoticeVO noticeVO);

  /**
   * <xmp> 전체 목록 <select id="list" resultType="NoticeVO"> </xmp>
   * 
   * @return
   */
  public List<NoticeVO> list();
  
  public NoticeVO read(int noticeno);
  
  public int update(NoticeVO noticeVO);

  public int delete(int noticeno);

  public int count_by_noticeno(int noticeno);
  
  public int delete_by_noticeno(int noticeno);
  
}
