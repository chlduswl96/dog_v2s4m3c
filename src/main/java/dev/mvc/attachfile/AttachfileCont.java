package dev.mvc.attachfile;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import dev.mvc.notice.NoticeProcInter;
import dev.mvc.notice.NoticeVO;
import nation.web.tool.Tool;
import nation.web.tool.Upload;

@Controller
public class AttachfileCont {
  @Autowired
  @Qualifier("dev.mvc.notice.NoticeProc") // 이름 지정
  private NoticeProcInter noticeProc;

  @Autowired
  @Qualifier("dev.mvc.attachfile.AttachfileProc") // 이름 지정
  private AttachfileProcInter attachfileProc;
  
  public AttachfileCont(){
    System.out.println("--> AttachfileCont created.");
  }
  
  /**
   * 파일 등록폼
   * @param categrpno 카테고리 그룹 FK
   * @param contentsno 컨텐츠 번호 FK
   * @return
   */
  // http://localhost:9090/team6/attachfile/create.do?noticeno=1
  @RequestMapping(value = "/attachfile/create.do", method = RequestMethod.GET)
  public ModelAndView create(int noticeno) {
    ModelAndView mav = new ModelAndView();

    NoticeVO noticeVO = noticeProc.read(noticeno);
    mav.addObject("noticeVO", noticeVO);

    mav.setViewName("/attachfile/create"); // /webapp/attachfile/create.jsp
    return mav;
  }
  
  @RequestMapping(value = "/attachfile/create.do", method = RequestMethod.POST)
  public ModelAndView create(RedirectAttributes ra,
                                           HttpServletRequest request,
                                           AttachfileVO attachfileVO) {
    // System.out.println("--> categrpno: " + categrpno);
    
    ModelAndView mav = new ModelAndView();
    // -----------------------------------------------------
    // 파일 전송 코드 시작
    // -----------------------------------------------------
    int noticeno = attachfileVO.getNoticeno();// 부모글 번호
    String fname = ""; // 원본 파일명
    String fupname = ""; // 업로드된 파일명
    long fsize = 0;  // 파일 사이즈
    String thumb = ""; // Preview 이미지
    int upload_count = 0; // 정상처리된 레코드 갯수
    
    String upDir = Tool.getRealPath(request, "/attachfile/storage");
    // 전송 파일이 없어서도 fnamesMF 객체가 생성됨.
    List<MultipartFile> fnamesMF = attachfileVO.getFnamesMF();
    int count = fnamesMF.size(); // 전송 파일 갯수
    if (count > 0) {
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
        vo.setNoticeno(noticeno);
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
    
    ra.addAttribute("upload_count", upload_count);
    ra.addAttribute("noticeno", noticeno);
   // ra.addAttribute("contentsno", attachfileVO.getContentsno());
    
    mav.setViewName("redirect:/attachfile/create_msg.jsp");
    return mav;
  }
  
  
  @RequestMapping(value = "/attachfile/list.do", method = RequestMethod.GET)
  public ModelAndView list() {
    ModelAndView mav = new ModelAndView();

    List<AttachfileVO> list = attachfileProc.list();
    mav.addObject("list", list);

    mav.setViewName("/attachfile/list");

    return mav;
  }
  
 
  /**
   * ZIP 압축 후 파일 다운로드
   * @param request
   * @param contentsno 파일 목록을 가져올때 사용할 글번호
   * @return
   */
  /*
  @RequestMapping(value = "/attachfile/downzip.do", 
                             method = RequestMethod.GET)
  public ModelAndView downzip(HttpServletRequest request, int noticeno) {
    ModelAndView mav = new ModelAndView();
    
    // 글번호에 해당하는 파일 목록 산출
    List<AttachfileVO> attachfile_list = attachfileProc.list_by_noticeno(noticeno);
    
    // 실제 저장된 파일명만 추출
    ArrayList<String> files_array = new ArrayList<String>();
    for(AttachfileVO attachfileVO:attachfile_list) {
      files_array.add(attachfileVO.getFupname());
    }
    
    String dir = "/attachfile/storage";
    String upDir = Tool.getRealPath(request, dir); // 절대 경로
    
    // 압축될 파일명, 동시 접속자 다운로드의 충돌 처리
    String zip = "download_files_" + Tool.getRandomDate() + ".zip"; 
    String zip_filename = upDir + zip;
    
    String[] zip_src = new String[files_array.size()]; // 파일 갯수만큼 배열 선언
    
    for (int i=0; i < files_array.size(); i++) {
      zip_src[i] = upDir + "/" + files_array.get(i); // 절대 경로 조합      
    }
 
    byte[] buffer = new byte[4096]; // 4 KB
    
    try {
      ZipOutputStream zipOutputStream = new ZipOutputStream(new FileOutputStream(zip_filename));
      
      for(int index=0; index < zip_src.length; index++) {
        FileInputStream in = new FileInputStream(zip_src[index]);
        
        Path path = Paths.get(zip_src[index]);
        String zip_src_file = path.getFileName().toString();
        // System.out.println("zip_src_file: " + zip_src_file);
        
        ZipEntry zipEntry = new ZipEntry(zip_src_file);
        zipOutputStream.putNextEntry(zipEntry);
        
        int length = 0;
        // 4 KB씩 읽어서 buffer 배열에 저장후 읽은 바이트수를 length에 저장
        while((length = in.read(buffer)) > 0) {
          zipOutputStream.write(buffer, 0, length); // 기록할 내용, 내용에서의 시작 위치, 기록할 길이
          
        }
        zipOutputStream.closeEntry();
        in.close();
      }
      zipOutputStream.close();
      
      File file = new File(zip_filename);
      
      if (file.exists() && file.length() > 0) {
        System.out.println(zip_filename + " 압축 완료");
      }
      
//      if (file.delete() == true) {
//        System.out.println(zip_filename + " 파일을 삭제했습니다.");
//      }
 
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
 
    // download 서블릿 연결
    mav.setViewName("redirect:/download?dir=" + dir + "&filename=" + zip);    
    
    return mav;
  }
  */
  
  /**
   * FK contentsno 컬럼값을 이용한 레코드 삭제 처리
   * @param ra
   * @param categrpno
   * @return
   */
  @RequestMapping(value = "/attachfile/delete_by_noticeno.do", 
                             method = RequestMethod.POST)
  public ModelAndView delete_by_noticeno(RedirectAttributes ra,
                                                                 int noticeno) {
    ModelAndView mav = new ModelAndView();

    int count = attachfileProc.delete_by_noticeno(noticeno);

    ra.addAttribute("count", count); // 삭제된 레코드 갯수
    ra.addAttribute("noticeno", noticeno);

    mav.setViewName("redirect:/attachfile/delete_by_noticeno_msg.jsp");

    return mav;
  }
 
}




