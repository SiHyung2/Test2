package com.example.controller;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.domain.BoardVO;
import com.example.domain.Criteria;
import com.example.domain.PageDTO;
import com.example.service.BoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class BoardController {
	
	private BoardService service;
	
	@GetMapping("/register")
	public void register() {
//		화면만 보여주는 용도이다
	}
	
//	@GetMapping("/list")//1.목록 조회
//	public void list(Model model) {
//		 log.info("list");
//		 model.addAttribute("list",service.getList());
//	}
	
	@GetMapping("/list")//1.목록 조회
	public void list(Criteria cri, Model model) {
		 
		 log.info("list"+cri);
		 model.addAttribute("list",service.getList(cri));
//		 model.addAttribute("pageMaker", new PageDTO(cri,123));
		 
		 int total=service.getTotal(cri);
		 
		 log.info("total"+total);
		 
		 model.addAttribute("pageMaker", new PageDTO(cri,total));
		 
	}
	
	@PostMapping("/register")//2.입력
	public String register(BoardVO board, RedirectAttributes rttr) {
		
		log.info("register: "+board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/list";
	}
	
	@GetMapping({"/get", "/modify"})//3.검색
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri")  Criteria cri, Model model) {
		log.info("/get");
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("/modify")//4.수정
	public String modify(BoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: "+board);
		
		if(service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list" + cri.getListLink();
	}
	
//	@PostMapping("/remove")//5.삭제
//	@GetMapping("/remove")//5.삭제
	@RequestMapping(value="/remove", method= { RequestMethod.GET, RequestMethod.POST})//5.삭제
	public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr)
	{
		log.info("remove..."+bno);
		if(service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list" +cri.getListLink();
	}
}
