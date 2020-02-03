package dev.mvc.test;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import nation.web.tool.Tool;

public class Test {

  public static void main(String[] args) {
    Tool.ecode_create();
    System.out.println();
    String url = "5678";
    try {
      System.out.println(URLEncoder.encode(url, "UTF-8"));
    } catch (UnsupportedEncodingException e) {
      e.printStackTrace();
    }
    
  }
}
