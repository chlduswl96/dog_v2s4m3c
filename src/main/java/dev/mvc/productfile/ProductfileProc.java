package dev.mvc.productfile;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.productfile.ProductfileProc")
public class ProductfileProc implements ProductfileProcInter{

  @Autowired
  private ProductfileDAOInter productDAO;

  @Override
  public int create(ProductfileVO productfileVO) {
    return productDAO.create(productfileVO);
  }

  @Override
  public List<ProductfileVO> file_read(int productno) {
    return productDAO.file_read(productno);
  }

  @Override
  public List<ProductfileVO> file_all_read(int productno) {
    return productDAO.file_all_read(productno);
  }

  
}
