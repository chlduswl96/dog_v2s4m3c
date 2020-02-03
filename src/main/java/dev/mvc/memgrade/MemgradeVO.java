package dev.mvc.memgrade;

public class MemgradeVO {
  private int memgradeno;
  private int seqno;
  private String gname;
  private int count;
  
  
  public int getCount() {
    return count;
  }
  public void setCount(int count) {
    this.count = count;
  }
  public int getSeqno() {
    return seqno;
  }
  public void setSeqno(int seqno) {
    this.seqno = seqno;
  }
  public int getMemgradeno() {
    return memgradeno;
  }
  public void setMemgradeno(int memgradeno) {
    this.memgradeno = memgradeno;
  }
  public String getGname() {
    return gname;
  }
  public void setGname(String gname) {
    this.gname = gname;
  }
  
}
