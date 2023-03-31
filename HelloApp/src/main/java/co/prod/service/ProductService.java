package co.prod.service;

import java.util.List;
import java.util.Map;

import co.prod.vo.CalendarVO;
import co.prod.vo.ProductVO;
import co.prod.vo.ReplyVO;

public interface ProductService {
	public List<ProductVO> products();
	public ProductVO getProduct(String code);
	
	// 상품에 대한 댓글목록.
	public List<ReplyVO> replyList(String code);
	// 댓글삭제.
	public boolean removeReply(int replyId);
	// 댓글등록.
	public boolean addReply(ReplyVO vo);
	
	public ReplyVO getReply(int rid);
	
	public boolean upContent(ReplyVO vo);
	
	// chart.
	public List<Map<String, Object>> chartInfo();
	
	//캘린더 리스트
	public List<CalendarVO> calendars();
	//캘린더 등록
	public boolean inCalendar(CalendarVO vo);
	//캘린더 삭제
	public boolean delCalendar(CalendarVO vo);
}
