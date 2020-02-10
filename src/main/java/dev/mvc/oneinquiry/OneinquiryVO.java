package dev.mvc.oneinquiry;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class OneinquiryVO {
  

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
  public String getTitle() {
    return title;
  }
  public void setTitle(String title) {
    this.title = title;
  }
  public String getContent() {
    return content;
  }
  public void setContent(String content) {
    this.content = content;
  }
  public String getIdate() {
    return idate;
  }
  public void setIdate(String idate) {
    this.idate = idate;
  }
  public String getStatus() {
    return status;
  }
  public void setStatus(String status) {
    this.status = status;
  }
  public List<MultipartFile> getFnamesMF() {
    return fnamesMF;
  }
  public void setFnamesMF(List<MultipartFile> fnamesMF) {
    this.fnamesMF = fnamesMF;
  }
  
  /* 문의번호 */
  private int iqynum;
  /*  회원번호 */
  private int memno;
  /* 제목 */
  private String title;
  /* 내용 */
  private String content;
  /* 등록일 */
  private String idate;
  /* 답변 상태 */
  private String status;
  /** Form의 파일을 MultipartFile로 변환하여 List에 저장  */
  private List<MultipartFile> fnamesMF;
  
  
  @Override
  public String toString() {
    return "OneinquiryVO [iqynum=" + iqynum + ", memno=" + memno + ", title=" + title + ", content=" + content
        + ", idate=" + idate + ", status=" + status + ", fnamesMF=" + fnamesMF + "]";
  }
  
}
