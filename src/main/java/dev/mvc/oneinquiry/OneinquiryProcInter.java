package dev.mvc.oneinquiry;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

public interface OneinquiryProcInter {
  
  /**
   * <xmp>
   * <insert id="create" parameterType="OneinquiryVO">
   * </xmp>
   * @param oneinquiryVO
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

  public int max_no();
  
  /**
   * 회원별 검색 레코드 개수
   * @param hashMap
   * @return
   */
  public int search_count(HashMap<String, Object> hashMap);
  
  /**
   * 페이지 목록 문자열 생성, Box 형태
   * @param listFile 목록 파일명 
   * @param memno 회원번호
   * @param search_count 검색 갯수
   * @param nowPage 현재 페이지, nowPage는 1부터 시작
   * @return
   */
  public String pagingBox(String listFile, int memno, int search_count, int nowPage);
   
  
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
