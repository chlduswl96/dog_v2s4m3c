package dev.mvc.showppingbasket;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class ShowppingbasketCnt {

	@Qualifier("dev.mvc.shoppingbasket.ShowppingbasketProc")
	@Autowired
	ShowppingbasketProcInter showppingProc;

//	ajax로 왔으면 서버에서도  ajax로 처리하겠다고 응답해줘야한다.
	/**
	 * 장바구니 추가
	 * 
	 * @param session
	 * @param showppingbasketVO
	 * @param re
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/showppingbasket/add.do", method = RequestMethod.GET, produces = "text/plain;charset=UTF-8")
	public String addShowppingbasket(HttpSession session, ShowppingbasketVO showppingbasketVO, HttpServletRequest re) {

		JSONObject ob = new JSONObject();
		System.out.println("ajax 성공!!!!");
		String memberid = session.getAttribute("id").toString();
		showppingbasketVO.setMemberid(memberid);
		System.out.println(showppingbasketVO.toString());
		// 최대 5개가 넘는지?
		int count = showppingProc.showppingbasketCnt(showppingbasketVO.getMemberid());
		if (count < 5) {
			// 해당 제품과 동일한 제품이 DB에 있는가?
			count = showppingProc.showppingbasketDuplicate(showppingbasketVO);
			if (count != 1) {
				// 위에 둘 다 해당이 안된다면 등록
				showppingProc.showppingbasketCreate(showppingbasketVO);
				ob.put("messege", "장바구니에 상품이 등록되었습니다.");
			} else {
				ob.put("messege", "장바구니에 해당 상품이 들어있습니다.");
			}
		} else {
			ob.put("messege", "장바구니는최대 5개만 가능 합니다.");
		}
		return ob.toString();
	}

	/**
	 * 장바구니 리스트
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/showppingbasket/list.do", method = RequestMethod.GET)
	public ModelAndView showppingbasket_list(HttpSession session) {
		ModelAndView mav = new ModelAndView("showppingbasket/list");
		String memberid = session.getAttribute("id").toString();
		mav.addObject("list", showppingProc.showppingbasketList(memberid));
		return mav;
	}

	
	/**
	 * 장바구니 삭제
	 * @param params
	 * @param session
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/showppingbasket/delete.do", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public String showppingbasketDelete(@RequestBody HashMap<String, ArrayList<Integer>> params, HttpSession session) {
	  System.out.println(params);
	  
		JSONObject jsonObject = new JSONObject();
		HashMap<String, Object> map = new HashMap<>();
		
		String memberid = session.getAttribute("id").toString();
		map.put("memberid", memberid);
		
		ArrayList<Integer> list = params.get("multiparam");
		for(int value : list) {
			map.put("productno", value);
			showppingProc.showppingbasketDelete(map);
		}
		jsonObject.put("messege", "삭제되었습니다.");
		return jsonObject.toString();
	}

}
