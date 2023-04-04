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
import co.prod.vo.EmpVO;

public class DataTableAddAjax implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String firstName = request.getParameter("first");
		String lastName = request.getParameter("last");
		String email = request.getParameter("email");
		String hireDate = request.getParameter("hireDate");
		int salary = Integer.parseInt(request.getParameter("salary"));
		
		EmpVO vo = new EmpVO();
		vo.setFirstName(firstName);
		vo.setLastName(lastName);
		vo.setEmail(email);
		vo.setHireDate(hireDate);
		vo.setSalary(salary);
		
		
		System.out.println(vo);
		
		MemberService service = new MemberServiceMybatis();
		boolean result = service.addEmp(vo);
		int id = vo.getEmployeeId();
		Map<String, Object> map = new HashMap<>();

		Gson gson = new GsonBuilder().create();
		String json = "";
		if (result) {
			map.put("retCode", "Success");
			map.put("emp", id);
		} else {
			map.put("retCode", "Fail");
			map.put("emp", null);
		}
		json = gson.toJson(map);

		return json + ".ajax";
	}

}
