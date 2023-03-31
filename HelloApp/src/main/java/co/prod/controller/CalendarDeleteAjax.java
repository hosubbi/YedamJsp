package co.prod.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.prod.common.Control;
import co.prod.service.ProductService;
import co.prod.service.ProductServiceImpl;
import co.prod.vo.CalendarVO;

public class CalendarDeleteAjax implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		CalendarVO vo = new CalendarVO();
		vo.setTitle(request.getParameter("title"));
		vo.setStartDate(request.getParameter("start"));
		vo.setEndDate(request.getParameter("end"));
		
		ProductService service = new ProductServiceImpl();
	
		boolean result = service.delCalendar(vo);
		String json = "";
		if (result) {
			// {"retCode": "Success"}
			json = "{\"retCode\": \"Success\"}";
		} else {
			// {"retCode": "Fail"}
			json = "{\"retCode\": \"Fail\"}";
		}
		return json + ".ajax";
	}

}
