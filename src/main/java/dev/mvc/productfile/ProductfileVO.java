package dev.mvc.productfile;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ProductfileVO {
  
  
  private int productfileno;
  private int productno;
  private String fname;
  private String fupname;
  private String thumb;
  private long fsize;
  private List<MultipartFile> fnamesMF;
  private String flabel;
  private String rdate;
  
  public int getProductfileno() {
    return productfileno;
  }
  public void setProductfileno(int productfileno) {
    this.productfileno = productfileno;
  }
  public int getProductno() {
    return productno;
  }
  public void setProductno(int productno) {
    this.productno = productno;
  }
  public String getFname() {
    return fname;
  }
  public void setFname(String fname) {
    this.fname = fname;
  }
  public String getFupname() {
    return fupname;
  }
  public void setFupname(String fupname) {
    this.fupname = fupname;
  }
  public String getThumb() {
    return thumb;
  }
  public void setThumb(String thumb) {
    this.thumb = thumb;
  }
  public long getFsize() {
    return fsize;
  }
  public void setFsize(long fsize) {
    this.fsize = fsize;
  }
  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }
  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }
  public String getFlabel() {
    return flabel;
  }
  public void setFlabel(String flabel) {
    this.flabel = flabel;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  @Override
  public String toString() {
    return "ProductfileVO [productfileno=" + productfileno + ", productno=" + productno + ", fname=" + fname
        + ", fupname=" + fupname + ", thumb=" + thumb + ", fsize=" + fsize + ", fnamesMF=" + fnamesMF + ", flabel="
        + flabel + ", rdate=" + rdate + ", getProductfileno()=" + getProductfileno() + ", getProductno()="
        + getProductno() + ", getFname()=" + getFname() + ", getFupname()=" + getFupname() + ", getThumb()="
        + getThumb() + ", getFsize()=" + getFsize() + ", getFnamesMF()=" + getFnamesMF() + ", getFlabel()="
        + getFlabel() + ", getRdate()=" + getRdate() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
        + ", toString()=" + super.toString() + "]";
  }
  
  

}