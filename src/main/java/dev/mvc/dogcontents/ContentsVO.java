package dev.mvc.dogcontents;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ContentsVO {

  private int categrpno;//카테고리
  private int productno;// 상품 번호 ㅁ
  private int repositoryno;// 재고 번호
  private String title;// 제목 ㅁ
  private String keyword; //키워드 ㅁ
  private int likey; //좋아요 ㅁ
  private int cnt; // 조회수 ㅁ
  private String rdate; // 등록 시간 ㅁ
  private String manager; // 등록 사용자 ㅁ
  private String contents; // 내용
  private int repositorycnt;
  private int repositoryprice;
  private String repositoryname;
  private String categrpname;
  private String view_thumb;
  private int price;
  private int deliveryCharge;
  
  // 파일 업로드
  private MultipartFile fthum;
  private List<MultipartFile> fnamesMF;
  public int getCategrpno() {
    return categrpno;
  }
  public void setCategrpno(int categrpno) {
    this.categrpno = categrpno;
  }
  public int getProductno() {
    return productno;
  }
  public void setProductno(int productno) {
    this.productno = productno;
  }
  public int getRepositoryno() {
    return repositoryno;
  }
  public void setRepositoryno(int repositoryno) {
    this.repositoryno = repositoryno;
  }
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getKeyword() {
    return keyword;
  }
  public void setKeyword(String keyword) {
    this.keyword = keyword;
  }
  public int getLikey() {
    return likey;
  }
  public void setLikey(int likey) {
    this.likey = likey;
  }
  public int getCnt() {
    return cnt;
  }
  public void setCnt(int cnt) {
    this.cnt = cnt;
  }
  public String getRdate() {
    return rdate;
  }
  public void setRdate(String rdate) {
    this.rdate = rdate;
  }
  public String getManager() {
    return manager;
  }
  public void setManager(String manager) {
    this.manager = manager;
  }
  public String getContents() {
    return contents;
  }
  public void setContents(String contents) {
    this.contents = contents;
  }
  public int getRepositorycnt() {
    return repositorycnt;
  }
  public void setRepositorycnt(int repositorycnt) {
    this.repositorycnt = repositorycnt;
  }
  public int getRepositoryprice() {
    return repositoryprice;
  }
  public void setRepositoryprice(int repositoryprice) {
    this.repositoryprice = repositoryprice;
  }
  public String getRepositoryname() {
    return repositoryname;
  }
  public void setRepositoryname(String repositoryname) {
    this.repositoryname = repositoryname;
  }
  public String getCategrpname() {
    return categrpname;
  }
  public void setCategrpname(String categrpname) {
    this.categrpname = categrpname;
  }
  public String getView_thumb() {
    return view_thumb;
  }
  public void setView_thumb(String view_thumb) {
    this.view_thumb = view_thumb;
  }
  public int getPrice() {
    return price;
  }
  public void setPrice(int price) {
    this.price = price;
  }
  public int getDeliveryCharge() {
    return deliveryCharge;
  }
  public void setDeliveryCharge(int deliveryCharge) {
    this.deliveryCharge = deliveryCharge;
  }
  public MultipartFile getFthum() {
    return fthum;
  }
  public void setFthum(MultipartFile fthum) {
    this.fthum = fthum;
  }
  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }
  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }
  @Override
  public String toString() {
    return "ContentsVO [categrpno=" + categrpno + ", productno=" + productno + ", repositoryno=" + repositoryno
        + ", title=" + title + ", keyword=" + keyword + ", likey=" + likey + ", cnt=" + cnt + ", rdate=" + rdate
        + ", manager=" + manager + ", contents=" + contents + ", repositorycnt=" + repositorycnt + ", repositoryprice="
        + repositoryprice + ", repositoryname=" + repositoryname + ", categrpname=" + categrpname + ", view_thumb="
        + view_thumb + ", price=" + price + ", deliveryCharge=" + deliveryCharge + ", fthum=" + fthum + ", fnamesMF="
        + fnamesMF + ", getCategrpno()=" + getCategrpno() + ", getProductno()=" + getProductno()
        + ", getRepositoryno()=" + getRepositoryno() + ", getTitle()=" + getTitle() + ", getKeyword()=" + getKeyword()
        + ", getLikey()=" + getLikey() + ", getCnt()=" + getCnt() + ", getRdate()=" + getRdate() + ", getManager()="
        + getManager() + ", getContents()=" + getContents() + ", getRepositorycnt()=" + getRepositorycnt()
        + ", getRepositoryprice()=" + getRepositoryprice() + ", getRepositoryname()=" + getRepositoryname()
        + ", getCategrpname()=" + getCategrpname() + ", getView_thumb()=" + getView_thumb() + ", getPrice()="
        + getPrice() + ", getDeliveryCharge()=" + getDeliveryCharge() + ", getFthum()=" + getFthum()
        + ", getFnamesMF()=" + getFnamesMF() + ", getClass()=" + getClass() + ", hashCode()=" + hashCode()
        + ", toString()=" + super.toString() + "]";
  }

  
  
  
  
}
