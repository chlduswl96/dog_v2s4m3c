package dev.mvc.review;

public class ReviewVO {
/**
    reviewno                          NUMBER(10)     NOT NULL    PRIMARY KEY,
    memno                             NUMBER(10)     NULL ,
    cateno                            NUMBER(10)     NULL ,
    productno                         NUMBER(10)     NOT NULL,
    reviewtitle                       VARCHAR2(100)    NOT NULL,
    reviewcont                        CLOB    NOT NULL,
    reviewdate                        DATE     NOT NULL,
  FOREIGN KEY (memno) REFERENCES mem (memno),
  FOREIGN KEY (cateno) REFERENCES product (cateno)
 * 
 */
  /*府轰锅龋*/
  private int reviewno;
  /*府轰力格*/
  private String reviewtitle;
  /*府轰郴侩*/
  private String reviewcont;
  /*府轰累己朝楼*/
  private String reviewdate;
  
  
  public int getReviewno() {
    return reviewno;
  }
  public void setReviewno(int reviewno) {
    this.reviewno = reviewno;
  }

  public String getReviewtitle() {
    return reviewtitle;
  }
  public void setReviewtitle(String reviewtitle) {
    this.reviewtitle = reviewtitle;
  }
  public String getReviewcont() {
    return reviewcont;
  }
  public void setReviewcont(String reviewcont) {
    this.reviewcont = reviewcont;
  }
  public String getReviewdate() {
    return reviewdate;
  }
  public void setReviewdate(String reviewdate) {
    this.reviewdate = reviewdate;
  }

  
  
  
}
