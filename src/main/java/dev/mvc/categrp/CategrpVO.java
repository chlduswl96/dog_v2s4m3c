package dev.mvc.categrp;

public class CategrpVO {

  /**
   * 카테고리 번호
   */
  private int categrpno;
  /**
   * 카테고리 이름
   */
  private String name;
  /**
   * 카테고리 출력 순서
   */
  private int seqno;
  /**
   * 카테고리 출력 유무
   */
  private String visible;
  /**
   * 카테고리 등록 날짜
   */
  private String rdate;
  /**
   * 카테고리 하위 컨텐츠 갯수
   */
  private int cnt;
  public int getCategrpno() {
    return categrpno;
  }
  public void setCategrpno(int categrpno) {
    this.categrpno = categrpno;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public String getVisible() {
    return visible;
  }
  public void setVisible(String visible) {
    this.visible = visible;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  
  @Override
  public String toString() {
    return "CategrpVO [categrpno=" + categrpno + ", name=" + name + ", seqno=" + seqno + ", visible=" + visible
        + ", rdate=" + rdate + ", cnt=" + cnt + "]";
  }
  
}
