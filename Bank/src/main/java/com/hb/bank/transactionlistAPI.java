package com.hb.bank;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class transactionlistAPI extends balanceAPI{
	
	public ArrayList<String> getfinlist(String user_seq_no, String user_token) {
		ArrayList<String> finlist = new ArrayList<String>();
		
		String req_URL = "https://testapi.openbanking.or.kr/v2.0/account/list?user_seq_no="+user_seq_no+"&include_cancel_yn=Y&sort_order=D";
		String api_tran_id ="";
		
		try {
			URL url = new URL(req_URL);											
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// connection 옵션 설정
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization","Bearer "+user_token);
			conn.setDoOutput(true); 		
			
			// 결과코드가 200이면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("응답코드 : "+responseCode);
			 
			// 요청을 통해 얻은 json 타입의 response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
						
			while ((line = br.readLine()) != null) {
				result += line;
			}
			
			// Gson 라이브러리에 포함된 클래스로 json 파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element  = parser.parse(result);
			
			JsonArray res_list = element.getAsJsonObject().get("res_list").getAsJsonArray();
			int res_cnt = element.getAsJsonObject().get("res_cnt").getAsInt();		//계좌 개수
			
			for (int i = 0; i < res_cnt; i++) {		//계좌 개수만큼 반복
				JsonObject res_list_one  = (JsonObject) res_list.get(i);
				finlist.add(res_list_one.get("fintech_use_num").getAsString());
				System.out.println(finlist.get(i));
			}
		
			// 사용한 객체 닫아주기
			br.close();
						
			}catch(IOException e) {
				e.printStackTrace();
			}
		
		return finlist;
	}
	
	public String transactionSearch(String fintech_use_num, String from_date, String to_date, String user_token) {
		
		List<JsonObject> JsonList = new ArrayList<JsonObject>();
		
		String req_URL = "https://testapi.openbanking.or.kr/v2.0/account/transaction_list/fin_num";
		req_URL += "?bank_tran_id="+MakeBankTranId();
		req_URL += "&fintech_use_num="+fintech_use_num;
		req_URL += "&inquiry_type=A&inquiry_base=D";
		req_URL += "&from_date="+from_date+"&to_date="+to_date+"&sort_order=D";
		req_URL += "&tran_dtime="+DateCheck();
		
		String api_tran_id ="";
		JsonArray res_list= new JsonArray();
		
		String result = "";
		
		try {
			URL url = new URL(req_URL);											
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// connection 옵션 설정
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization","Bearer "+user_token);
			conn.setDoOutput(true); 		

			// 요청을 통해 얻은 json 타입의 response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			
						
			while ((line = br.readLine()) != null) {
				result += line;
			}
			
			System.out.println("거래내역조회결과 : "+result);
			
			// Gson 라이브러리에 포함된 클래스로 json 파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element  = parser.parse(result);
						
			res_list = element.getAsJsonObject().get("res_list").getAsJsonArray();	//res_list는 JsonArray의 형태를 가지고 있기 때문에 일반 getAsString X
			int page_record_cnt = element.getAsJsonObject().get("page_record_cnt").getAsInt();		//계좌 개수
						
			//System.out.println(res_list.get(0)); 	//0번째 계좌의 정보가 출력 {"fintech_use_num":"120220014988941087119498","account_alias":"1105","bank_code_std":"007","bank_code_sub":"0000000","bank_name":"수협은행","account_num_masked":"202202071***","account_holder_name":"임유경","account_holder_type":"P","inquiry_agree_yn":"Y","inquiry_agree_dtime":"20220207110543","transfer_agree_yn":"Y","transfer_agree_dtime":"20220207110543","account_state":"01","savings_bank_name":"","account_seq":"","account_type":"1"}
						
			for (int i = 0; i < page_record_cnt; i++) {		//계좌 개수만큼 반복
				JsonObject res_list_one  = (JsonObject) res_list.get(i);
				//list.add(res_list_one.toString()); 일반 String list로 넣는거 말고 jsonObject list로 
				JsonList.add(res_list_one);
			}
			
			br.close();
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
}
