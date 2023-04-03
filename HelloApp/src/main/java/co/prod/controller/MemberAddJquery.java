package co.prod.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.prod.common.Control;
import co.prod.service.MemberService;
import co.prod.service.MemberServiceMybatis;
import co.prod.vo.MembersVO;

public class MemberAddJquery implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String Id = request.getParameter("id");
		String Name = request.getParameter("name");
		String Addr = request.getParameter("addr");
		String Tel = request.getParameter("tel");
		String Pw = request.getParameter("passwd");
		
		MembersVO vo = new MembersVO();
		vo.setMemberId(Id);
		vo.setMemberName(Name);
		vo.setMemberAddr(Addr);
		vo.setMemberTel(Tel);
		vo.setMemberPw(Pw);
		
		System.out.println("vo :" + vo);
		
		MemberService service = new MemberServiceMybatis();
		boolean result = service.addMembers(vo); // 입력처리.
		Map<String, Object> map = new HashMap<>();

		Gson gson = new GsonBuilder().create();
		String json = "";
		if (result) {
			map.put("retCode", "Success");
			map.put("member", vo);
		} else {
			map.put("retCode", "Fail");
			map.put("member", null);
		}
		json = gson.toJson(map);

		return json + ".ajax";
	}

}
