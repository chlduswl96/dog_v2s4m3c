package dev.mvc.answer;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.answer.AnswerProc")
public class AnswerProc implements AnswerProcInter {
  
  @Autowired
  private AnswerDAOInter answerDAO;

  @Override
  public AnswerVO readByIqynum(int iqynum) {
    AnswerVO list = answerDAO.readByIqynum(iqynum);
    return list;
  }
  

}
