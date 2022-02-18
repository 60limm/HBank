package com.hb.bank;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Service
public class transferAPI extends balanceAPI{
	
	public void withdraw(HashMap<String, String> withdrawReq) {
		
		String req_URL = "https://testapi.openbanking.or.kr/v2.0/transfer/withdraw/fin_num";
		
		
		try {
			URL url = new URL(req_URL);											// URL객체생성
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	// 함수를 통해 connection 생성
			
			// connection 옵션 설정
			conn.setRequestMethod("POST");	// POST요청
			conn.setRequestProperty("Authorization","Bearer "+withdrawReq.get("user_token"));
			conn.setRequestProperty("Content-Type", "application/json: utf-8");	// POST요청
			conn.setDoOutput(true); 		
			
			// POST요청에 필요한 BODY 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			//StringBuilder sb = new StringBuilder();
			
			//여기에 json만들깅
			JSONObject obj = new JSONObject();
			obj.put("bank_tran_id", 		MakeBankTranId());
			obj.put("cntr_account_type", 	"N");
			obj.put("cntr_account_num", 	withdrawReq.get("cntr_account_num"));
			obj.put("dps_print_content", 	withdrawReq.get("dps_print_content"));
			obj.put("fintech_use_num", 		withdrawReq.get("fintech_use_num"));
			obj.put("tran_amt",  			withdrawReq.get("tran_amt"));
			obj.put("tran_dtime", 			DateCheck());
			obj.put("req_client_name", 		withdrawReq.get("req_client_name"));
			obj.put("req_client_fintech_use_num", withdrawReq.get("req_client_fintech_use_num"));
			obj.put("req_client_num", 		withdrawReq.get("req_client_num"));
			obj.put("transfer_purpose", 	"TR");
			obj.put("recv_client_name", 	withdrawReq.get("recv_client_name"));
			obj.put("recv_client_bank_code", 	withdrawReq.get("recv_client_bank_code"));
			obj.put("recv_client_account_num",	withdrawReq.get("recv_client_account_num"));
			
			bw.write(obj.toString()); 
			bw.flush();
			
			// 요청을 통해 얻은 json 타입의 response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
						
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("출금이체 결과 : "+result);
			
			JsonParser parser = new JsonParser();
			JsonElement element  = parser.parse(result);
			
			String rsp_code = element.getAsJsonObject().get("rsp_code").getAsString();
			if (rsp_code.equals("A0000")) {System.out.println("출금요청 성공");}else {System.out.println("출금요청 실패");}
			
			// 사용한 객체 닫아주기
			br.close();
			bw.close();
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public String deposit(HashMap<String, String> depositReq) {
		
		String req_URL = "https://testapi.openbanking.or.kr/v2.0/transfer/deposit/fin_num";
		String rsp_code = "";
		
		try {
			URL url = new URL(req_URL);											// URL객체생성
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	// 함수를 통해 connection 생성
			
			// connection 옵션 설정
			conn.setRequestMethod("POST");	// POST요청
			conn.setRequestProperty("Authorization","Bearer "+depositReq.get("user_token"));
			conn.setRequestProperty("Content-Type", "application/json: utf-8");	// POST요청
			conn.setDoOutput(true);
			
			// POST요청에 필요한 BODY 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			//StringBuilder sb = new StringBuilder();
			
			//여기에 json만들깅
			JSONObject obj = new JSONObject();
			JSONObject obj_reqlist = new JSONObject();
			JSONArray jsonarr = new JSONArray(); 
			
			obj_reqlist.put("tran_no", "1");
			obj_reqlist.put("bank_tran_id", MakeBankTranId());
			obj_reqlist.put("fintech_use_num", "120220014988941087375260"); //이게 복병
			obj_reqlist.put("print_content", "입금계좌 인자내역");
			obj_reqlist.put("tran_amt", 	depositReq.get("tran_amt"));
			obj_reqlist.put("req_client_name", depositReq.get("req_client_name"));
			obj_reqlist.put("req_client_fintech_use_num", depositReq.get("req_client_fintech_use_num"));
			obj_reqlist.put("req_client_num", depositReq.get("req_client_num"));
			obj_reqlist.put("transfer_purpose", "TR");
			
			jsonarr.add(obj_reqlist);
			
			obj.put("cntr_account_type", 	"N");
			obj.put("cntr_account_num", 	depositReq.get("cntr_account_num"));
			obj.put("wd_pass_phrase", 		"NONE");
			obj.put("wd_print_content", 	depositReq.get("wd_print_content"));
			obj.put("name_check_option", 	"on");
			obj.put("tran_dtime", 			DateCheck());
			obj.put("req_cnt", 				"1");
			obj.put("req_list",				jsonarr); 				
			
			
			bw.write(obj.toString()); //string builder에서 만든 것을 문자열로 바꿔주는 작업
			bw.flush();
			System.out.println(obj);
			
			// 요청을 통해 얻은 json 타입의 response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
						
			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("입금이체 결과 : "+result);
			
			JsonParser parser = new JsonParser();
			JsonElement element  = parser.parse(result);
			
			rsp_code = element.getAsJsonObject().get("rsp_code").getAsString();
			
			if (rsp_code.equals("A0000")) {
				System.out.println("입금요청 성공");
				}else {System.out.println("입금요청 실패");
				String res_list = element.getAsJsonObject().get("res_list").getAsString();
				}
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		return rsp_code;
	}
	
	 public String receiveCheck(String cntr_account_num, String bank_code_std, String fin, String tran_amt,String token, String seq_no, String user_name) {
		 
		 String req_URL = "https://testapi.openbanking.or.kr/v2.0/inquiry/receive";
		 String recv_name = "";
			
			try {
				URL url = new URL(req_URL);											// URL객체생성
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();	// 함수를 통해 connection 생성
				
				// connection 옵션 설정
				conn.setRequestMethod("POST");	// POST요청
				conn.setRequestProperty("Authorization","Bearer "+token);
				conn.setRequestProperty("Content-Type", "application/json: utf-8");	// POST요청
				conn.setDoOutput(true); 		
				
				// POST요청에 필요한 BODY 전송
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));

				//여기에 json만들깅
				JSONObject obj = new JSONObject();
				obj.put("bank_tran_id", 		MakeBankTranId());
				obj.put("cntr_account_type", 	"N");
				obj.put("cntr_account_num", 	cntr_account_num);
				obj.put("bank_code_std", 		bank_code_std);
				obj.put("account_num", 			cntr_account_num);
				obj.put("print_content", 		"입금계좌 인자내역");
				obj.put("tran_amt",  			tran_amt);
				obj.put("req_client_name", 		user_name);
				//obj.put("req_client_bank_code", req_client_bank_code);
				//obj.put("req_client_account_num", req_client_account_num);
				obj.put("req_client_fintech_use_num", fin);
				obj.put("req_client_num",		seq_no);
				obj.put("transfer_purpose", 	"TR");
				System.out.println(cntr_account_num+bank_code_std+tran_amt+user_name+fin+seq_no);
				bw.write(obj.toString()); //string builder에서 만든 것을 문자열로 바꿔주는 작업
				bw.flush();
				
				// 요청을 통해 얻은 json 타입의 response 메세지 읽어오기
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
							
				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("수취 결과 : "+result);
				
				JsonParser parser = new JsonParser();
				JsonElement element  = parser.parse(result);
				
				recv_name = element.getAsJsonObject().get("account_holder_name").getAsString();
				System.out.println("수취인 성명 : "+recv_name);
				
			}catch(IOException e) {
				e.printStackTrace();
			}
		 return recv_name;
	 } 
	
}
