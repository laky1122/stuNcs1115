package kr.co.ezen.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.ezen.entity.Criteria;
import kr.co.ezen.entity.Student;
import kr.co.ezen.mapper.StudentMapper;

@Service
public class StudentServiceImpl implements StudentService{

	@Autowired
	private StudentMapper studentMapper;
	
	@Override
	public List<Student> getList(Criteria cri) {
		
		List<Student> li = studentMapper.getList(cri);
		return li;
	}
	
	@Override
	public Student getInfo(int stuIdx) {
		
		Student info = studentMapper.getInfo(stuIdx);
		return info;
	}

	@Override
	public void add(Student vo) {
		studentMapper.add(vo);
		studentMapper.addInfo(vo);
	}

	@Override
	public void update(Student vo) {
		studentMapper.update(vo);
	}

	@Override
	public void delete(int stuidx) {
		studentMapper.deleteInfo(stuidx);
		studentMapper.delete(stuidx);
		
	}

}
