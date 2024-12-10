package com.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {
	
	@GetMapping("/")
	public String home() {
		return "home";
	}
	
//	@GetMapping("/customerDetails")
//	public String customerDetails() {
//		return "customerDetails";
//	}
	
	@GetMapping("/customer-created")
	public String customer() {
		return "customer-created";
	}
	
	@GetMapping("/home")
	public String home1() {
		return "home";
	}

}
