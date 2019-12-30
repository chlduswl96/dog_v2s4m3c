package dev.mvc.review;

import java.util.List;

public interface ReviewProcInter {
  public int create(ReviewVO reviewVO); 
  
  public List<ReviewVO> list();
  
}
