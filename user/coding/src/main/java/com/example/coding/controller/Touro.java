package com.example.coding.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Touro {
    
  @RequestMapping("/{step}")
	public String viewPage0(@PathVariable String step) {
		return ""+step;
	}
	
	@RequestMapping("/user/{step}")
	public String viewPage(@PathVariable String step) {
		return "/user/"+step;
	}

	@RequestMapping("/tour/{step}")
	public String viewPage1(@PathVariable String step) {
		return "/tour/"+step;
	}

	@RequestMapping("/touromate/{step}")
	public String viewPage2(@PathVariable String step) {
		return "/touromate/"+step;
	}

	@RequestMapping("/touroview/{step}")
	public String viewPage3(@PathVariable String step) {
		return "/touroview/"+step;
	}

}
