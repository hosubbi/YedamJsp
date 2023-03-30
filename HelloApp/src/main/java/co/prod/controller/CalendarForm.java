package co.prod.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import co.prod.common.Control;
import co.prod.service.ProductService;
import co.prod.service.ProductServiceImpl;
import co.prod.vo.CalendarVO;

public class CalendarForm implements Control {

	@Override
	public String exec(HttpServletRequest request, HttpServletResponse response) {
		ProductService service = new ProductServiceImpl();
		List<CalendarVO> list = service.calendars();
		
		Gson gson = new GsonBuilder().create();
		String json = gson.toJson(list); // json 포맷으로 변경.
		return json + ".ajax";
	}

}
