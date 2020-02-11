package dev.mvc.memgrade;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.admin.AdminProcInter;
import dev.mvc.mem.MemProcInter;

@Controller
public class MemgradeCont {

  @Autowired
  @Qualifier("dev.mvc.memgrade.MemgradeProc")
  private MemgradeProcInter memgradeProc;
  
  @Autowired
  @Qualifier("dev.mvc.mem.MemProc")
  private MemProcInter memProc;
  
  @Autowired
  @Qualifier("dev.mvc.admin.AdminProc")
  private AdminProcInter adminProc;

  public MemgradeCont() {
    System.out.println("--> MemgradeCont created");
  }
  
  // 등급 등록
  // http://localhost:9090/team6/memgrade/create.do
  @RequestMapping(value = "/memgrade/create.do", method = RequestMethod.POST)
  public ModelAndView create(MemgradeVO memgradeVO) {
    ModelAndView mav = new ModelAndView();

    int count = memgradeProc.create(memgradeVO);
    
    if(count == 0) {
      mav.setViewName("redirect:/memgrade/create_msg.jsp?count=" + count);
    } else {
      mav.setViewName("redirect:/memgrade/list.do");
    }
    return mav;
  }

  // 등급 목록
  @RequestMapping(value = "/memgrade/list.do", method = RequestMethod.GET)
  public ModelAndView lsit(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    
    if (adminProc.isAdmin(session)) {
      mav.setViewName("/memgrade/list");
      List<MemgradeVO> list = memgradeProc.list();
      mav.addObject("list", list);
    } else {
      mav.setViewName("redirect:/admin/login_need.jsp");
    }

    return mav;
  }
  
  // 출력 순서 up
  @RequestMapping(value = "/memgrade/seqnoup.do", method = RequestMethod.GET)
  public ModelAndView seqnoup(int memgradeno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/memgrade/list.do");
    memgradeProc.seqnoup(memgradeno);
    
    return mav;
  }
  // 출력 순서 down
  @RequestMapping(value = "/memgrade/seqnodown.do", method = RequestMethod.GET)
  public ModelAndView seqnodown(int memgradeno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/memgrade/list.do");
    memgradeProc.seqnodown(memgradeno);
    
    return mav;
  }
  
  // 등급 삭제 form
  @RequestMapping(value = "/memgrade/delete.do", method = RequestMethod.GET)
  public ModelAndView delete(int memgradeno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memgrade/delete");
    
    MemgradeVO memgradeVO = memgradeProc.read(memgradeno);
    int count_by_memgradeno = memProc.count_by_memgradeno(memgradeno);
    mav.addObject("count_by_memgradeno", count_by_memgradeno);
    mav.addObject("memgradeVO", memgradeVO);
    
    return mav;
  }
  // 등급 삭제 proc
  @RequestMapping(value = "/memgrade/delete.do", method = RequestMethod.POST)
  public ModelAndView delete_proc(int memgradeno) {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/memgrade/delete_msg");
    
    mav.addObject("gname", memgradeProc.read(memgradeno).getGname());
    
    int count = memgradeProc.delete(memgradeno);
    mav.addObject("count", count);
    
    return mav;
  }
  
  // 등급 수정 form
  @RequestMapping(value = "/memgrade/update.do", method = RequestMethod.GET)
  public ModelAndView update_form(int memgradeno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memgrade/update");
    MemgradeVO memgradeVO = memgradeProc.read(memgradeno);
    mav.addObject("memgradeVO", memgradeVO);
    
    return mav;
  }
  // 등급 수정 proc
  @RequestMapping(value = "/memgrade/update.do", method = RequestMethod.POST)
  public ModelAndView update_proc(MemgradeVO memgradeVO) {
    ModelAndView mav = new ModelAndView();
    int count = memgradeProc.update(memgradeVO);
    mav.addObject("count", count);
    mav.setViewName("/memgrade/update_msg");
    
    return mav;
  }
  
  // 좌측 메뉴
  @RequestMapping(value = "/memgrade/list_index_left.do", method = RequestMethod.GET)
  public ModelAndView list_index_left() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memgrade/list_index_left");
    
    List<MemgradeVO> memgrade_list = memgradeProc.list();
    List<MemgradeVO> list = new ArrayList<MemgradeVO>();
    
    for(MemgradeVO memgradeVO : memgrade_list) {
      memgradeVO.setCount(memProc.count_by_memgradeno(memgradeVO.getMemgradeno()));
      list.add(memgradeVO);
    }
    
    mav.addObject("list", list);

    int cnt_tot = memProc.count();
    mav.addObject("cnt_tot", cnt_tot);
    
    return mav;
  }
  // 좌측 메뉴
  @RequestMapping(value = "/memgrade/grade_list.do", method = RequestMethod.GET)
  public ModelAndView grade_list() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/memgrade/grade_list");
    
    List<MemgradeVO> memgrade_list = memgradeProc.list();
    List<MemgradeVO> list = new ArrayList<MemgradeVO>();
    
    for(MemgradeVO memgradeVO : memgrade_list) {
      memgradeVO.setCount(memProc.count_by_memgradeno(memgradeVO.getMemgradeno()));
      list.add(memgradeVO);
    }
    
    mav.addObject("list", list);
    
    int cnt_tot = memProc.count();
    mav.addObject("cnt_tot", cnt_tot);
    
    return mav;
  }
  
}
