package com.wolf.controller;

import java.sql.Timestamp;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.wolf.domain.AMemberDTO;
import com.wolf.domain.AOrdersDTO;
import com.wolf.domain.ListDTO;
import com.wolf.service.AOrdersService;



@Controller
public class AOrderController {
	
	@Inject
	private AOrdersService AOrdersService;
	
	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String Vieworder(@RequestParam Integer goodsNum , @RequestParam Integer goodsCount , Model model , HttpSession session){
		
		ListDTO Listdto = AOrdersService.getProductinfo(goodsNum);
		
		model.addAttribute("ListDTO" , Listdto);
		model.addAttribute("goodsCount", goodsCount);
		model.addAttribute("goodsNum", goodsNum);
		
		String memId = (String)session.getAttribute("id");
		AMemberDTO AMemberdto = AOrdersService.getMemberinfo(memId);
		
		model.addAttribute("AMemberDTO" , AMemberdto);
	
		return "/order";
	}
	
	@RequestMapping(value="/insertOrder")
	public void subBasicOrder(
			@RequestParam String memId ,@RequestParam String goodsNum ,@RequestParam String goodsCount ,
			@RequestParam String orderAddr ,@RequestParam String orderSub ,@RequestParam String orderZipcode ,
			@RequestParam String orderPhone ,@RequestParam Integer amount,@RequestParam String resipient) {
		
			System.out.println(memId);
			System.out.println(goodsNum);
			System.out.println(goodsCount);
			System.out.println(orderAddr);
			System.out.println(orderSub);
			System.out.println(orderZipcode);
			System.out.println(orderPhone);
			System.out.println(amount);
			System.out.println(resipient);
			
			AOrdersDTO AOrdersdto = new AOrdersDTO();
			AOrdersdto.setMemId(memId);
			String orderProduct = goodsNum + ",-" + goodsCount + ",";
			AOrdersdto.setOrderProduct(orderProduct);
			AOrdersdto.setOrderAddr(orderAddr);
			AOrdersdto.setOrderSub(orderSub);
			AOrdersdto.setOrderZipcode(orderZipcode);
			AOrdersdto.setOrderPhone(orderPhone);
			AOrdersdto.setAmount(amount);
			AOrdersdto.setResipient(resipient);
			
			String postCode = "987654";
			AOrdersdto.setPostCode(postCode);
			Timestamp date = new Timestamp(System.currentTimeMillis()); 
			AOrdersdto.setOrderDate(date);
			
			AOrdersService.insertOrder(AOrdersdto);
	}
	
	@RequestMapping(value = "/orders", method = RequestMethod.GET)
	public String Vieworders(@RequestParam Integer goodsNum , @RequestParam Integer goodsCount , Model model , HttpSession session){
		
		ListDTO Listdto = AOrdersService.getProductinfo(goodsNum);
		
		model.addAttribute("ListDTO" , Listdto);
		model.addAttribute("goodsCount", goodsCount);
		model.addAttribute("goodsNum", goodsNum);
		
		String memId = (String)session.getAttribute("id");
		AMemberDTO AMemberdto = AOrdersService.getMemberinfo(memId);
		
		model.addAttribute("AMemberDTO" , AMemberdto);
	
		return "/orders";
	}
}
