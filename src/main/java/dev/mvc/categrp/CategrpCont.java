package dev.mvc.categrp;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.dogcontents.ContentsProcInter;
import dev.mvc.repository.RepositoryProcInter;

@Controller
public class CategrpCont {
  
  @Qualifier("dev.mvc.categrp.CategrpProc")
  @Autowired
  CategrpProcInter categrpProc;
  
  @Qualifier("dev.mvc.repository.RepositoryProc")
  @Autowired
  RepositoryProcInter repostoryProc;
  
  @Qualifier("dev.mvc.dogcontents.ContentsProc")
  @Autowired
  ContentsProcInter contentsProc;
  
  // http://localhost:9090/ojt/categrp/create.jsp
  @RequestMapping(value = "/categrp/create.do", method = RequestMethod.POST)
  public ModelAndView create(CategrpVO categrpVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = categrpProc.create(categrpVO);
    
    if(count > 0) {
      mav.setViewName("redirect:/categrp/list.do"); 
    }else {
      mav.setViewName("redirect:/categrp/list.do"); 
    }
    return mav;
  }
  
  @RequestMapping(value = "/categrp/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();
    List<CategrpVO> list = categrpProc.list();
    mav.addObject("list",list);
    mav.setViewName("/categrp/list");
    return mav;
  }
  
  @RequestMapping(value="/categrp/update.do", method=RequestMethod.GET)
  public ModelAndView update(int categrpno){
    ModelAndView mav = new ModelAndView();
    mav.addObject("update_select",categrpProc.update_select(categrpno));
    mav.setViewName("categrp/update");
    return mav;
  }
  
  @RequestMapping(value="/categrp/update.do", method=RequestMethod.POST)
  public ModelAndView update(CategrpVO categrpVO){
    ModelAndView mav = new ModelAndView();
    mav.addObject("count",categrpProc.update(categrpVO));
    
    System.out.println(categrpProc.update(categrpVO));
    mav.setViewName("categrp/update_msg");
    return mav;
  }
  
  @RequestMapping(value="/categrp/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int categrpno){
    ModelAndView mav = new ModelAndView();
    int child_count = categrpProc.delete_child_cnt(categrpno);
    mav.addObject("child_count", child_count);
    mav.addObject("categrpno", categrpno);
    mav.setViewName("categrp/delete");
    return mav;
  }
  
  @RequestMapping(value="/categrp/delete.do", method=RequestMethod.POST)
  public ModelAndView child_delete(int categrpno){
    ModelAndView mav = new ModelAndView();
    int count = categrpProc.delete(categrpno);
    mav.addObject("count",count);
    mav.setViewName("categrp/delete_msg");
    return mav;
  }
  
  @RequestMapping(value="/categrp/list_index_left.do", method=RequestMethod.GET)
  public ModelAndView list_index_left() {
    ModelAndView mav = new ModelAndView();

    List<CategrpVO> list = categrpProc.list_seqno_asc();
    mav.addObject("list",list);
    int total_count = contentsProc.total_count();
    mav.addObject("total_count",total_count);
    
    return mav;
  }
  
  @RequestMapping(value = "/categrp/categrp_list.do", method = RequestMethod.GET)
  public ModelAndView categrp_list() {
    ModelAndView mav = new ModelAndView();
    
    List<CategrpVO> list = categrpProc.list_seqno_asc();
    mav.addObject("list",list);
    int total_count = contentsProc.total_count();
    mav.addObject("total_count",total_count);
    
    return mav;
  }
  
}
