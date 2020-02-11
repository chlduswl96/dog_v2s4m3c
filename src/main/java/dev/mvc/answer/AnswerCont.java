package dev.mvc.answer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AnswerCont {
  @Autowired
  @Qualifier("dev.mvc.answer.AnswerProc")
  private AnswerProcInter answerProc;
  
  public AnswerCont() {
    System.out.println("--> AnswerCont created");
  }
  
  
  public ModelAndView read(int iqynum) {
    ModelAndView mav = new ModelAndView();
    AnswerVO list = answerProc.readByIqynum(iqynum);
    mav.addObject("list", list);
    return mav;
  }

}
