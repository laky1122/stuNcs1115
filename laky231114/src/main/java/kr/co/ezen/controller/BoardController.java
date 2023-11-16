package kr.co.ezen.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.ezen.entity.Criteria;
import kr.co.ezen.entity.Student;
import kr.co.ezen.service.StudentService;

@Controller
@RequestMapping("/main/*")
public class BoardController {
	@Autowired
	private StudentService studentService;
	
	@GetMapping("/list")
	public String main(Model m, Criteria cri) {
		
		if(cri.getSearch()==null) {
			cri.setSearch("");
		}
		
		List<Student> li = studentService.getList(cri);
		Student info = studentService.getInfo(cri.getStuIdx());
		
		m.addAttribute("li",li);
		m.addAttribute("info", info);
		m.addAttribute("cri", cri);
		
		return "home";
	}
	
	@PostMapping("/add")
	public String add(Student vo) {
		studentService.add(vo);
		return "redirect:/main/list";
	}
	
	@PostMapping("/update")
	public String update(Student vo) {
		
		studentService.update(vo);
		return "redirect:/main/list";
		
	}
	
	@PostMapping("/delete")
	public String Delete(int stuIdx) {
		
		studentService.delete(stuIdx);
		return "redirect:/main/list";
	}
	
	
	
	
	
}
