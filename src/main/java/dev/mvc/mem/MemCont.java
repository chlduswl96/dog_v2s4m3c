package dev.mvc.mem;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import dev.mvc.memgrade.MemgradeProcInter;
import dev.mvc.memgrade.MemgradeVO;
import dev.mvc.test.*;
import nation.web.tool.Tool;

@Controller
public class MemCont {

  @Autowired
  @Qualifier("dev.mvc.mem.MemProc")
  private MemProcInter memProc;
  
  @Autowired
  @Qualifier("dev.mvc.memgrade.MemgradeProc")
  private MemgradeProcInter memgradeProc;
  
  public MemCont() {
    System.out.println("--> MemCont created");
  }
  
  // 인증번호 입력창
  @RequestMapping(value = "/mem/ecode_confirm.do", method = RequestMethod.GET)
  public ModelAndView email_confirm(String email) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("mem/ecode_confirm");
    
    return mav;
  }
  
  // 아이디 찾기
  @RequestMapping(value = "/mem/find_id.do", method = RequestMethod.GET)
  public ModelAndView find_id() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("mem/find_id");
    
    return mav;
  }
  // 비밀번호 찾기
  @RequestMapping(value = "/mem/find_passwd.do", method = RequestMethod.GET)
  public ModelAndView find_passwd() {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("mem/find_passwd");
    
    return mav;
  }
  
  // 인증번호 보내기
  @ResponseBody
  @RequestMapping(value = "/mem/ecode_send.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String ecode_send(String email) {
    JSONObject obj = new JSONObject();
  
    String ecode = Tool.ecode_create();
    String from = "testcell2010@gmail.com";
    String subject = "email 인증 코드";
    String content = " 인증 코드 : " + ecode;
    content += "\n 인증코드를 정확히 입력해주세요.";
    content = content.replace("\n", "<br>");

    String host = "mw-002.cafe24.com";      
    
    // 메일 전송
    Properties props = new Properties();  // SMTP 프로토콜 사용, port 25
    props.put("mail.smtp.host", host);
    props.put("mail.smtp.auth","true");
     
    Authenticator auth = new MyAuthentication();
    Session sess = Session.getInstance(props, auth);   // 계정 인증 검사
     
    try {
      Message msg = new MimeMessage(sess);   // 메일 내용 객체 생성
      msg.setFrom(new InternetAddress(from));   // 보내는 사람 설정
            
      // 한명에게만 보냄
      InternetAddress[] address = {new InternetAddress(email)}; // 받는 사람 설정
      
      /*
      // 다중 메일 전송
      to=mail1@gmail.com,mail2@gmail.com,mail3@gmail.com,mail4@gmail.com,mail5@gmail.com,
      String[] addrs = to.split(",");
      InternetAddress[] address = new InternetAddress[30];
      
      for(int i=0; i<addrs.length; i++){
        address[i] = new InternetAddress(addrs[i]);
      }
      */
      
      msg.setRecipients(Message.RecipientType.TO, address); // 수령인 주소 설정
            
      msg.setSubject(subject);                  // 제목 설정 
      msg.setSentDate(new Date());          // 보낸 날짜 설정
            
      // msg.setText(msgText); // 메일 내용으로 문자만 보낼 경우
     
      // 보내는 내용으로 HTML 형식으로 보낼 경우
      msg.setContent(content, "text/html;charset=utf-8");
            
      Transport.send(msg);  // 메일 전송
      // System.out.println("메일 전송 OK!!!");
      obj.put("ecode_send", "OK");
    } catch (MessagingException mex) {
      obj.put("ecode_send", "NO");
      System.out.println("메일 전송 fail!!!");
    }
    obj.put("email", email);
    obj.put("ecode", ecode);
    
    return obj.toString();
  }
  
  // 전체 회원 목록
  @RequestMapping(value = "/mem/list_all.do", method = RequestMethod.GET)
  public ModelAndView lsit_all(PagingVO pagingVO,
      @RequestParam(value="col", defaultValue="id") String col,
      @RequestParam(value="word", defaultValue="") String word
      ) {
    
    // 검색 관련 기본값
      pagingVO.setCol(col);
      pagingVO.setWord(word);
    
    if (pagingVO.getRecordPerPage() == 0) {
      pagingVO.setRecordPerPage(5);
    }
    
    pagingVO.setRecordCount(memProc.total_recod(pagingVO));    
    
    PagingVO vo = memProc.set_pagingVO(pagingVO);
    
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mem/list_all");
//    List<MemVO> list = memProc.list_all();
    
    List<MemgradeVO> grade_list = memgradeProc.list();
    
    List<String> gname_list = new ArrayList<String>();

    // List<MemVO> list = memProc.list_all();
    List<MemVO> list = memProc.search_paging(vo);
    for(MemVO memVO : list) {
      // gname_list.add(memgradeProc.read(memVO.getMemgradeno()).getGname());
      memVO.setGradename(memgradeProc.read(memVO.getMemgradeno()).getGname());
    }
    // ${col == "mname" ? selected="selected" : "" }
    
    mav.addObject("list", list);
    mav.addObject("gname_list", gname_list);
    mav.addObject("grade_list", grade_list);
    mav.addObject("pagingVO", vo);
    
    return mav;
  }
  
  // 등급별 회원 목록
  @RequestMapping(value = "/mem/list_by_memgradeno.do", method = RequestMethod.GET)
  public ModelAndView list_by_memgradeno(PagingVO pagingVO) {
    // 검색 관련 기본값
    if (pagingVO.getCol() == null) {
      pagingVO.setCol("id");
    }
    if (pagingVO.getWord() == null) {
      pagingVO.setWord("");
    }
    
    if (pagingVO.getRecordPerPage() == 0) {
      pagingVO.setRecordPerPage(5);
    }
    
    pagingVO.setRecordCount(memProc.total_recod_by_memgradeno(pagingVO));
    
    PagingVO vo = memProc.set_pagingVO(pagingVO);
    
    ModelAndView mav = new ModelAndView();
    int memgradeno = pagingVO.getMemgradeno();
    mav.setViewName("mem/list_by_memgradeno");
    List<MemVO> list = memProc.search_paging_by_memgradeno(pagingVO);
    MemgradeVO memgradeVO = memgradeProc.read(memgradeno);
    
    mav.addObject("memgradeVO", memgradeVO);
    mav.addObject("list", list);
    
    List<String> gname_list = new ArrayList<String>();
    for(MemVO memVO : list) {
      // gname_list.add(memgradeProc.read(memVO.getMemgradeno()).getGname());
      memVO.setGradename(memgradeProc.read(memVO.getMemgradeno()).getGname());
    }
    mav.addObject("gname_list", gname_list);
    
    List<MemgradeVO> grade_list = memgradeProc.list();
    mav.addObject("grade_list", grade_list);
    mav.addObject("pagingVO", vo);
    
    return mav;
  }
  
  // 회원 조회
  @RequestMapping(value = "/mem/read.do", method = RequestMethod.GET)
  public ModelAndView read(int memno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("mem/read");
    
    MemVO memVO = memProc.read(memno);
    
    String[] num = memVO.getTel().split("-");
    memVO.setTel(num[0]);
    memVO.setTel2(num[1]);
    memVO.setTel3(num[2]);
    
    mav.addObject("memVO", memVO);
    
    return mav;
  }
  // 회원 정보 수정
  @RequestMapping(value = "/mem/update.do", method = RequestMethod.POST)
  public ModelAndView read_update(RedirectAttributes ra, MemVO memVO) {
    ModelAndView mav = new ModelAndView();
    
    String tel = memVO.getTel() + "-" + memVO.getTel2() + "-" + memVO.getTel3();
    memVO.setTel(tel);
    
    int count = memProc.update(memVO);
    System.out.println(count);
    mav.setViewName("redirect:/mem/read.do?memno=" + memVO.getMemno());
    
    return mav;
  }
  
  // 회원 가입 agreement
  @RequestMapping(value = "/mem/create_agr.do", method = RequestMethod.GET)
  public ModelAndView create_agr(HttpServletResponse response) {
    ModelAndView mav = new ModelAndView();
    
    mav.setViewName("/mem/agreement");

    return mav;
  }
  // 회원 가입 form
  @RequestMapping(value = "/mem/create.do", method = RequestMethod.GET)
  public ModelAndView create_form(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    
    String agree = "N";
    Cookie[] cookies = request.getCookies();
    if (cookies != null) {
      for (Cookie cookie: cookies) {
        if(cookie.getName().equals("create_agree")) {
         agree = cookie.getValue();
         break;
        }
      }
      
      if (agree.equals("Y")) {
        mav.setViewName("/mem/create");
      } else {
        mav.setViewName("redirect:/mem/create_agr.do");
      }
    }
    
    
    return mav;
  }
  // 회원 가입 proc
  @RequestMapping(value = "/mem/create.do", method = RequestMethod.POST)
  public ModelAndView create_proc(MemVO memVO) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mem/create_msg");
    
    String email = memVO.getEmail() + memVO.getEmail2();
    memVO.setEmail(email);
    
    String tel = memVO.getTel() + "-" + memVO.getTel2() + "-" + memVO.getTel3(); 
    memVO.setTel(tel);
    
    int count = memProc.create(memVO);
    mav.addObject("count", count);
    
    return mav;
  }
  
   // 로그인 form
  @RequestMapping(value = "/mem/login.do", method = RequestMethod.GET)
  public ModelAndView login(HttpServletRequest request) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mem/login");

    Cookie[] cookies = request.getCookies();
    Cookie cookie = null;

    String ck_id = ""; // id 저장 변수
    String ck_id_save = ""; // id 저장 여부를 체크하는 변수

    if (cookies != null) {
      for (int i=0; i < cookies.length; i++){
        cookie = cookies[i]; // 쿠키 객체 추출
        
        if (cookie.getName().equals("ck_id")){
          ck_id = cookie.getValue();
        } else if(cookie.getName().equals("ck_id_save")){
          ck_id_save = cookie.getValue();  // Y, N
        } 
      }
    }
    
    mav.addObject("ck_id", ck_id);
    mav.addObject("ck_id_save", ck_id_save);
    
    return mav;
  }

   // 로그인 proc
  @RequestMapping(value = "/mem/login.do", method = RequestMethod.POST)
  public ModelAndView login_proc(HttpServletRequest request, HttpSession session, HttpServletResponse response, String id, String passwd,
     @RequestParam(value="id_save", defaultValue="") String id_save) {
    ModelAndView mav = new ModelAndView();
    
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("id", id);
    map.put("passwd", passwd);
    
    int count = memProc.login(map);
    
    MemVO memVO = memProc.read_by_id(id);
    
    if(count == 1) {
      // -------------------------------------------------------------------
      // 쿠기 저장
      // -------------------------------------------------------------------
      if (id_save.equals("Y")) { // id를 저장할 경우
        Cookie ck_id = new Cookie("ck_id", id);
        ck_id.setMaxAge(60 * 60 * 72 * 10); // 30 day, 초단위
        response.addCookie(ck_id);
      } else { // N, id를 저장하지 않는 경우
        Cookie ck_id = new Cookie("ck_id", "");
        ck_id.setMaxAge(0);
        response.addCookie(ck_id);
      }
      // id를 저장할지 선택하는  CheckBox 체크 여부
      Cookie ck_id_save = new Cookie("ck_id_save", id_save);
      ck_id_save.setMaxAge(60 * 60 * 72 * 10); // 30 day
      response.addCookie(ck_id_save);
      // -------------------------------------------------------------------
      
      mav.setViewName("redirect:/index.do");
      session.setAttribute("memgradeno", memVO.getMemgradeno());
      session.setAttribute("id", id);
      session.setAttribute("mname", memVO.getMname());
      session.setAttribute("memVO", memVO);
      session.setAttribute("memno", memVO.getMemno());
      
    } else {
      mav.setViewName("redirect:./login_fail_msg.jsp");
    }
    
    return mav;
  }

