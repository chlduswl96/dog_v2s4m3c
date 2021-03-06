package dev.mvc.admin;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.mem.MemProcInter;
import dev.mvc.mem.MemVO;

@Controller
public class AdminCont {
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc") // 이름 지정
  private AdminProcInter adminProc;

  @Autowired
  @Qualifier("dev.mvc.mem.MemProc") // 이름 지정
  private MemProcInter memProc;

  public AdminCont(){
    System.out.println("--> AdminCont created.");
  }
  
  /**
   * 관리자 목록
   * @return
   */
  // http://localhost:9090/ojt/admin/list.do
  @ResponseBody
  @RequestMapping(value = "/admin/list.do", 
                             method = RequestMethod.GET,
                             produces = "text/plain;charset=UTF-8")
  public String list(String id, String passwd) {
    return adminProc.list();
  }
  
  /**
   * 관리자 로그인 폼
   * @return
   */
  @RequestMapping(value = "/admin/login.do", 
                             method = RequestMethod.GET)
  public ModelAndView login(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/admin/login_form");
    return mav;
  }
  
  /**
   * 관리자 로그인 처리
   * @return
   */
  @RequestMapping(value = "/admin/login.do", method = RequestMethod.POST)
  public ModelAndView login_proc(HttpServletRequest request,
                                            HttpServletResponse response,
                                            HttpSession session,
                                            String id_admin, String passwd_admin) {
    ModelAndView mav = new ModelAndView();
    
    String[] admins = adminProc.list().split("\n");

    for (String admin : admins) {
      String[] tokens = admin.split("/");
      if (tokens[0].equals(id_admin) && tokens[1].equals(passwd_admin)) {
        session.setAttribute("aname", tokens[2]);
        // System.out.println("aname ==> " + tokens[2]);
      }
    }
    
    boolean sw = adminProc.login(id_admin, passwd_admin);
    if (sw == true) { // 로그인 성공
      session.setAttribute("id_admin", id_admin);
      session.setAttribute("passwd_admin", passwd_admin);
      
      MemVO memVO = memProc.read(1);
      
      session.setAttribute("id", memVO.getId());
      session.setAttribute("mname", memVO.getMname());
      session.setAttribute("memgradeno", memVO.getMemgradeno());
      session.setAttribute("memVO", memVO);
      
      mav.setViewName("redirect:/index.do");  
    } else {
      mav.setViewName("redirect:/admin/login_fail_msg.jsp");
    }
        
    return mav;
  }
  
  /**
   * 관리자 로그아웃 처리
   * @param session
   * @return
   */
  @RequestMapping(value="/admin/logout.do", method=RequestMethod.GET)
  public ModelAndView logout(HttpSession session){
    ModelAndView mav = new ModelAndView();
    session.invalidate(); // 모든 session 변수 삭제
    
    mav.setViewName("redirect:/admin/logout_msg.jsp");
    
    return mav;
  }
  
}
