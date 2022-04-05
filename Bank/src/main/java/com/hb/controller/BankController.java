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
import com.hb.domain.Savings;
import com.hb.domain.Used;
import com.hb.domain.User;
import com.hb.domain.svJud;
import com.hb.mapper.MainMapper;



@Controller
public class BankController{
	
	@Autowired
	MainMapper mapper;
	
	@Autowired
	HttpSession session;
	
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
	
	@Autowired
	private com.hb.bank.exchangeAPI exchangeAPI;
	
	public User LoadSession() {
		User user_info = (User)session.getAttribute("user_info");
		return user_info;
	}
	
	public List<JsonObject> LoadAccountList(){
		
		List<JsonObject> JsonAccountList = accountlistAPI.getAccountList(LoadSession().getUser_seq_no(),LoadSession().getUser_token());
		List<JsonObject> JsonList_final = balanceAPI.cancelaccount(JsonAccountList, LoadSession().getUser_token());
		
		return JsonList_final;
	}
	
	//단순하게 바로 value.jsp로 가는 request 처리
	@RequestMapping(value = {"home","inner","about"})
	public String home(Model model, HttpServletRequest request) {
		
		return request.getServletPath();
	}
	
	//계좌 list만 불러오는 request 처리
	@RequestMapping(value={"accountlist","account/delete","homeTransfer"})
	public String accountlist(Model model, HttpServletRequest request) {
		
		String path = "";
		List<JsonObject> JsonList_final = LoadAccountList();
		model.addAttribute("JsonList_final", JsonList_final);
		System.out.println("PATH : "+request.getServletPath());
		if(request.getServletPath().equals("/accountlist")) {
			path = "account";
		}else if(request.getServletPath().equals("/account/delete")) {
			path = "accountDelete";
		}else if(request.getServletPath().equals("/homeTransfer")) {
			path = "homeTransfer";
		}
		
		return path;
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
	
	// 회원가입/로그인/로그아웃 처리
	@RequestMapping(value = {"joinForm","loginForm","logout"})
	public String joinForm(User uservo, HttpServletRequest request,Model model) {
		String path = "";
		
		if(request.getServletPath().equals("/joinForm")) {
			mapper.joinForm(uservo);
			System.out.println("join - insert completed");
			path = "inner";
		}else if(request.getServletPath().equals("/loginForm")) {
			User user_info = mapper.loginForm(uservo);
			session.setAttribute("user_info", user_info);
			if (user_info==null) {
				System.out.println("로그인 실패");
				model.addAttribute("tryTF","F");
				path = "inner";
			}else {
				path = "home";
			}
		}else if(request.getServletPath().equals("/logout")) {
			session.invalidate();
			path = "home";
		}
		
		return path;
	}
	
	@RequestMapping(value="UserCheck",produces = "application/json; charset=UTF-8")
	@ResponseBody
	public String UserCheck(User uservo) {
		
		String result = "T";
		User user_info = mapper.loginForm(uservo);
		if (user_info==null) {
			System.out.println("사용자인증 실패");
			result = "F";
		}
		return result;
	}
	
	@RequestMapping(value="accountlist/balance",produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String balance(String fintech_use_num, Model model, HttpSession session) {
		
		User user_info = (User)session.getAttribute("user_info");
		String user_token = user_info.getUser_token();
		
		//잔액조회 결과를 리턴
		String balanceJson = balanceAPI.getBalance(fintech_use_num, user_token);
		
		return balanceJson;
	}
	@RequestMapping("accountlistUpdate")
	public String Update(Model model, HttpServletRequest request) {
		
		User user_info = (User)session.getAttribute("user_info");

		accountlistAPI.update(request.getParameter("update_alias"),request.getParameter("fintech_use_num"),user_info.getUser_token());
		
		List<JsonObject> JsonList_final = LoadAccountList();
		model.addAttribute("JsonList_final", JsonList_final);
				
		return "account";
	}
	
	
	@RequestMapping("accountdelete2")
	public String accountDelete2(HttpSession session, Model model, String deletefin) {
		User user_info = (User)session.getAttribute("user_info");
		accountlistAPI.delete(user_info.getUser_token(), deletefin);

	return "redirect:accountlist";
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
	
	//거래내역(transaction) 조회 관련 
	@RequestMapping("transactionlist") //얘도 합치기 가능
	public String transactionlist(Model model, HttpSession session) {

		List<JsonObject> JsonList_final = LoadAccountList();
		model.addAttribute("JsonList_final", JsonList_final);
		
		return "transaction";
	}
	
	@RequestMapping(value="transactionlist/one",produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String transaction(String fintech_use_num, String from_date, String to_date, HttpSession session) {
		
		User user_info = (User)session.getAttribute("user_info");
				
		String JsonList = transactionlistAPI.transactionSearch(fintech_use_num,from_date,to_date, user_info.getUser_token());
		
		return JsonList;
	}
	
	@RequestMapping(value= {"savingsR","savingsN", "savingsdepositN","savingsdepositR","savingsinstallmentN","savingsinstallmentR"})
	public String savings(Model model, Savings savings, HttpServletRequest request) {
		
		List<Savings> savingslist = null;
		System.out.println("요청path: "+request.getServletPath());
		
		//예적금 select reload, 전체 list load
		if(request.getServletPath().equals("/savingsR")) {
			savingslist = mapper.savingslistR();
		}else if(request.getServletPath().equals("/savingsdepositR")) {
			savingslist = mapper.depositlistR();
		}else if(request.getServletPath().equals("/savingsinstallmentR")) {
			savingslist = mapper.installmentlistR();
//		}else if(request.getServletPath().equals("/savingsN")) {
//			savingslist = mapper.savingslistN();
//		}else if(request.getServletPath().equals("/savingsdepositN")) {
//			savingslist = mapper.depositlistN();
//		}else if(request.getServletPath().equals("/savingsinstallmentN")) {
//			savingslist = mapper.installmentlistN();
		}
			
		model.addAttribute("savingslist",savingslist);
		return "savings";
	}
	
	@RequestMapping(value= {"savingformLoad"})
	public String savingformLoad(Model model, Savings savings, String sv_seq) {
		
		int sv_seq_int = Integer.parseInt(sv_seq);
		
		//해당 상품 리스트 불러오기
		List<Savings> savingSelectOne = mapper.savingSelectOne(sv_seq_int);
		model.addAttribute("OneP",savingSelectOne);
		
		//사용자 계좌 리스트 불러오기
		List<JsonObject> JsonList_final = LoadAccountList();
		model.addAttribute("AllAc", JsonList_final);
		
		return "savingform";
	}
	
	@RequestMapping(value= {"savingform"})
	public String savingform(Model model, Used usedvo) {
		System.out.println(usedvo.getUsed_regdate()); //왜 null일까..
		//데이터 가공 후 insert 
		mapper.savingForm(usedvo);
		return "redirect:savingStatus";
	}
	
	@RequestMapping("savingStatus")
	public String savingStatus(svJud svJud, Model model) {
		
		List<svJud> myproduct = mapper.savingStatus(LoadSession().getUser_seq_no());
		model.addAttribute("MyP",myproduct);
		
		//사용자 계좌 리스트 불러오기
		List<JsonObject> JsonList_final = LoadAccountList();
		System.out.println(JsonList_final);
		model.addAttribute("AllAc", JsonList_final);
		
		return "savingStatus";
	}
	
	@RequestMapping(value="savingCheck",produces = "application/text; charset=UTF-8")
	@ResponseBody
	public String savingCheck(String sv_seq, Used used) {
		int result = mapper.savingCheck(LoadSession().getUser_seq_no(), sv_seq);
		
		System.out.println("행 : "+result);
		return Integer.toString(result);
		
		//return int는 안됨..string은 됨...ㅇㅅㅇ
	}
	
	@RequestMapping("exchanges")
	public String exchanges(Model model) {
		
		List<JsonObject> exchangeList = exchangeAPI.getExchanges();
		model.addAttribute("exchangeList", exchangeList);
		
		return "exchanges";
	}
}
























