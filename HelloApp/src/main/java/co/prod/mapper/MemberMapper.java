package co.prod.mapper;

import java.util.List;

import co.prod.vo.EmpVO;
import co.prod.vo.MemberVO;
import co.prod.vo.MembersVO;

public interface MemberMapper {
	// 매퍼(MemberMapper.xml) 에서 실행할 메소드 정의
	public List<MemberVO> getMembers();

	// 로그인 용도.
	public MemberVO login(MemberVO vo);
	
	// 회원삭제.
	public int deleteMember(String id);
	
	// 회원등록.
	public int insertMember(MemberVO vo);
	
	// 멤버 제이쿼리 리스트
	public List<MembersVO> getMembersJ();
	
	// 회원등록 제이쿼리.
	public int insertMembersJ(MembersVO vo);
	
	// 다건삭제.
	public int deleteMembersAry(String[] users);
	
	// 사원목록.
	public List<EmpVO> selectEmployees();
	
	// 사원등록
	public int insertEmp(EmpVO vo);
	
	// 사원삭제
	public int deleteEmp(int id);
}
