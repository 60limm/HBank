package com.hb.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
	private String user_seq_no;
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_tel;
	private Date user_regdate;
	private String user_admin;
	private String user_token;
	private String user_refresh_token;
}
