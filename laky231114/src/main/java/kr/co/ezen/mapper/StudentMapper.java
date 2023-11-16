package kr.co.ezen.mapper;

import java.util.List;

import kr.co.ezen.entity.Criteria;
import kr.co.ezen.entity.Student;

public interface StudentMapper {
	public List<Student> getList(Criteria cri);
	
	public Student getInfo(int stuIdx);
	
	
	public void add(Student vo);
	public void addInfo(Student vo);

	public void update(Student vo);
	
	public void delete(int stuIdx);
	public void deleteInfo(int stuIdx);
	
}
