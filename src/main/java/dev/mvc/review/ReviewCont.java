package dev.mvc.review;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.notice.NoticeProcInter;
import dev.mvc.notice.NoticeVO;

@Controller
public class ReviewCont {
  @Autowired
  @Qualifier("dev.mvc.review.ReviewProc")
  private ReviewProcInter reviewProc;

  //http://localhost:9090/team6/review/create.do
  @RequestMapping(value = "/review/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/review/create"); // /webapp/categrp/create.jsp

    return mav;
  }

  @RequestMapping(value = "/review/create.do", method = RequestMethod.POST)
  public ModelAndView create(ReviewVO reviewVO) {
    ModelAndView mav = new ModelAndView();

    int count = reviewProc.create(reviewVO);
    //ra.addAttribute("count", count);
    //ra.addAttribute("noticeVO", noticeVO);
    mav.addObject("count", count);
    mav.addObject("reviewVO", reviewVO);

    mav.setViewName("/review/create_msg"); // /webapp/categrp/create_msg.jsp
    return mav;
  }

  //http://localhost:9090/team6/review/list.do
  @RequestMapping(value = "/review/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<ReviewVO> list = reviewProc.list();
    mav.addObject("list", list);
    mav.setViewName("/review/list"); // /webapp/contents/list_all.jsp
    return mav;
  }




}
