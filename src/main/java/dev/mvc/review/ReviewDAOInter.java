package dev.mvc.review;

import java.util.List;

public interface ReviewDAOInter {
  public int create(ReviewVO reviewVO); 
  
  public List<ReviewVO> list();
  
}
