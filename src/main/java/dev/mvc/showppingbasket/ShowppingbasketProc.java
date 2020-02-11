package dev.mvc.showppingbasket;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("dev.mvc.shoppingbasket.ShowppingbasketProc")
public class ShowppingbasketProc implements ShowppingbasketProcInter{
	
	@Autowired
	ShowppingbasketDAOInter showppingDAO;

	@Override
	public int showppingbasketCreate(ShowppingbasketVO showppingbasketVO) {
		return showppingDAO.showppingbasketCreate(showppingbasketVO);
	}

	@Override
	public int showppingbasketDuplicate(ShowppingbasketVO showppingbasketVO) {
		return showppingDAO.showppingbasketDuplicate(showppingbasketVO);
	}

	@Override
	public List<ShowppingbasketVO> showppingbasketList(String memeberid) {
		return showppingDAO.showppingbasketList(memeberid);
	}

	@Override
	public int showppingbasketCnt(String memberid) {
		return showppingDAO.showppingbasketCnt(memberid);
		
		
	}

	@Override
	public int showppingbasketDelete(HashMap<String, Object> map) {
		return showppingDAO.showppingbasketDelete(map);
	}
	
	
}


