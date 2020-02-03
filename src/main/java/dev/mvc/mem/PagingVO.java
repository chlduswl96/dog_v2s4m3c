package dev.mvc.mem;

public class PagingVO {
  String col;
  String word;
  int memgradeno;
  int recordCount;     // 조회된 전체 레코드 수
  int recordPerPage;  // 페이지당 레코드 수
  int pagePerBlock;   // 블럭당 페이지 수 
  int nowPage;         // 현재 페이지
  
  // 전체 페이지
  int totalPage; // = (int)(Math.ceil((double)recordCount/recordPerPage));
  // 페이지 그룹(전체 그룹)
  int totalGrp; // = (int)(Math.ceil((double)totalPage/pagePerBlock));       
  // 현재 그룹
  int nowGrp; // = (int)(Math.ceil( (double)nowPage / pagePerBlock ));    
  
  int startPage; // = ((nowGrp - 1) * pagePerBlock) + 1;     // 현재페이지가 속한 그룹의 시작 페이지
  int endPage; // = (nowGrp * pagePerBlock);                 // 현재페이지가 속한 그룹의 끝 페이지

  int forPage; //  = (nowGrp-1) * pagePerBlock;  // 이전 그룹의 마지막페이지 
  int nextPage; // = (nowGrp) * pagePerBlock + 1;    // 다음 그룹의 마지막페이지
  int startNum;
  int endNum;
  
  
  public int getMemgradeno() {
    return memgradeno;
  }
  public void setMemgradeno(int memgradeno) {
    this.memgradeno = memgradeno;
  }
  public int getStartNum() {
    return startNum;
  }
  public void setStartNum(int startNum) {
    this.startNum = startNum;
  }
  public int getEndNum() {
    return endNum;
  }
  public void setEndNum(int endNum) {
    this.endNum = endNum;
  }
  public int getRecordCount() {
    return recordCount;
  }
  public void setRecordCount(int recordCount) {
    this.recordCount = recordCount;
  }
  public int getRecordPerPage() {
    return recordPerPage;
  }
  public void setRecordPerPage(int recordPerPage) {
    this.recordPerPage = recordPerPage;
  }
  public int getPagePerBlock() {
    return pagePerBlock;
  }
  public void setPagePerBlock(int pagePerBlock) {
    this.pagePerBlock = pagePerBlock;
  }
  public int getTotalPage() {
    return totalPage;
  }
  public void setTotalPage(int totalPage) {
    this.totalPage = totalPage;
  }
  public int getTotalGrp() {
    return totalGrp;
  }
  public void setTotalGrp(int totalGrp) {
    this.totalGrp = totalGrp;
  }
  public int getNowGrp() {
    return nowGrp;
  }
  public void setNowGrp(int nowGrp) {
    this.nowGrp = nowGrp;
  }
  public int getStartPage() {
    return startPage;
  }
  public void setStartPage(int startPage) {
    this.startPage = startPage;
  }
  public String getCol() {
    return col;
  }
  public void setCol(String col) {
    this.col = col;
  }
  public String getWord() {
    return word;
  }
  public void setWord(String word) {
    this.word = word;
  }
  public int getNowPage() {
    return nowPage;
  }
  public void setNowPage(int nowPage) {
    this.nowPage = nowPage;
  }
  public int getEndPage() {
    return endPage;
  }
  public void setEndPage(int endPage) {
    this.endPage = endPage;
  }
  public int getForPage() {
    return forPage;
  }
  public void setForPage(int forPage) {
    this.forPage = forPage;
  }
  public int getNextPage() {
    return nextPage;
  }
  public void setNextPage(int nextPage) {
    this.nextPage = nextPage;
  }
  
}
