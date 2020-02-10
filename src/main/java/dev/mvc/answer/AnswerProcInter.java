package dev.mvc.answer;

import java.util.List;

public interface AnswerProcInter {
  /**
   * 문의 번호에 의한 조회
   * @param iqynum
   * @return
   */
  public AnswerVO readByIqynum(int iqynum);

}
