package com.hb.controller;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.hb.domain.Product;
import com.hb.domain.User;
import com.hb.mapper.MainMapper;



@Controller
public class BankController{
	
	@Autowired
	MainMapper mapper;
	
	@Autowired
	private com.hb.bank.tokenAPI tokenmethod;
	
	@Autowired
	private com.hb.bank.accountlistAPI accountlistAPI;
	
	@Autowired
	private com.hb.bank.balanceAPI balanceAPI;
	
	@Autowired
	private com.hb.bank.transferAPI transferAPI;
	
	@Autowired
	private com.hb.bank.transactionlistAPI transactionlistAPI;
	
	@RequestMapping("home")
	public String home(Model model) {
		return "home";
	}
	
	@RequestMapping("inner")
	public String inner() {
		return "inner";
	}
	
	@RequestMapping("main") 
	public String main(Model model){
		return "main";
	}
	
	@RequestMapping("about") 
	public String about(){
		return "about";
	}
	
	@RequestMapping(value = "join", method=RequestMethod.GET)
	public String main(HttpServletRequest request, Model model) {
		
		String sign = request.getParameter("sign");
		String code = request.getParameter("code");
		String redirect = "";
		
		if(sign == null) {
			System.out.println("code : "+ code);
			
			List<String> list = tokenmethod.getAccessToken(code);

			model.addAttribute("access_token",list.get(0));
			model.addAttribute("refresh_token",list.get(1));
			model.addAttribute("user_seq_no",list.get(2));
			
			model.addAttribute("sign",'t');
			
			redirect = "join";
			
		}else {		
			redirect = "join";
			//메인 창에서 이제 막 넘어온 경우 기본 join창 열어주기
		}
		
		return redirect; //나중에 중복 없애주기~ else문
	}
	
	@RequestMapping("joinForm")
	public String joinForm(User uservo) {
		System.out.println(uservo.getUser_id()+uservo.getUser_token());
		mapper.joinForm(uservo);
		System.out.println("insert completed");
		
		return "inner";
	}
	
