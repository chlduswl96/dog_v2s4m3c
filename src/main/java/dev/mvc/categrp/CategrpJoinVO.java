package dev.mvc.categrp;

public class CategrpJoinVO {
  
  private int repositoryno;
  private int cnt;
  private String name;
  private int categrpno;
  private String manager;
  private String rdate;
  private int categrpno1;
  private String name1;
  private int seqno;
  private String visible;
  private String rdate1;
  private int cnt1;
  public int getRepositoryno() {
    return repositoryno;
  }
  public void setRepositoryno(int repositoryno) {
    this.repositoryno = repositoryno;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public String getName() {
    return name;
  }
  public void setName(String name) {
    this.name = name;
  }
  public int getCategrpno() {
    return categrpno;
  }
  public void setCategrpno(int categrpno) {
    this.categrpno = categrpno;
  }
  public String getManager() {
    return manager;
  }
  public void setManager(String manager) {
    this.manager = manager;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public int getCategrpno1() {
    return categrpno1;
  }
  public void setCategrpno1(int categrpno1) {
    this.categrpno1 = categrpno1;
  }
  public String getName1() {
    return name1;
  }
  public void setName1(String name1) {
    this.name1 = name1;
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
  public String getRdate1() {
    return rdate1;
  }
  public void setRdate1(String rdate1) {
    this.rdate1 = rdate1;
  }
  public int getCnt1() {
    return cnt1;
  }
  public void setCnt1(int cnt1) {
    this.cnt1 = cnt1;
  }
  
  @Override
  public String toString() {
    return "CategrpJoinVO [repositoryno=" + repositoryno + ", cnt=" + cnt + ", name=" + name + ", categrpno="
        + categrpno + ", manager=" + manager + ", rdate=" + rdate + ", categrpno1=" + categrpno1 + ", name1=" + name1
        + ", seqno=" + seqno + ", visible=" + visible + ", rdate1=" + rdate1 + ", cnt1=" + cnt1 + "]";
  }
  
  
}
