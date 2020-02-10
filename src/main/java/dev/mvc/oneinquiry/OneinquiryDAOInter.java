package dev.mvc.oneinquiry;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface OneinquiryDAOInter {
  
  /**
   * <xmp>
   * <insert id="create" parameterType="AttachfileVO">
   * </xmp>
   * @param attachfileVO
   * @return
   */
  public int create(OneinquiryVO oneinquiryVO);
  
  /**
   * <xmp>
   * 목록
   * <select id="list" resultType="OneinquiryVO">
   * </xmp>
   * @return
   */
  public List<OneinquiryVO> list_by_memno(int memno);
  
  /**
   * <xmp>
   * 조회
   * <select id="read" resultType="OneinquiryVO" parameterType="int">
   * </xmp>
   * @param iqynum
   * @return
   */
  public OneinquiryVO read(int iqynum);
  
  /**
   * <xmp>
   * 수정
   * <update id="update" parameterType="OneinquiryVO">
   * </xmp>
   * @param oneinquiryVO
   * @return
   */
  public int update(OneinquiryVO oneinquiryVO);
  
  /**
   * <xmp>
   * 삭제
   * <delete id="delete" parameterType="int">
   * </xmp>
   * @param iqynum
   * @return
   */
  public int delete(int iqynum);
  
  /**
   * 생성된 게시판 번호가져오기
   * @return
   */
  public int max_no();
  
  /**
   * 회원별 검색 레코드 개수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * <xmp>
   * 검색 + 페이징 목록
   * <select id="list_by_memno_paging" resultType="OneinquiryVO" parameterType="HashMap">
   * </xmp>
   * @param map
   * @return
   */
  public ArrayList<OneinquiryVO> list_by_memno_paging(HashMap<String, Object> map);

}
