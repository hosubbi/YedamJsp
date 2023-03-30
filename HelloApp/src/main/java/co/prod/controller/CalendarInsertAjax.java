package co.prod.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.prod.common.Control;
import co.prod.service.ProductService;
import co.prod.service.ProductServiceImpl;
import co.prod.vo.CalendarVO;

public class CalendarInsertAjax implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		String title = request.getParameter("title");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		
		CalendarVO vo = new CalendarVO();
		vo.setTitle(title);
		vo.setStartDate(start);
		vo.setEndDate(end);
		
		ProductService service = new ProductServiceImpl();
		// 매퍼: insertReply로 작성.
		boolean result = service.inCalendar(vo);
		// {"retCode":"Success", "reply": vo }
		Map<String, Object> resultMap = new HashMap<>();
		if (result) {
			resultMap.put("retCode", "Success");
			resultMap.put("Calendar", vo);

		} else {
			resultMap.put("retCode", "Fail");
			resultMap.put("Calendar", null);

		}
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(resultMap);

		return json + ".ajax";
	}

}
