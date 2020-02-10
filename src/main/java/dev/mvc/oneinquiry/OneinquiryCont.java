package dev.mvc.oneinquiry;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.answer.AnswerProcInter;
import dev.mvc.answer.AnswerVO;
import dev.mvc.attachfile.AttachfileProcInter;
import dev.mvc.attachfile.AttachfileVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;


@Controller
public class OneinquiryCont {
  @Autowired
  @Qualifier("dev.mvc.oneinquiry.OneinquiryProc")
  private OneinquiryProcInter oneinquiryProc;
  
  @Autowired
  @Qualifier("dev.mvc.answer.AnswerProc")
  private AnswerProcInter answerProc;
  
  @Autowired
  @Qualifier("dev.mvc.attachfile.AttachfileProc") // 이름 지정
  private AttachfileProcInter attachfileProc;
  
  public OneinquiryCont() {
    System.out.println("--> OneinquiryCont created");
  }
  
  //http://localhost:9090/team6/oneinquiry/create.do?memno=1
  @RequestMapping(value="/oneinquiry/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/oneinquiry/create");
    return mav;
  }
  
  @RequestMapping(value="/oneinquiry/create.do", method=RequestMethod.POST)
  public ModelAndView create(HttpServletRequest request,
                                       OneinquiryVO oneinquiryVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = oneinquiryProc.create(oneinquiryVO);
    //System.out.println(oneinquiryVO.getFnamesMF().get(0).getOriginalFilename());
    //System.out.println(oneinquiryVO.getFnamesMF().get(0).getSize());
    if(oneinquiryVO.getFnamesMF().size() == 0) {
      mav.addObject("count", count);
      mav.setViewName("/oneinquiry/create_msg");
    } else {
      // -----------------------------------------------------
      // 파일 전송 코드 시작
      // -----------------------------------------------------
      int max_no = oneinquiryProc.max_no();
      //System.out.println("max_no: " + max_no);
      int iqynum = max_no; // 부모글 번호
      String fname = ""; // 원본 파일명
      String fupname = ""; // 업로드된 파일명
      long fsize = 0;  // 파일 사이즈
      String thumb = ""; // Preview 이미지
      int upload_count = 0; // 정상처리된 레코드 갯수
      
      String upDir = Tool.getRealPath(request, "/oneinquiry/storage");
      // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
      List<MultipartFile> fnamesMF = oneinquiryVO.getFnamesMF();
      int fcount = fnamesMF.size(); // 전송 파일 갯수
      if (fcount > 0) {
        for (MultipartFile multipartFile:fnamesMF) { // 파일 추출
          fsize = multipartFile.getSize();  // 파일 크기
          if (fsize > 0) { // 파일 크기 체크
            fname = multipartFile.getOriginalFilename(); // 원본 파일명
            fupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장
            
            if (Tool.isImage(fname)) { // 이미지인지 검사
              thumb = Tool.preview(upDir, fupname, 120, 80); // thumb 이미지 생성
            }
          }
          AttachfileVO vo = new AttachfileVO();
          vo.setIqynum(iqynum);
          vo.setFname(fname);
          vo.setFupname(fupname);
          vo.setThumb(thumb);
          vo.setFsize(fsize);
          
          upload_count = upload_count + attachfileProc.create(vo); // 파일 1건 등록 정도 dbms 저장
        }
      }    
      // -----------------------------------------------------
      // 파일 전송 코드 종료
      // -----------------------------------------------------
      
      
      mav.addObject("count", count);
      mav.setViewName("/oneinquiry/create_msg");
    }
    System.out.println("file size: " + oneinquiryVO.getFnamesMF().size());
    System.out.println("oneinquiryVO.toString() =   " + oneinquiryVO.toString());

    return mav;
  }
  
  // http://localhost:9090/team6/oneinquiry/oneinquiry_list.do?memno=1
  /*@RequestMapping(value="/oneinquiry/oneinquiry_list.do", method=RequestMethod.GET)
  public ModelAndView list(int memno) {
    ModelAndView mav = new ModelAndView();
    
    List<OneinquiryVO> list = oneinquiryProc.list_by_memno(memno);
    mav.addObject("list", list);
    mav.setViewName("/oneinquiry/oneinquiry_list");
    return mav;
  }*/
  
  @ResponseBody
  @RequestMapping(value="/oneinquiry/list_a.do", method=RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String list_a(int memno) {
    List<OneinquiryVO> list = oneinquiryProc.list_by_memno(memno);
    
    JSONObject obj = new JSONObject();
    obj.put("list", list);
    return obj.toString();
  }
  
  @RequestMapping(value="/oneinquiry/read.do", method=RequestMethod.GET)
  public ModelAndView read(int iqynum) {
    ModelAndView mav = new ModelAndView();
    
    OneinquiryVO oneinquiryVO = oneinquiryProc.read(iqynum);
    mav.addObject("oneinquiryVO", oneinquiryVO);
    
    List<AttachfileVO> attachfile_list = attachfileProc.list_by_iqynum(iqynum);
    mav.addObject("attachfile_list", attachfile_list);
    
    AnswerVO answerVO = answerProc.readByIqynum(iqynum);
    mav.addObject("answerVO", answerVO);
    mav.setViewName("/oneinquiry/read");
    return mav;
  }
  
  //http://localhost:9090/ojt/contents/update.do?memberno=1&categrpno=1
  @RequestMapping(value="/oneinquiry/update.do", method=RequestMethod.GET)
  public ModelAndView update(int iqynum) {
    ModelAndView mav = new ModelAndView();

    OneinquiryVO oneinquiryVO = oneinquiryProc.read(iqynum);
    mav.addObject("oneinquiryVO", oneinquiryVO);
    mav.setViewName("/oneinquiry/update");
    return mav;
  }
 
  /**
   * 수정 처리
   * @param contentsVO
   * @return
   */
  @RequestMapping(value="/oneinquiry/update.do", method=RequestMethod.POST)
  public ModelAndView update(RedirectAttributes ra, OneinquiryVO oneinquiryVO) {
    ModelAndView mav = new ModelAndView();
    
    int count = oneinquiryProc.update(oneinquiryVO);
   
    ra.addAttribute("count", count);
    ra.addAttribute("iqynum", oneinquiryVO.getIqynum());
    ra.addAttribute("memno", oneinquiryVO.getMemno());
   
    mav.setViewName("redirect:/oneinquiry/update_msg.jsp");
    return mav;
  }
  
  //삭제폼
  @RequestMapping(value="/oneinquiry/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int iqynum) {
    ModelAndView mav = new ModelAndView();
    
    OneinquiryVO oneinquiryVO = oneinquiryProc.read(iqynum);
    mav.addObject("oneinquiryVO", oneinquiryVO);
    mav.setViewName("/oneinquiry/delete");
    //System.out.println("delete iqynum=" + iqynum);

    // mav.setViewName("redirect:/categrp/create_msg.jsp?count=" + count);
       
    return mav;
  }
 
  // 삭제 처리
  @RequestMapping(value="/oneinquiry/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int iqynum) {
    ModelAndView mav = new ModelAndView();
   
    int atcf_count = attachfileProc.delete_by_iqynum(iqynum);
    int oiq_count = 0;
    if (atcf_count >= 0 ) {
      oiq_count = oneinquiryProc.delete(iqynum);
    }
    mav.addObject("oiq_count", oiq_count);
    mav.setViewName("/oneinquiry/delete_msg");
                              
    return mav;
  }
  
  /**
   * 첨부 파일 1건 삭제 폼
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/oneinquiry/file_delete.do", 
                             method = RequestMethod.GET)
  public ModelAndView file_delete(int iqynum) {
    ModelAndView mav = new ModelAndView();

    OneinquiryVO oneinquiryVO = oneinquiryProc.read(iqynum);
    mav.addObject("oneinquiryVO", oneinquiryVO);
    
    List<AttachfileVO> attachfile_list = attachfileProc.list_by_iqynum(iqynum);
    mav.addObject("attachfile_list", attachfile_list);
    
    mav.setViewName("/oneinquiry/file_delete"); // file_delete.jsp

    return mav;
  }
  
  /**
   * 첨부 파일 1건 삭제 처리
   * 
   * @param contentsno
   * @return
   */
  @RequestMapping(value = "/oneinquiry/file_delete_proc.do", 
                             method = RequestMethod.GET)
  public ModelAndView file_delete_proc(int iqynum, int attachfileno) {
    ModelAndView mav = new ModelAndView();

    OneinquiryVO oneinquiryVO = oneinquiryProc.read(iqynum);
    mav.addObject("oneinquiryVO", oneinquiryVO);

    // 1건의 파일 삭제
    attachfileProc.delete(attachfileno);
    
    List<AttachfileVO> attachfile_list = attachfileProc.list_by_iqynum(iqynum);
    mav.addObject("attachfile_list", attachfile_list);
    
    mav.setViewName("/oneinquiry/file_delete"); // file_delete.jsp

    return mav;
  }
  
  /*@RequestMapping(value="/mypage/mypage_main.do", method=RequestMethod.GET)
  public ModelAndView mypage(int memno) {
    ModelAndView mav = new ModelAndView();
    
    List<OneinquiryVO> list = oneinquiryProc.list_by_memno(memno);
    mav.addObject("list", list);
    mav.setViewName("/mypage/mypage_main");
    return mav;
  }*/
  
  @RequestMapping(value="/mypage/mypage_main.do", method=RequestMethod.GET)
  public ModelAndView mypage(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    int memno = (int) session.getAttribute("memno");
    List<OneinquiryVO> list = oneinquiryProc.list_by_memno(memno);
    mav.addObject("list", list);
    mav.setViewName("/mypage/mypage_main");
    return mav;
  }
  
  @RequestMapping(value="/oneinquiry/oneinquiry_list.do", method=RequestMethod.GET)
  public ModelAndView list_by_memno_paging(
      @RequestParam(value="memno", defaultValue="1") int memno,
      @RequestParam(value="nowPage", defaultValue="1") int nowPage) {
    
    //System.out.println("--> nowPage: " + nowPage);
    
    ModelAndView mav = new ModelAndView();
    // /contents/list_by_categrpno_search_paging.jsp
    mav.setViewName("/oneinquiry/oneinquiry_list");   
    
    // 숫자와 문자열 타입을 저장해야함으로 Obejct 사용
    HashMap<String, Object> map = new HashMap<String, Object>();
    map.put("memno", memno); // #{memno}
    map.put("nowPage", nowPage);       
    
    // 검색 목록
    List<OneinquiryVO> list = oneinquiryProc.list_by_memno_paging(map);
    mav.addObject("list", list);
    
    // 검색된 레코드 갯수
    int search_count = oneinquiryProc.search_count(map);
    mav.addObject("search_count", search_count);
    
    OneinquiryVO oneinquiryVO = oneinquiryProc.read(memno);
    mav.addObject("oneinquiryVO", oneinquiryVO);
  
    /*
     * SPAN태그를 이용한 박스 모델의 지원, 1 페이지부터 시작 
     * 현재 페이지: 11 / 22   [이전] 11 12 13 14 15 16 17 18 19 20 [다음] 
     * 
     * @param listFile 목록 파일명 
     * @param categrpno 카테고리번호 
     * @param search_count 검색(전체) 레코드수 
     * @param nowPage     현재 페이지
     * @param word 검색어
     * @return 페이징 생성 문자열
     */ 
    String paging = oneinquiryProc.pagingBox("oneinquiry_list.do", memno, search_count, nowPage);
    mav.addObject("paging", paging);
  
    mav.addObject("nowPage", nowPage);
    
    return mav;
  }
  
  @RequestMapping(value="/mypage/main_post/rec_inq.do", method=RequestMethod.GET)
  public ModelAndView recent_inq(int memno, int cnt) {
    ModelAndView mav = new ModelAndView();
    
    List<OneinquiryVO> list = oneinquiryProc.list_by_memno(memno);
    mav.addObject("list", list);
    mav.addObject("cnt", cnt);
    mav.setViewName("/mypage/main_post/rec_inq");
    return mav;
  }

}