	@RequestMapping("loginForm")
	public String loginForm(User uservo, HttpSession session) {
		
		User user_info = mapper.loginForm(uservo);
		//System.out.println("로그인 한 유저 번호 : " + user_info.getUser_seq_no());

		//로그인 유저의 정보를 세션에 저장
		session.setAttribute("user_info", user_info);
		
		return "home";
	}
	
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		System.out.println("로그아웃..세션에서 데이터 삭제..");
		session.invalidate();
		return "home";
	}
	
	@RequestMapping("accountlist")
	public String accountlist(Model model, HttpSession session) {
		
		//세션에서 유저정보>토큰 가져오기
		User user_info = (User)session.getAttribute("user_info");
		
		List<JsonObject> JsonAccountList = accountlistAPI.getAccountList(user_info.getUser_seq_no(),user_info.getUser_token());
		
		model.addAttribute("JsonAccountList", JsonAccountList);
		
		return "account";
	}
	
	@RequestMapping(value="accountlist/balance",produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String balance(String fintech_use_num, Model model, HttpSession session) {
		
		//세션에서 유저정보>토큰 가져오기
		User user_info = (User)session.getAttribute("user_info");
		String user_token = user_info.getUser_token();
		
		//잔액조회 결과를 리턴
		String balanceJson = balanceAPI.getBalance(fintech_use_num, user_token);
		System.out.println(balanceJson);
		
		return balanceJson;
	}
	@RequestMapping("accountlist/update")
	public String Update(Model model, HttpSession session, HttpServletRequest request) {
		
		//세션에서 유저정보>토큰 가져오기
		User user_info = (User)session.getAttribute("user_info");

		//api 다녀오기..
		accountlistAPI.update(request.getParameter("update_alias"),request.getParameter("fintech_use_num"),user_info.getUser_token());
		
		List<JsonObject> JsonAccountList = accountlistAPI.getAccountList(user_info.getUser_seq_no(),user_info.getUser_token());
		model.addAttribute("JsonAccountList", JsonAccountList);
				
		return "account";
	}
	@RequestMapping("account/delete")
	public String accountDelete(HttpSession session, Model model) {
		
		User user_info = (User)session.getAttribute("user_info");
		List<JsonObject> JsonAccountList = accountlistAPI.getAccountList(user_info.getUser_seq_no(),user_info.getUser_token());
	
		model.addAttribute("JsonAccountList", JsonAccountList);
	
	return "accountDelete";
	}
	
	//송금, 이체 관련 ***
	@RequestMapping("transfer/check")
	public String transferCheck(HttpSession session, HttpServletRequest request, Model model) {
		
		HashMap<String, String> withdrawReq = new HashMap<String, String>();
		HashMap<String, String> depositReq = new HashMap<String, String>();
		
		//세션에서 유저정보>토큰
		User user_info = (User)session.getAttribute("user_info");
		
		//출금이체 API
		//해시맵에 정보 넣기
		withdrawReq.put("user_token", user_info.getUser_token());
		withdrawReq.put("cntr_account_num", request.getParameter("cntr_account_num"));
		withdrawReq.put("dps_print_content", request.getParameter("dps_print_content"));
		withdrawReq.put("fintech_use_num", request.getParameter("fintech_use_num"));
		withdrawReq.put("tran_amt", request.getParameter("tran_amt"));
		withdrawReq.put("req_client_name", user_info.getUser_name());
		withdrawReq.put("req_client_fintech_use_num", request.getParameter("fintech_use_num"));
		withdrawReq.put("req_client_num", user_info.getUser_seq_no() );
		withdrawReq.put("recv_client_name", request.getParameter("recv_client_name"));
		withdrawReq.put("recv_client_bank_code", request.getParameter("recv_client_bank_code"));
		withdrawReq.put("recv_client_account_num", request.getParameter("recv_client_account_num"));
		
		transferAPI.withdraw(withdrawReq);
		
		//입금이체 API
		depositReq.put("user_token", user_info.getUser_token());
		depositReq.put("cntr_account_num", request.getParameter("recv_client_account_num"));
		depositReq.put("wd_print_content","출금계좌인자내역"); //수정필요
		depositReq.put("req_client_name", user_info.getUser_name());
		depositReq.put("req_client_fintech_use_num", request.getParameter("fintech_use_num"));
		depositReq.put("req_client_num", user_info.getUser_seq_no());
		depositReq.put("tran_amt", request.getParameter("tran_amt"));
		
		String rsp_code = transferAPI.deposit(depositReq);
		model.addAttribute("rsp_code",rsp_code);
		
		return "transferResult";
		
	}
	
	@RequestMapping("transfer")
	public String transfer(String fintech_use_num, String account_num_masked, Model model) {
		String account_num_front = account_num_masked.replaceAll("[*]", "");
		
		model.addAttribute("fintech_use_num", fintech_use_num);
		model.addAttribute("account_num_masked", account_num_masked);
		
		return "transfer";
	}
	
	@RequestMapping(value="transfer/receiveCheck",produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String receiveCheck(String cntr_account_num, String bank_code_std, String fin, String tran_amt, HttpSession session ) {

		User user_info = (User)session.getAttribute("user_info");
		String result= transferAPI.receiveCheck(cntr_account_num,bank_code_std,fin,tran_amt,user_info.getUser_token(),user_info.getUser_seq_no(),user_info.getUser_name());
		
		return result;
	}
	
	@RequestMapping("homeTransfer")
	public String homeTransfer(Model model, HttpSession session) {
		
		User user_info = (User)session.getAttribute("user_info");
		List<JsonObject> JsonAccountList = accountlistAPI.getAccountList(user_info.getUser_seq_no(),user_info.getUser_token());

		model.addAttribute("JsonAccountList", JsonAccountList);
		
		return "homeTransfer";
	}
	
	//거래내역(transaction) 조회 관련 
	@RequestMapping("transactionlist")
	public String transactionlist(Model model, HttpSession session) {

		User user_info = (User)session.getAttribute("user_info");
		List<JsonObject> JsonAccountList = accountlistAPI.getAccountList(user_info.getUser_seq_no(),user_info.getUser_token());

		model.addAttribute("JsonAccountList", JsonAccountList);
		
		return "transaction";
	}
	
	@RequestMapping(value="transactionlist/one",produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String transaction(String fintech_use_num, String from_date, String to_date, HttpSession session) {
		
		User user_info = (User)session.getAttribute("user_info");
				
		String JsonList = transactionlistAPI.transactionSearch(fintech_use_num,from_date,to_date, user_info.getUser_token());
		
		return JsonList;
	}
}
























