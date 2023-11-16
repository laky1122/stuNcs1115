package kr.co.ezen.service;

import java.util.List;

import kr.co.ezen.entity.Criteria;
import kr.co.ezen.entity.Student;

public interface StudentService {
	public  List<Student> getList(Criteria cri);
	public Student getInfo(int stuIdx);
	public void add(Student vo);
	public void update(Student vo);
	public void delete(int stuidx);
}
