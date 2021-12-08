package com.wolf.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wolf.service.AOrdersService;



@Controller
public class AOrderController {
	
	@Inject
	private AOrdersService AOrdersService;
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String commment(@RequestParam Integer goodsNum , @RequestParam Integer goodsCount){
		
		
		
		return "/order";
	}

}
