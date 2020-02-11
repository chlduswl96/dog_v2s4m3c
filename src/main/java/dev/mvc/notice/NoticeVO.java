package dev.mvc.notice;

public class NoticeVO {
/**
 * noticeno                         NUMBER(10)     NOT NULL    PRIMARY KEY,
    noticetitle                       VARCHAR2(100)    NOT NULL,
    noticecont                        VARCHAR2(300)    NOT NULL,
    seqno                             NUMBER(1)    NOT NULL,
    visible                           VARCHAR2(10)     DEFAULT 'Y'     NOT NULL,
    rdate                             DATE     NOT NULL,
    adminno                           NUMBER(10)     NULL ,
 * 
 */
  private int noticeno;
  private String noticetitle;
  private String noticecont;
  private int seqno;
  private String visible;
  private String rdate;
  private int adminno;
  
  
  public int getNoticeno() {
    return noticeno;
  }
  public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
  }
  public String getNoticetitle() {
    return noticetitle;
  }
  public void setNoticetitle(String noticetitle) {
    this.noticetitle = noticetitle;
  }
  public String getNoticecont() {
    return noticecont;
  }
  public void setNoticecont(String noticecont) {
    this.noticecont = noticecont;
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
  public int getAdminno() {
    return adminno;
  }
  public void setAdminno(int adminno) {
    this.adminno = adminno;
  }
  
  
  
}
