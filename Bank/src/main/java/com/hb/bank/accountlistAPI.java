package com.hb.bank;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class accountlistAPI extends balanceAPI{
	
	public List<JsonObject> getAccountList(String user_seq_no, String user_token){
		
		//List<String> list = new ArrayList<String>();
		List<JsonObject> JsonList = new ArrayList<JsonObject>();
		
		String req_URL = "https://testapi.openbanking.or.kr/v2.0/account/list?user_seq_no="+user_seq_no+"&include_cancel_yn=Y&sort_order=D";
		String api_tran_id ="";
		JsonArray res_list= new JsonArray();
		
		
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
			
			System.out.println("response body : "+result);
			
			// Gson 라이브러리에 포함된 클래스로 json 파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element  = parser.parse(result);
			
			api_tran_id = element.getAsJsonObject().get("api_tran_id").getAsString();
			res_list = element.getAsJsonObject().get("res_list").getAsJsonArray();	//res_list는 JsonArray의 형태를 가지고 있기 때문에 일반 getAsString X
			int res_cnt = element.getAsJsonObject().get("res_cnt").getAsInt();		//계좌 개수
			
			//System.out.println(res_list.get(0)); 	//0번째 계좌의 정보가 출력 {"fintech_use_num":"120220014988941087119498","account_alias":"1105","bank_code_std":"007","bank_code_sub":"0000000","bank_name":"수협은행","account_num_masked":"202202071***","account_holder_name":"임유경","account_holder_type":"P","inquiry_agree_yn":"Y","inquiry_agree_dtime":"20220207110543","transfer_agree_yn":"Y","transfer_agree_dtime":"20220207110543","account_state":"01","savings_bank_name":"","account_seq":"","account_type":"1"}
			
			for (int i = 0; i < res_cnt; i++) {		//계좌 개수만큼 반복
				JsonObject res_list_one  = (JsonObject) res_list.get(i);
				//list.add(res_list_one.toString()); 일반 String list로 넣는거 말고 jsonObject list로 
				JsonList.add(res_list_one);
			}
			
			// 사용한 객체 닫아주기
			br.close();
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return JsonList;
	}
	
	public void update(String update_alias, String fintech_use_num, String token) {
		
		String req_URL = "https://testapi.openbanking.or.kr/v2.0/account/update_info";
		
		try {
			URL url = new URL(req_URL);											
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// connection 옵션 설정
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization","Bearer "+token);
			conn.setDoOutput(true); 
			
			// POST요청에 필요한 BODY 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			
			JSONObject obj = new JSONObject();
			obj.put("fintech_use_num", fintech_use_num);
			obj.put("account_alias",update_alias);
			
			bw.write(obj.toString()); //string builder에서 만든 것을 문자열로 바꿔주는 작업
			bw.flush();
			
			// 요청을 통해 얻은 json 타입의 response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
									
			while ((line = br.readLine()) != null) {result += line;}
			System.out.println("계좌정보변경 결과 : "+result);
			
			// 사용한 객체 닫아주기
			br.close();
			bw.close();
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String token, String fintech_use_num) {
		
		String req_URL = "https://testapi.openbanking.or.kr/v2.0/account/cancel";
		
		try {
			URL url = new URL(req_URL);											
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// connection 옵션 설정
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization","Bearer "+token);
			conn.setDoOutput(true); 
			
			// POST요청에 필요한 BODY 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			
			JSONObject obj = new JSONObject();
			obj.put("bank_tran_id",MakeBankTranId());
			obj.put("scope","inquiry");
			obj.put("fintech_use_num",fintech_use_num);
			
			bw.write(obj.toString()); //string builder에서 만든 것을 문자열로 바꿔주는 작업
			bw.flush();
			
			// 요청을 통해 얻은 json 타입의 response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
									
			while ((line = br.readLine()) != null) {result += line;}
			System.out.println("계좌해지 결과(조회) : "+result);
			
			// 사용한 객체 닫아주기
			br.close();
			bw.close();
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		try {
			URL url = new URL(req_URL);											
			HttpURLConnection conn2 = (HttpURLConnection) url.openConnection();
			
			// connection 옵션 설정
			conn2.setRequestMethod("GET");
			conn2.setRequestProperty("Authorization","Bearer "+token);
			conn2.setDoOutput(true); 
						
			// POST요청에 필요한 BODY 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn2.getOutputStream()));
			
			JSONObject obj2 = new JSONObject();
			obj2.put("bank_tran_id",MakeBankTranId());
			obj2.put("scope","transfer");
			obj2.put("fintech_use_num",fintech_use_num);
			bw.write(obj2.toString()); //string builder에서 만든 것을 문자열로 바꿔주는 작업
			bw.flush();
			
			// 요청을 통해 얻은 json 타입의 response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn2.getInputStream()));
			String line = "";
			String result = "";
												
			while ((line = br.readLine()) != null) {result += line;}
			System.out.println("계좌해지 결과(이체) : "+result);
						
			// 사용한 객체 닫아주기
			br.close();
			bw.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
	}
}
