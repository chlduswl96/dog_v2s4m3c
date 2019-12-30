package dev.mvc.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.attachfile.AttachfileProcInter;
import dev.mvc.attachfile.AttachfileVO;

@Controller
public class NoticeCont {
  @Autowired
  @Qualifier("dev.mvc.notice.NoticeProc")
  private NoticeProcInter noticeProc;
  
  @Autowired
  @Qualifier("dev.mvc.attachfile.AttachfileProc")
  private AttachfileProcInter attachfileProc;
  
  //  http://localhost:9090/team6/notice/list.do
 @RequestMapping(value = "/notice/list.do", method = RequestMethod.GET)
 public ModelAndView list() {
   ModelAndView mav = new ModelAndView();

   List<NoticeVO> list = noticeProc.list();
   mav.addObject("list", list);
   mav.setViewName("/notice/list"); // /webapp/contents/list_all.jsp

   return mav;
 }
 
 //  http://localhost:9090/team6/notice/create.do
 @RequestMapping(value = "/notice/create.do", method = RequestMethod.GET)
 public ModelAndView create() {
   ModelAndView mav = new ModelAndView();
   mav.setViewName("/notice/create"); // /webapp/categrp/create.jsp
   
   return mav;
 }

 @RequestMapping(value = "/notice/create.do", method = RequestMethod.POST)
 public ModelAndView create(NoticeVO noticeVO) {
   ModelAndView mav = new ModelAndView();
   
   int count = noticeProc.create(noticeVO);
   //ra.addAttribute("count", count);
   //ra.addAttribute("noticeVO", noticeVO);
   mav.addObject("count", count);
   mav.addObject("noticeVO", noticeVO);
   
   mav.setViewName("/notice/create_msg"); // /webapp/categrp/create_msg.jsp
   /**
    * redirectAttributes.addAttribute("count", count); // redirect parameter 적용
    redirectAttributes.addAttribute("categrpno", contentsVO.getCategrpno());
    
    mav.setViewName("redirect:/contents/create_msg.jsp");
    */
   return mav;
 }

 
 /**
  * 조회 http://localhost:9090/team6/notice/read.do?noticeno=1
  * 
  * @param contentsno
  * @return
  */
 @RequestMapping(value = "/notice/read.do", method = RequestMethod.GET)
 public ModelAndView read(int noticeno) {
   ModelAndView mav = new ModelAndView();

   List<AttachfileVO> list =  attachfileProc.list_by_noticeno(noticeno);
   NoticeVO noticeVO = noticeProc.read(noticeno);
   mav.addObject("noticeVO", noticeVO);
   mav.addObject("attachfile_list", list);
   
   mav.setViewName("/notice/read");

   return mav;
 }
 
 // http://localhost:9090/ojt/notice/update.do?noticeno=1;
 @RequestMapping(value = "/notice/update.do", method = RequestMethod.GET)
 public ModelAndView update(int noticeno) {
   ModelAndView mav = new ModelAndView();

   NoticeVO noticeVO = noticeProc.read(noticeno);
   mav.addObject("noticeVO", noticeVO);

   mav.setViewName("/notice/update"); // /webapp/contents/update.jsp

   return mav;
 }

 /**
  * 수정 처리
  * @param noticeVO
  * @return
  */
 @RequestMapping(value = "/notice/update.do", 
                            method = RequestMethod.POST)
 public ModelAndView update(NoticeVO noticeVO) {
   ModelAndView mav = new ModelAndView();

   int count = noticeProc.update(noticeVO);

   mav.addObject("count", count);
   //System.out.println("count : " + count);
   mav.addObject("noticeno", noticeVO.getNoticeno());

   mav.setViewName("/notice/update_msg"); 

   return mav;
 }
 

 /**
  * 한 건 삭제 폼
  * @param noticeno
  * @return
  */
//http://localhost:9090/ojt/notice/delete.do?noticeno=1
@RequestMapping(value = "/notice/delete.do", 
                           method = RequestMethod.GET)
public ModelAndView delete(int noticeno) {
  ModelAndView mav = new ModelAndView();

  NoticeVO noticeVO = noticeProc.read(noticeno);
  mav.addObject("noticeVO", noticeVO);

  mav.setViewName("/notice/delete"); // /webapp/contents/delete.jsp
  return mav;
}
 
/**
 * 한 건 삭제 처리
 * @param ra
 * @param noticeno
 * @return
 */
@RequestMapping(value = "/notice/delete.do", method = RequestMethod.POST)
public ModelAndView delete(RedirectAttributes ra, int noticeno) {
  ModelAndView mav = new ModelAndView();

  int count = noticeProc.delete(noticeno);
  System.out.println("count :" + count);

  ra.addAttribute("count", count); 
  ra.addAttribute("noticeno", noticeno); 
  
  mav.setViewName("redirect:/notice/delete_msg.jsp");

  return mav;
}

/**
 * 첨부 파일 1건 삭제 폼
 * 
 * @param contentsno
 * @return
 */
@RequestMapping(value = "/notice/file_delete.do", 
                           method = RequestMethod.GET)
public ModelAndView file_delete(int noticeno) {
  ModelAndView mav = new ModelAndView();

  NoticeVO noticeVO = noticeProc.read(noticeno);
  mav.addObject("noticeVO", noticeVO);

  List<AttachfileVO> attachfile_list = attachfileProc.list_by_noticeno(noticeno);
  mav.addObject("attachfile_list", attachfile_list);
  
  mav.setViewName("/notice/file_delete"); // file_delete.jsp

  return mav;
}

/**
 * 첨부 파일 1건 삭제 처리
 * 
 * @param contentsno
 * @return
 */
@RequestMapping(value = "/notice/file_delete_proc.do", 
                           method = RequestMethod.GET)
public ModelAndView file_delete_proc(int noticeno, int attachno) {
  ModelAndView mav = new ModelAndView();

  NoticeVO noticeVO = noticeProc.read(noticeno);
  mav.addObject("noticeVO", noticeVO);

  // 1건의 파일 삭제
  attachfileProc.delete(attachno);
  
  List<AttachfileVO> attachfile_list = attachfileProc.list_by_noticeno(noticeno);
  mav.addObject("attachfile_list", attachfile_list);
  
  mav.setViewName("/notice/file_delete"); // file_delete.jsp

  return mav;
}

 
 
}
