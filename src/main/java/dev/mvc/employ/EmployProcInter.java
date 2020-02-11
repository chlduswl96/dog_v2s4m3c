package dev.mvc.employ;

public interface EmployProcInter {
  
  /**
   * @param employVO 회원가입 할 직원 정보
   * @return 성공 1 실패 0
   */
  public int employCreate(EmployVO employVO);

}
