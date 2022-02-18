package com.hb.bank;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class balanceAPI {
	
	//현재시간 구하기
	public String DateCheck() { 
		Date date_now = new Date(System.currentTimeMillis());
		SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyyMMddHHmmss");
		
		return fourteen_format.format(date_now);
	}
	
	//은행거래고유번호(M202200149U+9자리 난수) 생성
	public String MakeBankTranId() {
		Random random = new Random();
		
		String randstr = "M202200149U";
		for (int i = 1; i <= 9; i++) {
			randstr += Integer.toString(random.nextInt(9)+1);
		}
		// System.out.println("은행거래고유번호 : "+randstr);
		
		return randstr;
	}
	
	public String getBalance(String fintech_use_num, String user_token) {
		
		String req_URL = "https://testapi.openbanking.or.kr/v2.0/account/balance/fin_num?bank_tran_id="+MakeBankTranId()+"&fintech_use_num="+fintech_use_num+"&tran_dtime="+DateCheck();
		String balance_amt = "";
		JsonObject balanceJson = null;
		String result = "";
		
		try {
			URL url = new URL(req_URL);											
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	
			
			// connection 옵션 설정
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Authorization","Bearer "+user_token);
			conn.setDoOutput(true); 		
			
			// 결과코드가 200이면 성공
			int responseCode = conn.getResponseCode();
			// System.out.println("응답코드 : "+responseCode);
			 
			// 요청을 통해 얻은 json 타입의 response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
						
			while ((line = br.readLine()) != null) {
				result += line;
			}
			
			System.out.println("response body : "+result);
			
			// Gson 라이브러리에 포함된 클래스로 json 파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element  = parser.parse(result);
			
			balance_amt = element.getAsJsonObject().get("balance_amt").getAsString();
			//System.out.println(balance_amt);
			
			balanceJson = element.getAsJsonObject();
			
			// 사용한 객체 닫아주기
			br.close();
			
		}catch(IOException e) {
			e.printStackTrace();
		}
		
		return result;
	}
}
