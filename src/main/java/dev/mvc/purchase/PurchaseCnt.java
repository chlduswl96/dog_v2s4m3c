package dev.mvc.purchase;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import dev.mvc.mem.MemProc;
import dev.mvc.showppingbasket.ShowppingbasketProcInter;

@Controller
public class PurchaseCnt {

	@Qualifier("dev.mvc.purchase.PurchaseProc")
	@Autowired
	PurchaseProcInter purchaseProc;
	
	@Qualifier("dev.mvc.shoppingbasket.ShowppingbasketProc")
	@Autowired
	ShowppingbasketProcInter showppingProc;
	
	@Qualifier("dev.mvc.mem.MemProc")
	@Autowired
	MemProc memPorc;
	
	/**
	 * 구매페이지 보여주기
	 * @param session 회원아이디
	 * @return
	 */
	@RequestMapping(value="/purchase/purchase.do", method=RequestMethod.GET)
	public ModelAndView purchase(HttpSession session) {
		ModelAndView mav = new ModelAndView("purchase/read");
		String memberid = session.getAttribute("id").toString();
		mav.addObject("list", showppingProc.showppingbasketList(memberid));
		mav.addObject("member_info", memPorc.read_by_id(memberid));
		return mav;
	}
	
/*	@ResponseBody
	@RequestMapping(value="/purchase/purchase_proc.do", method=RequestMethod.POST)
	public String purchase_proc(String jsonData) {
		System.out.println(jsonData);
		JSONObject obj = new JSONObject(jsonData);
		
		System.out.println(obj.get("name"));
		
		return "";
	}*/
	
	@ResponseBody
	@RequestMapping(value="/purchase/purchase_proc.do", method=RequestMethod.POST)
	public String purchase_proc(@RequestBody HashMap<String,Object> jsonData) {
		
		
		System.out.println(jsonData.get("param1"));
		System.out.println(jsonData.get("param2"));
		HashMap<String,Object> tt = (HashMap<String,Object>)jsonData.get("param2");
		System.out.println(tt.get("name"));
		List<HashMap<String,Object>> tt1 = (List<HashMap<String,Object>>)jsonData.get("param1");
		System.out.println(tt1.get(0).get("name"));
		
		JSONObject jobj = new JSONObject();
		/*System.out.println(jsonData);
		
		JSONObject jobj = new JSONObject(jsonData);
		JSONArray aa = (JSONArray)jobj.get("param1");
		//HashMap<String,Object> pp = (HashMap<String,Object>)aa.get(0);
		System.out.println(aa);
		JSONObject jobj1 = (JSONObject)aa.get(0);
		System.out.println(jobj1.get("name"));*/
		
		return jobj.toString();
	}
	
} 
