package dev.mvc.productfile;

import java.util.List;

public interface ProductfileProcInter {
  
  public int create(ProductfileVO productfileVO);
  public List<ProductfileVO> file_read(int productno);
  public List<ProductfileVO> file_all_read(int productno);
}
