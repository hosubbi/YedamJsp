package co.prod.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prod.common.Control;
import co.prod.vo.EmpVO;

public class DataTableDelAjax implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		int empId = Integer.parseInt(request.getParameter("id"));
		
		EmpVO vo = new EmpVO();
		return null;
	}

}
