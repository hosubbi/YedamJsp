package co.prod.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import co.prod.common.DataSource;
import co.prod.mapper.ProductMapper;
import co.prod.vo.CalendarVO;
import co.prod.vo.ProductVO;
import co.prod.vo.ReplyVO;

public class ProductServiceImpl implements ProductService {
	SqlSession sqlSession = DataSource.getInstance().openSession(true);
	ProductMapper mapper = sqlSession.getMapper(ProductMapper.class);

	@Override
	public List<ProductVO> products() {
		return mapper.productList();
	}

	@Override
	public ProductVO getProduct(String code) {
		return mapper.selectProduct(code);
	}

	@Override
	public List<ReplyVO> replyList(String code) {
		return mapper.replyList(code);
	}

	@Override
	public boolean removeReply(int replyId) {
		return mapper.deleteReply(replyId) == 1;
	}

	@Override
	public boolean addReply(ReplyVO vo) {
		return mapper.insertReply(vo) == 1;
	}

	@Override
	public ReplyVO getReply(int rid) {
		return mapper.selectReply(rid);
	}

	@Override
	public boolean upContent(ReplyVO vo) {
		int r = mapper.updateReply(vo);
		return r == 1;
	}

	@Override
	public List<Map<String, Object>> chartInfo() {
		return mapper.chartInfo();
	}

	@Override
	public List<CalendarVO> calendars() {
		return mapper.calenderList();
	}
	
	@Override
	public boolean inCalendar(CalendarVO vo) {
		return mapper.insertCalender(vo) == 1;
	}
}
