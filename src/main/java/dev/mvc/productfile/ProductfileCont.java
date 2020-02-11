package dev.mvc.productfile;


import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ProductfileCont {

  @Autowired
  @Qualifier("dev.mvc.productfile.ProductfileProc") // 이름 지정
  private ProductfileProcInter productProc;

  public ProductfileCont() {
    System.out.println("--> ProductfileCont created.");
  }
  
  @ResponseBody
  @RequestMapping(value="/productfile/file_read.do", method=RequestMethod.GET ,produces = "text/plain;charset=UTF-8")
  public String file_read(int productno) {
    JSONObject obj = new JSONObject();
    obj.put("file_read", productProc.file_read(productno));
    return obj.toString();
  }
}
