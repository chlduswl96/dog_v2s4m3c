package dev.mvc.repository;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.categrp.CategrpProcInter;
import dev.mvc.categrp.CategrpVO;
import dev.mvc.dogcontents.ContentsProcInter;

@Controller
public class RepositoryCont {

  @Qualifier("dev.mvc.repository.RepositoryProc")
  @Autowired
  RepositoryProcInter repositoryProc;
  
  @Qualifier("dev.mvc.categrp.CategrpProc")
  @Autowired
  CategrpProcInter categrpProc;
  
  @Qualifier("dev.mvc.dogcontents.ContentsProc")
  @Autowired
  ContentsProcInter contentsProc;
  
  @RequestMapping(value="/repository/create.do", method = RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    List<RepositoryVO> list = repositoryProc.list();
    List<CategrpVO> selectList = categrpProc.tag_select();
    mav.addObject("selectList",selectList);
    mav.addObject("list",list);
    mav.setViewName("repository/create");
    return mav;
  }
  
  @RequestMapping(value="/repository/create.do", method = RequestMethod.POST)
  public ModelAndView create(RepositoryVO repositoryVO) {
    ModelAndView mav = new ModelAndView();
     repositoryProc.create(repositoryVO);
    mav.setViewName("redirect:/repository/create.do"); 
    return mav;
  }
  
  @RequestMapping(value="/repository/delete_child.do", method = RequestMethod.POST)
  public ModelAndView delete_child(int categrpno, RedirectAttributes ra) {
    ModelAndView mav = new ModelAndView();
    
    repositoryProc.child_delete(categrpno);
    
    ra.addAttribute("categrpno",categrpno);
    mav.setViewName("redirect:/categrp/delete.do"); 
    return mav;
  }
  
  @RequestMapping(value="/repository/update.do", method=RequestMethod.GET)
  public ModelAndView update(int repositoryno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("repositoryVO",repositoryProc.read(repositoryno));
    mav.addObject("selectList",categrpProc.tag_select());
    mav.setViewName("repository/update");
    return mav;
  }
  
  @RequestMapping(value="/repository/update.do", method=RequestMethod.POST)
  public ModelAndView update(RepositoryVO repositoryVO) {
    ModelAndView mav = new ModelAndView();
    HashMap<Object,Object> map = new HashMap<Object,Object>();
   
    // 변경 전 카테고리 번호
    int befor_categrpno = repositoryProc.read(repositoryVO.getRepositoryno()).getCategrpno();
    // 변경 할 카테고리 번호
    int afterno_categrpno = repositoryVO.getCategrpno();
    int repository_update_count = 0;
    int content_update_count = 0;
    
    System.out.println("변경 전 카테고리 번호 == >" + befor_categrpno);
    System.out.println("변경 후 카테고리 번호 == >" + afterno_categrpno);
    if(befor_categrpno != afterno_categrpno) {
      repository_update_count = repositoryProc.update(repositoryVO);
      if(repository_update_count > 0) {
        map.put("afterno_categrpno", afterno_categrpno);
        map.put("repositoryno", repositoryVO.getRepositoryno());
        content_update_count =  contentsProc.update_categrp(map);
        if(content_update_count > 0) {
          map.put("content_update_count", content_update_count);
          map.put("afterno_categrpno", afterno_categrpno);
          categrpProc.cnt_up_update_categrp(map);
          map.put("befor_categrpno", befor_categrpno);
          categrpProc.cnt_down_update_categrp(map);
        }
      }
    }else {
      // 카테고리 변경이 없을때
      repository_update_count = repositoryProc.update(repositoryVO);
    }
    
    mav.addObject("repository_update_count",repository_update_count);
    mav.addObject("content_update_count",content_update_count);
    mav.addObject("repositoryno",repositoryVO.getRepositoryno());
    mav.setViewName("repository/update_msg");
    return mav;
  }
  
  @RequestMapping(value="/repository/delete.do",method=RequestMethod.GET)
  public ModelAndView delete(int repositoryno) {
    ModelAndView mav = new ModelAndView();
    int count = repositoryProc.product_cnt(repositoryno);
    mav.addObject("count",count);
    mav.addObject("repositoryno",repositoryno);
    mav.setViewName("repository/delete");
    return mav;
  }
  
  @RequestMapping(value="/repository/delete.do",method=RequestMethod.POST)
  public ModelAndView delete_proc(int repositoryno) {
    ModelAndView mav = new ModelAndView();
    int count = repositoryProc.delete(repositoryno);
    mav.addObject("count",count);
    mav.setViewName("repository/delete_msg");
    return mav;
  }
  
  @RequestMapping(value="/repository/repository_child_delete.do",method=RequestMethod.POST)
  public ModelAndView product_delete(int repositoryno) {
    ModelAndView mav = new ModelAndView();
    int categrpno = repositoryProc.read(repositoryno).getCategrpno();
    int count = repositoryProc.product_delete(repositoryno);
    
    HashMap<Object,Object> map = new HashMap<>();
    map.put("categrpno", categrpno);
    map.put("cnt", count);
    repositoryProc.cate_cnt_down(map);
    mav.setViewName("redirect:/repository/delete.do?repositoryno=" + repositoryno);
    return mav;
  }
}
