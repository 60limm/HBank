package com.hb.bank;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.apache.tomcat.util.json.JSONParser;
import org.springframework.stereotype.Service;

import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Service
public class exchangeAPI {
	
	public List<JsonObject> getExchanges() {
		
		List<JsonObject> JsonList = new ArrayList<JsonObject>();
		String req_URL = "http://fx.kebhana.com/FER1101M.web";
		JsonArray res_list= new JsonArray();
		
		try {
			
			URL url = new URL(req_URL);											
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setDoOutput(true);
			
			// 요청을 통해 얻은 json 타입의 response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "euc-kr"));
			String line = "";
			String result = "";
						
			while ((line = br.readLine()) != null) {
				result += line;
			}
			result = result.replaceAll("var exView = ", "");
			
			JsonParser parser = new JsonParser();
			JsonElement element  = parser.parse(result);
			
			res_list = element.getAsJsonObject().get("리스트").getAsJsonArray();
			//System.out.println("response body 2 : "+result);
			System.out.println(element.getAsJsonObject().get("날짜"));
			//System.out.println("파싱된 리스트 : "+res_list);

			String strJson = "{\"날짜\":"+element.getAsJsonObject().get("날짜")+"}";
			JsonParser jsonparser = new JsonParser();
			Object obj = jsonparser.parse(strJson);
			JsonObject jsonObj = (JsonObject) obj;
			JsonList.add(jsonObj);
			//System.out.println(JsonList.get(0));
			
			for (int i = 0; i < res_list.size()-1; i++) {
				JsonObject res_list_one = (JsonObject) res_list.get(i);
				JsonList.add(res_list_one);
			}
			
			
		}catch(Exception e) {e.printStackTrace();}
		
		return JsonList;
	}
}
