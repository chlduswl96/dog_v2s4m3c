package dev.mvc.team6;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
  @RequestMapping(value = "/", method = RequestMethod.GET)
  public ModelAndView home1() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/index.jsp"); // 파일 확장자 포함
    
    return mav;
  }
  
  @RequestMapping(value = "/home.do", method = RequestMethod.GET)
  public ModelAndView home2() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/index.jsp"); // 파일 확장자 포함
    
    return mav;
  }
  
  @RequestMapping(value = "/index.do", 
                            method = RequestMethod.GET)
  public ModelAndView home3() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/index"); // /webapp/index.jsp
 
    return mav;
  } 
  
}
