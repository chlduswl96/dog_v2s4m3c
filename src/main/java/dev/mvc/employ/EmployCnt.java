package dev.mvc.employ;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmployCnt {

  @Qualifier("dev.mvc.employ.EmployProc")
  @Autowired
  EmployProcInter employProc;
  
  @RequestMapping(value="/employ/create.do",method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("employ/create");
    return mav;
  }
  
  @RequestMapping(value="/employ/create.do",method = RequestMethod.POST)
  public ModelAndView create(EmployVO employVO) {
    ModelAndView mav = new ModelAndView();
    employProc.employCreate(employVO);
    mav.addObject("employVO",employVO);
    mav.setViewName("employ/create_result");
    return mav;
  }
  
  
  
  
}
