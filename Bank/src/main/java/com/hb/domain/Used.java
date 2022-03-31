package com.hb.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Used {
	private int 	used_seq;				// 고유번호		auto_increment
	private String 	used_usernum;			// 회원번호
	private String 	used_finnum;			// 계좌핀번호
	private String 	used_status;			// 진행상태		심사대기/진행(default)/만기/반려
	private String 	used_period;			// 가입기간		6/12/24/36개월
	private String 	used_regdate;			// 가입날짜		sysdate
	private Date 	used_maturity;			// 만기날짜
	private int 	used_service_seq;		// 이용상품고유번호	Savings 테이블의 sv_seq 참조
	private String 	used_payment_date;		// 납입일			
	private String 	used_payment_amount;	// 납입금액	
}
