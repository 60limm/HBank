package com.hb.bank;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Service
public class tokenAPI {
	
	//발급받은 코드를 이용하여 토큰을 얻어오는 메소드 작성
	public List<String> getAccessToken(String authorize_code) { 
		
		List<String> list = new ArrayList();
		
		String access_token = "";
		String refresh_token = "";
		String user_seq_no = "";
		String req_URL = "https://testapi.openbanking.or.kr/oauth/2.0/token";
		
		try {
			URL url = new URL(req_URL);											// URL객체생성
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();	// 함수를 통해 connection 생성
			
			// connection 옵션 설정
			conn.setRequestMethod("POST");	// POST요청
			conn.setDoOutput(true); 		// POST요청을 위해 false -> true
			
			// POST요청에 필요한 파라미터 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			
			sb.append("code="+authorize_code);
			sb.append("&client_id=1d6518bc-b15d-4a70-bde1-390d0677953a");
			sb.append("&client_secret=c3db8ca7-3fad-47b6-a38b-ff11e3ba4031");
			sb.append("&redirect_uri=http://172.21.200.26:8081/bank/join");
			sb.append("&grant_type=authorization_code");
			
			bw.write(sb.toString());
			bw.flush();
			
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
			
			access_token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_token = element.getAsJsonObject().get("refresh_token").getAsString();
			user_seq_no = element.getAsJsonObject().get("user_seq_no").getAsString();
			
			System.out.println("access_token : "+access_token);
			System.out.println("refresh_token : "+refresh_token);
			System.out.println("user_seq_no : "+user_seq_no);
			
			list.add(access_token);
			list.add(refresh_token);
			list.add(user_seq_no);
			
			// 사용한 객체 닫아주기
			br.close();
			bw.close();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		
		
		return list;
	}
	
}