// 로그아웃
  @RequestMapping(value = "/mem/logout.do", method = RequestMethod.GET)
  public ModelAndView logout(HttpSession session) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/mem/logout_msg.jsp");

    session.invalidate();

    return mav;
  }
  
  // 등급별 회원 등급변경 form
  @RequestMapping(value = "/mem/update_by_memgradeno.do", method = RequestMethod.GET)
  public ModelAndView update_by_memgradeno(int memgradeno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mem/update_by_memgradeno");
    
    mav.addObject("memgradeVO", memgradeProc.read(memgradeno));
    mav.addObject("count_by_memgradeno", memProc.count_by_memgradeno(memgradeno));
    
    List<MemgradeVO> list = memgradeProc.list();
    mav.addObject("list", list);
    
    return mav;
  }
  // 등급별 회원 등급변경 proc
  @RequestMapping(value = "/mem/update_by_memgradeno.do", method = RequestMethod.POST)
  public ModelAndView update_by_memgradeno_proc(int new_memgradeno, int memgradeno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mem/update_by_memgradeno_msg");
    
    HashMap<String, Integer> map = new HashMap<>();
    map.put("new_memgradeno", new_memgradeno);
    map.put("memgradeno", memgradeno);
    
    
    int count = memProc.update_by_memgradeno(map);
    
    mav.addObject("count", count);
    mav.addObject("memgradeVO", memgradeProc.read(memgradeno));
    mav.addObject("new_memgradeVO", memgradeProc.read(new_memgradeno));
    mav.addObject("count_by_memgradeno", memProc.count_by_memgradeno(new_memgradeno));
    
    // System.out.println("memgradeno => " + memgradeno);
    // System.out.println("new_memgradeno => " + new_memgradeno);
    
    List<MemgradeVO> list = memgradeProc.list();
    mav.addObject("list", list);
    
    return mav;
  }
  
  
  // 패스워드 변경 form
  @RequestMapping(value = "/mem/update_passwd.do", method = RequestMethod.GET)
  public ModelAndView update_passwd(int memno) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mem/update_passwd");

    return mav;
  }
  // 패스워드 변경 Proc
  @RequestMapping(value = "/mem/update_passwd.do", method = RequestMethod.POST)
  public ModelAndView update_passwd_proc(RedirectAttributes ra, int memno, String passwd, String new_passwd) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("redirect:/mem/update_passwd_msg.jsp");
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    map.put("memno", memno);
    map.put("passwd", passwd);
    
    int count = memProc.check_passwd(map);
    int update_count = 0;
    
    if (count > 0) {
      map.put("new_passwd", new_passwd);
      update_count = memProc.update_passwd(map);
    }
    
   ra.addAttribute("memno", memno);
   ra.addAttribute("count", count);
   ra.addAttribute("update_count", update_count);
    
    return mav;
  }
  
  // id 중복확인
  @ResponseBody
  @RequestMapping(value = "/mem/id_check.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String checkId(String id) {
    // System.out.println("--> id: " + id);
    int count = memProc.idcheck(id);
    JSONObject obj = new JSONObject();
    
    obj.put("count",count);
 
    return obj.toString();
  }
  // 등급변경
  @ResponseBody
  @RequestMapping(value = "/mem/update_g.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
  public String update_g(String list, int memgradeno) {
    // System.out.println("--> id: " + id);
    HashMap<Object, Object> map = new HashMap<>();
    map.put("memgradeno", memgradeno);
    
    int count = 0;
    String[] memnos = list.split("/");
    
    for (String memno : memnos) {
      map.put("memno", Integer.parseInt(memno));
      count += memProc.update_grade(map);
    }
    
    JSONObject obj = new JSONObject();
    
    obj.put("count", count);
    obj.put("gname", memgradeProc.read(memgradeno).getGname());
    
    return obj.toString();
  }
  
  // 관리자의 회원 삭제
  @ResponseBody
  @RequestMapping(value = "/mem/delete.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String delete(HttpSession session, String list) {
    
    int count = 0;
    String[] num = list.split("/");
    JSONObject obj = new JSONObject();
    
    if (session.getAttribute("id_admin") != null) {
      for(String memno : num) {
        count += memProc.delete(Integer.parseInt(memno));
      }
    } else {
      obj.put("fail_msg", "관리자 로그인이 필요합니다.");
    }
    
    obj.put("count", count);

    return obj.toString();
  }
  
  // email로 아이디 찾기
  @ResponseBody
  @RequestMapping(value = "/mem/find_id.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String find_id(String email) {
    JSONObject obj = new JSONObject();

    MemVO memVO = memProc.read_by_email(email);
    
    String subject = "아이디 찾기"; 
    String content = memVO.getMname() + "님이 찾으시는 id는 '" + memVO.getId() + "' 입니다."; 
    
    Tool.send_mail(email, content, subject);
    
    return obj.toString();
  }
  // email, id로 password 찾기
  @ResponseBody
  @RequestMapping(value = "/mem/find_passwd.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String find_passwd(String email, String id) {
    
    
    JSONObject obj = new JSONObject();
    int count = 0;
    MemVO vo_email = memProc.read_by_email(email);
    MemVO vo_id = memProc.read_by_id(id);
    
    String passwd = Tool.ecode_create() + "" + Tool.ecode_create();
    
    HashMap<Object, Object> map = new HashMap<Object, Object>();
    int update_count = 0;
    
    if (vo_email != null && vo_id != null) {
      if (vo_email.getId().equals(vo_id.getId())) {
        map.put("memno", vo_id.getMemno());
        map.put("new_passwd", passwd);
        update_count = memProc.update_passwd(map);
        memProc.update_passwd(map);

        if (update_count == 1) {
          String subject = "비밀번호 찾기";
          String content = vo_id.getMname() + "님에게 발급된 임시 비밀번호는 '" + passwd + "' 입니다.\n";
          content += "로그인 후 비밀번호를 변경해주세요.";

          Tool.send_mail(email, content, subject);
          count = 1;
        }
      }
    }
    
    obj.put("count", count);
    obj.put("id", vo_id.getId());
    
    return obj.toString();
  }
  
  // 메일 보내기 form
  @RequestMapping(value = "/mem/send_mail.do", method = RequestMethod.GET)
  public ModelAndView send_mail(String list) {
    ModelAndView mav = new ModelAndView();
    mav.setViewName("/mem/send_mail");
    mav.addObject("list", list);
    return mav;
  }
  // 메일 보내기 proc
  @ResponseBody
  @RequestMapping(value = "/mem/send_mail.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
  public String send_mail_proc(String list, String subject, String content) {
    JSONObject obj = new JSONObject();
    
    int memno = 0;
    String email = "";
    int count = 0;
    String[] memnos = list.split("/");
    /*if (content.contains("<img alt=\"\" src=\"")) {
      content.replace("<img alt=\"\" src=\"", "<img alt=\"\" src=\"http://172.16.12.4:9090/");
    }*/
    for (int i = 0; i < memnos.length; i++) {
      memno = Integer.parseInt(memnos[i]);
      email = memProc.read(memno).getEmail();
      Tool.send_mail(email, content, subject);
      count ++;
    }
    obj.put("tot", memnos.length);
    obj.put("count", count);
    
    return obj.toString();
  }
  
}
