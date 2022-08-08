package com.callor.todo.controller;

import java.security.Principal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.callor.todo.model.TodoVO;
import com.callor.todo.service.TodoService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value="/todo")
public class TodoController {
	
	@Autowired
	@Qualifier("todoServiceV1")
	private TodoService todoService;
	
	@RequestMapping(value="/input", method=RequestMethod.GET)
	public String input() {
		return "todo/input";
	}
	
	@RequestMapping(value="/input", method=RequestMethod.POST)
	public String input(@ModelAttribute("todo") TodoVO todoVO, Principal principal) {
		log.debug(todoVO.toString());
		
		todoVO.setT_author(principal.getName());
		todoVO.setT_check("미완료");
		todoService.insert(todoVO);
		
		return "redirect:/todo/list";
	}
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String list(Model model) {
		List<TodoVO> todoList = todoService.selectAll();
		
		model.addAttribute("TODOLIST", todoList);
		
		return "todo/list";
	}
	
	@RequestMapping(value="/{seq}/detail", method=RequestMethod.GET)
	public String detail(@PathVariable("seq") String seq, Model model) {
		long longSeq = Long.valueOf(seq);
		TodoVO todoVO = todoService.findById(longSeq);
		model.addAttribute("TODO", todoVO);
		
		return "todo/detail";
	}
	
	
	@RequestMapping(value="/{seq}/delete", method=RequestMethod.GET)
	public String delete(@PathVariable("seq") String seq) {
		
		long longSeq = Long.valueOf(seq);
		int ret = todoService.delete(longSeq);
		
		return "redirect:/todo/list";
	}
	
	@ModelAttribute("todo")
	private TodoVO memoDTO() {

		Date date = new Date(System.currentTimeMillis());
		SimpleDateFormat toDate = new SimpleDateFormat("yyy-MM-dd");
		SimpleDateFormat toTime = new SimpleDateFormat("HH:mm:SS");

		TodoVO todo = TodoVO.builder().t_date(toDate.format(date)).t_time(toTime.format(date)).build();
		return todo;
	}
}
