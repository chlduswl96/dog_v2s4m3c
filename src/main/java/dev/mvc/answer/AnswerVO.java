package dev.mvc.answer;

public class AnswerVO {
  /* 답변 번호 */
  private int awno;
  /* 문의 번호 */
  private int iqynum;
  /* 문의한 회원 번호 */
  private int memno;
  /* 답변 내용 */
  private String awcontent;
  /* 답변 등록일 */
  private String awdate;
  
  public int getAwno() {
    return awno;
  }
  public void setAwno(int awno) {
    this.awno = awno;
  }
  public int getIqynum() {
    return iqynum;
  }
  public void setIqynum(int iqynum) {
    this.iqynum = iqynum;
  }
  public int getMemno() {
    return memno;
  }
  public void setMemno(int memno) {
    this.memno = memno;
  }
  public String getAwcontent() {
    return awcontent;
  }
  public void setAwcontent(String awcontent) {
    this.awcontent = awcontent;
  }
  public String getAwdate() {
    return awdate;
  }
  public void setAwdate(String awdate) {
    this.awdate = awdate;
  }


}
