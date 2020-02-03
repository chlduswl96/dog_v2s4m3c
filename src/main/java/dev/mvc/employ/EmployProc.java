package dev.mvc.employ;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.employ.EmployProc")
public class EmployProc implements EmployProcInter{

  @Autowired
  EmployDAOInter employDAO;
  
  @Override
  public int employCreate(EmployVO employVO) {
    return employDAO.employCreate(employVO);
  }
  
}
