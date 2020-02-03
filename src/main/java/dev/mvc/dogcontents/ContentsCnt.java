package dev.mvc.dogcontents;


import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.fileupload.FileUploadException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.categrp.CategrpProcInter;
import dev.mvc.productfile.ProductfileProcInter;
import dev.mvc.productfile.ProductfileVO;
import dev.mvc.repository.RepositoryProcInter;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class ContentsCnt {

  @Qualifier("dev.mvc.dogcontents.ContentsProc")
  @Autowired
  ContentsProcInter contentsProc;
  

  @Qualifier("dev.mvc.categrp.CategrpProc")
  @Autowired
  CategrpProcInter categrpProc;
  
  @Autowired
  @Qualifier("dev.mvc.productfile.ProductfileProc") // 이름 지정
  private ProductfileProcInter productfileProc;
  
  @Autowired
  @Qualifier("dev.mvc.repository.RepositoryProc") // 이름 지정
  private RepositoryProcInter repositoryProc;
  
  @RequestMapping(value = "/contents/list.do", method = RequestMethod.GET)
  public ModelAndView list_by_categrpno(int categrpno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("list",contentsProc.list(categrpno));
    System.out.println(contentsProc.list(categrpno).toString());
    mav.setViewName("contents/list");
    return mav;
  }
  
  /**
   * 글쓰기 뷰로 이동
   * @return
   */
  @RequestMapping(value="/contents/create.do", method=RequestMethod.GET)
  public ModelAndView create() {
    ModelAndView mav = new ModelAndView();
    mav.addObject("select_tag",categrpProc.tag_select2());
    mav.setViewName("contents/create");
    return mav;
  }
  
  /**
   * 글 쓰기 DB에 저장
   * @param contentsVO
   * @param request
   * @return
   */
  @RequestMapping(value="/contents/create.do", method=RequestMethod.POST)
  public ModelAndView create(ContentsVO contentsVO,HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    //  상품 생성
    contentsProc.create(contentsVO);
    // 카테고리 cnt 증가
    categrpProc.cnt_up_update(contentsVO.getCategrpno());
    int productno =  contentsProc.select_productno(); //생성된 글 번호 가져오기
    String upDir = Tool.getRealPath(request, "/contents/storage");// 파일 저장 위치
    // 파일 DB에 썸네일하고 일단 파일 분리해서 올리기
    
    // ============================================
    // 파일 전송 코드 시작
    // ============================================
    // 파일을 가져온다.
    List<MultipartFile> fnamesMF = contentsVO.getFnamesMF();
    if(fnamesMF.get(0).getSize() > 0) {
      System.out.println("=================================== 이미지 생성 ========================");
      String fname = ""; //원본파일 이름
      String fupname = ""; // 업로드 될 파일 이름
      long fsize = 0; // 업로드 될 파일 사이즈
      
      int fnamesMF_count = fnamesMF.size(); // 전송 파일 갯수
      // 일반 파일
      if (fnamesMF_count > 0) {
        for (MultipartFile multipartFile : fnamesMF) { // 파일 추출
          fsize = multipartFile.getSize(); // 파일 크기
          if (fsize > 0) { // 파일 크기 체크
            fname = multipartFile.getOriginalFilename();
            fupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장
          }
          ProductfileVO fnamesMFVO = new ProductfileVO();
          fnamesMFVO.setFname(fname);// 원본 파일 이름
          fnamesMFVO.setFupname(fupname); // 업로드 될 파일 이름
          fnamesMFVO.setFsize(fsize); // 업로드 될 파일 사이즈
          fnamesMFVO.setProductno(productno); // 상품 번호
          productfileProc.create(fnamesMFVO); // DB에 정보 등록
        }
      }
    }
    
    MultipartFile fthum = contentsVO.getFthum();
    // 썸네일 생성
    if(fthum.getSize() > 0) {
      System.out.println("=================================== 썸네일 생성 ========================");
       
        String fupname ="";
       
        //썸네일은 파일을 저장 후 그 파일 을 읽어와서 썸네일을 만든다.
        fupname = Upload.saveFileSpring(fthum, upDir); // 원본 파일
        String thum_image = Tool.preview(upDir,fupname, 200, 300);// 썸네일 생성
        
        if(thum_image != null) {// 썸네일이 생성 됬다면
          Tool.deleteFile(upDir,fupname);// 원본파일 삭제
          String fname= contentsVO.getFthum().getOriginalFilename();
          long size = contentsVO.getFthum().getSize();
          
          ProductfileVO fthumVO = new ProductfileVO();
          fthumVO.setFname(fname);
          fthumVO.setFsize(size);
          fthumVO.setThumb(thum_image);
          fthumVO.setProductno(productno); // 상품 번호
          productfileProc.create(fthumVO);
        }else {
          Tool.deleteFile(upDir,fupname);// 원본파일 삭제
        }
    }
    // ============================================
    // 파일 전송 코드 종료
    // ============================================
    
    mav.setViewName("redirect:/contents/list_all.do?PageNumber=&col=&categrpno=&search=&keyword=");
    return mav;
  }
  
  @RequestMapping(value="/contents/list_all.do", method=RequestMethod.GET)
  public ModelAndView list_all(@RequestParam(defaultValue = "1")  int PageNumber,@RequestParam("col") String col, 
		  @RequestParam(defaultValue = "0") int categrpno , @RequestParam("search") String search,
		  @RequestParam("keyword") String keyword) {
    ModelAndView mav = new ModelAndView();
    
    System.out.println("PageNuber  ================ "  + PageNumber );
    System.out.println("col  ================ "  + col );
    System.out.println("categrpno  ================ "  + categrpno );
    System.out.println("search  ================ "  + search );
    System.out.println("keyword  ================ "  + keyword );
    HashMap<String , Object> map = new HashMap<>();
    int EndPageNumber = PageNumber * 5; 
    int StartPageNumber = EndPageNumber - 4;
    map.put("StartPageNumber", StartPageNumber);
    map.put("EndPageNumber", EndPageNumber);
    map.put("categrpno", categrpno);
    if(!(col.equals(""))) {
    	map.put("col", col);
    }
    if(!(search.equals(""))) {
    	map.put("search", search);
    }
    if( !(keyword.equals(""))) {
    	map.put("keyword", keyword);
    }

    mav.addObject("list",contentsProc.list_all(map)); 
    mav.addObject("total_count",contentsProc.count(map));
    mav.addObject("PageNumber",PageNumber);
    mav.addObject("col",col);
    mav.addObject("categrpno",categrpno);
    mav.addObject("search",search);
    mav.addObject("keyword",keyword);
    
    mav.setViewName("contents/list");
    return mav;
  }
  
  @ResponseBody
  @RequestMapping(value="/contents/repository_select.do", 
  method=RequestMethod.GET,
  produces = "text/plain;charset=UTF-8")
  public String repository_select(int categrpno) {
    JSONObject obj = new JSONObject();
    obj.put("repositoy_select", categrpProc.repository_select(categrpno));
    return obj.toString();
  }
  
  /**
   * 상품 불러오기
   * @param productno
   * @return
   */
  @RequestMapping(value="/contents/read.do", method=RequestMethod.GET)
  public ModelAndView read(int productno) {
    ModelAndView mav = new ModelAndView();
    contentsProc.cnt_update(productno);
    mav.addObject("contentsVO",contentsProc.read(productno));// 상품 불러오기
    mav.setViewName("contents/read");
    return mav;
  }
  
  /**
   * 상품 수정 폼 불러오기
   * @param productno
   * @return
   */
  @RequestMapping(value="/contents/update.do", method=RequestMethod.GET)
  public ModelAndView update(int productno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("contentsVO",contentsProc.update_read(productno));
    mav.addObject("select_tag",categrpProc.tag_select2());
    mav.setViewName("contents/update");
    return mav;
  }
  /**
   * 상품 수정 
   * @param productno
   * @return
   */
  @RequestMapping(value="/contents/update.do", method=RequestMethod.POST)
  public ModelAndView update(ContentsVO contentsVO) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<Object,Object> map = new HashMap<Object,Object>();
    System.out.println("contentsVO ===============================" + contentsVO.getCategrpno());
    System.out.println("contentsVO ===============================" + contentsVO.getProductno());
    System.out.println("contentsVO ===============================" + contentsVO.getDeliveryCharge());
    
    // 변경 전 카테고리 번호
    int befor_categrpno = contentsProc.read(contentsVO.getProductno()).getCategrpno();
    // 변경 할 카테고리 번호
    int afterno_categrpno = contentsVO.getCategrpno();
    int product_update_count = 0;
    
    System.out.println("변경 전 카테고리 번호 == >" + befor_categrpno);
    System.out.println("변경 후 카테고리 번호 == >" + afterno_categrpno);
    // 카테고리 변경
    if(befor_categrpno != afterno_categrpno) {
      System.out.println("================================ 실행 ");
      product_update_count = contentsProc.update(contentsVO);
      if(product_update_count > 0) {
          map.put("content_update_count", product_update_count);
          map.put("afterno_categrpno", afterno_categrpno);
          categrpProc.cnt_up_update_categrp(map);
          map.put("befor_categrpno", befor_categrpno);
          categrpProc.cnt_down_update_categrp(map);
      }
    }else {
      // 카테고리 변경이 없을때
      product_update_count = contentsProc.update(contentsVO);
    }
    
    mav.addObject("count",product_update_count);
    mav.addObject("productno",contentsVO.getProductno());
    mav.setViewName("contents/update_msg");
    return mav;
  }
  
  
  /**
   * 상품 삭제
   * @param productno
   * @return 
   */
  @RequestMapping(value="/contents/delete.do", method=RequestMethod.GET)
  public ModelAndView delete(int productno) {
    ModelAndView mav = new ModelAndView();
    mav.addObject("contentsVO",contentsProc.read(productno));
    mav.setViewName("contents/delete");
    return mav;
  }
  
  /**
   * 상품 삭제
   * @param productno
   * @return 
   */
  @RequestMapping(value="/contents/delete.do", method=RequestMethod.POST)
  public ModelAndView delete_proc(int productno,int categrpno,HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    // 전체 파일 가져오기
    List<ProductfileVO> file_list = productfileProc.file_all_read(productno);
    String upDir = Tool.getRealPath(request, "/contents/storage");// 파일 저장 위치
    for(ProductfileVO vo : file_list) {
      if(vo.getThumb() == null) {
        Tool.deleteFile(upDir, vo.getFupname());
      }else {
        Tool.deleteFile(upDir, vo.getThumb());
      }
    }
    
    categrpProc.cnt_down_update(categrpno);
    int count = contentsProc.delete(productno);
    mav.addObject("count",count);
    mav.setViewName("contents/delete_msg");
    return mav;
  }
  
  @RequestMapping(value="/contents/images_load.do", method=RequestMethod.GET)
  public ModelAndView imagesLoad(int productno){
    ModelAndView mav = new ModelAndView();
    // 수정 할 상품 이미지 호출
    int images_count = contentsProc.images_cnt(productno);
    mav.addObject("image_list",contentsProc.images_load(productno));
    mav.addObject("images_count",images_count);
    mav.addObject("productno",productno);
    mav.setViewName("contents/images_update");
    return mav;
  }
  
  @ResponseBody
  @RequestMapping(value="/contents/images_delete.do", method=RequestMethod.GET,
      produces = "text/plain;charset=UTF-8")
  public String images_delete(String fupname,int productno,HttpServletRequest request){
    String dir = request.getServletContext().getRealPath("/contents/storage");
    Tool.deleteFile(dir, fupname);// 폴더에서 제거
    contentsProc.images_delete(fupname); // 디비에서 제거
    
    JSONObject obj = new JSONObject();
    obj.put("images_count", contentsProc.images_cnt(productno));// 제거한 후 갯수
    return obj.toString();
  }
  
  @ResponseBody
  @RequestMapping(value="/contents/thum_delete.do", method=RequestMethod.GET,
      produces = "text/plain;charset=UTF-8")
  public String thum_delete(String thumb,int productno,HttpServletRequest request){
    //썸네일 제거
    String dir = request.getServletContext().getRealPath("/contents/storage");
    Tool.deleteFile(dir, thumb);// 폴더에서 제거
    contentsProc.thum_delete(productno);
    JSONObject obj = new JSONObject();
    return obj.toString();
  }
  
  @RequestMapping(value="/contents/file_update.do", method=RequestMethod.POST)
  public ModelAndView file_update(ContentsVO contentsVO,HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    // ============================================
    // 파일 전송 코드 시작
    // ============================================
    int productno =  contentsVO.getProductno();// 글 번호 가져오기
    String upDir = Tool.getRealPath(request, "/contents/storage");// 파일 저장 위치
    // 파일 DB에 썸네일하고 일단 파일 분리해서 올리기
    
    // ============================================
    // 파일 전송 코드 시작
    // ============================================
    // 파일을 가져온다.
    List<MultipartFile> fnamesMF = contentsVO.getFnamesMF();
    if(fnamesMF.get(0).getSize() > 0) {
      System.out.println("=================================== 업데이트 이미지 생성 ========================");
      String fname = ""; //원본파일 이름
      String fupname = ""; // 업로드 될 파일 이름
      long fsize = 0; // 업로드 될 파일 사이즈
      
      int fnamesMF_count = fnamesMF.size(); // 전송 파일 갯수
      // 일반 파일
      if (fnamesMF_count > 0) {
        for (MultipartFile multipartFile : fnamesMF) { // 파일 추출
          fsize = multipartFile.getSize(); // 파일 크기
          if (fsize > 0) { // 파일 크기 체크
            fname = multipartFile.getOriginalFilename();
            fupname = Upload.saveFileSpring(multipartFile, upDir); // 파일 저장
          }
          ProductfileVO fnamesMFVO = new ProductfileVO();
          fnamesMFVO.setFname(fname);// 원본 파일 이름
          fnamesMFVO.setFupname(fupname); // 업로드 될 파일 이름
          fnamesMFVO.setFsize(fsize); // 업로드 될 파일 사이즈
          fnamesMFVO.setProductno(productno); // 상품 번호
          productfileProc.create(fnamesMFVO); // DB에 정보 등록
        }
      }
    }
    
    MultipartFile fthum = contentsVO.getFthum();
    // 썸네일 생성
    if(fthum.getSize() > 0) {
      System.out.println("=================================== 업데이트 썸네일 생성 ========================");
      
        // 이전 썸네일 제거
        Tool.deleteFile(upDir,contentsProc.thum_select(productno).getThumb());// 원본파일 삭제
        contentsProc.thum_delete(productno);
        String fupname ="";
       
        //썸네일은 파일을 저장 후 그 파일 을 읽어와서 썸네일을 만든다.
        fupname = Upload.saveFileSpring(fthum, upDir); // 원본 파일
        String thum_image = Tool.preview(upDir,fupname, 200, 300);// 썸네일 생성
        
        if(thum_image != null) {// 썸네일이 생성 됬다면
          Tool.deleteFile(upDir,fupname);// 원본파일 삭제
          String fname= contentsVO.getFthum().getOriginalFilename();
          long size = contentsVO.getFthum().getSize();
          
          ProductfileVO fthumVO = new ProductfileVO();
          fthumVO.setFname(fname);
          fthumVO.setFsize(size);
          fthumVO.setThumb(thum_image);
          fthumVO.setProductno(productno); // 상품 번호
          productfileProc.create(fthumVO);
        }else {
          Tool.deleteFile(upDir,fupname);// 원본파일 삭제
        }
    }
    // ============================================
    // 파일 전송 코드 종료
    // ============================================
    mav.setViewName("redirect:/contents/list_all.do?PageNumber=&col=&categrpno=&search=&keyword=");
    return mav;
  }
  
}
