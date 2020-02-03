package dev.mvc.showppingbasket;

import java.util.HashMap;
import java.util.List;

public interface ShowppingbasketDAOInter {

	/**
	 * 장바구니 생성
	 * 
	 * @param shoppingbasketVO
	 * @return
	 */
	public int showppingbasketCreate(ShowppingbasketVO showppingbasketVO);

	/**
	 * 장바구니 갯수
	 * 
	 * @param memberid
	 * @return
	 */
	public int showppingbasketCnt(String memberid);

	/**
	 *  장바구니 상품 중복 체크
	 * @param shoppingbasketVO
	 * @return
	 */
	public int showppingbasketDuplicate(ShowppingbasketVO showppingbasketVO);

	/**
	 * 특정 유저 장바구니 불러오기
	 * @param memeberid
	 * @return
	 */
	public List<ShowppingbasketVO> showppingbasketList(String memeberid);
	
	/**
	 *  장바구니 리스트 제거
	 * @param map
	 * @return
	 */
	public int showppingbasketDelete(HashMap<String, Object>map);
}
