package dev.mvc.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.review.ReviewProc")
public class ReviewProc implements ReviewProcInter{
 
  @Autowired
  private ReviewDAOInter reviewProc;
  @Override
  public int create(ReviewVO reviewVO) {
    int count = reviewProc.create(reviewVO);
    return count;
  }
  @Override
  public List<ReviewVO> list() {
    List<ReviewVO> list = reviewProc.list();
    return list;
  }
 

}
