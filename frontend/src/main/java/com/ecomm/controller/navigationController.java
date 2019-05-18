package com.ecomm.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class navigationController {
@RequestMapping(value="/") 
	public String displayHome() {
	return "index";
	}
}
