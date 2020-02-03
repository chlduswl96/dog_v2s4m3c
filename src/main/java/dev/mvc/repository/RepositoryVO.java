package dev.mvc.repository;

public class RepositoryVO {

  private int repositoryno;
  private int cnt;
  private String name;
  private int categrpno;
  private String manager;
  private String rdate;
  private int price;
  private String categrpname;
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
  public int getPrice() {
    return price;
  }
  public void setPrice(int price) {
    this.price = price;
  }
  public String getCategrpname() {
    return categrpname;
  }
  public void setCategrpname(String categrpname) {
    this.categrpname = categrpname;
  }
  @Override
  public String toString() {
    return "RepositoryVO [repositoryno=" + repositoryno + ", cnt=" + cnt + ", name=" + name + ", categrpno=" + categrpno
        + ", manager=" + manager + ", rdate=" + rdate + ", price=" + price + ", categrpname=" + categrpname + "]";
  }

  
}
