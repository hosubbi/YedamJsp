package co.prod.mapper;

import java.util.List;
import java.util.Map;

import co.prod.vo.CalendarVO;
import co.prod.vo.ProductVO;
import co.prod.vo.ReplyVO;

public interface ProductMapper {
	//목록
	public List<ProductVO> productList();
	public ProductVO selectProduct(String code);
	
	// 댓글목록.
	public List<ReplyVO> replyList(String code);
	// 댓글삭제.
	public int deleteReply(int replyId);
	// 댓글등록.
	public int insertReply(ReplyVO vo);
	// 댓글조회
	public ReplyVO selectReply(int rid);
	// 댓글수정
	public int updateReply(ReplyVO vo);
	
	// chart.부서별인원현황.
	public List<Map<String, Object>> chartInfo();
	// 캘린더 리스트
	public List<CalendarVO> calenderList();
	// 캘린더추가
	public int insertCalender(CalendarVO vo);
	// 캘린더삭제
	public int deleteCalender(int title);
}
