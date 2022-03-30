package com.hb.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class svJud {
	
	// savings
	private int    sv_seq;					// 고유번호		TBL_SAVINGS_SEQ.NEXTVAL
	private String sv_name;					// 상품이름
	private String sv_interest_type;		// 단리복리여부		단리 : simple / 복리 : compound
	private String sv_manager;				// 관리자고유번호	default : 1101003002
	private String sv_type;					// 상품구분		default : 예금
	private int    sv_limit_min;			// 최소납입금
	private int    sv_limit_max;			// 최고한도
	private String sv_contents;				// 기타유의사항
	private String sv_condition;			// 가입제한조건		
	private String sv_target;				// 가입대상		 
	
	private String sv_return_type;			// 이자지급방식		default : 만기일시지급
	private String sv_join_method;			// 가입방법		
	private String sv_payment_type; 		// 적금납입방식		매월 : M / 매일 : D
	
	private float  sv_interest_6;			// 6개월 금리
	private float  sv_interest_12;			// 12개월 금리
	private float  sv_interest_24;			// 24개월 금리
	private float  sv_interest_36;			// 36개월 금리
	
	
	// used
	private int 	used_seq;				// 고유번호		auto_increment
	private String 	used_usernum;			// 회원번호
	private String 	used_finnum;			// 계좌핀번호
	private String 	used_status;			// 진행상태		심사대기/진행(default)/만기/반려
	private String 	used_period;			// 가입기간		6/12/24/36개월
	private Date 	used_regdate;			// 가입날짜		sysdate
	private Date 	used_maturity;			// 만기날짜
	private int 	used_service_seq;		// 이용상품고유번호	Savings 테이블의 sv_seq 참조
	private String 	used_payment_date;		// 납입일			
	private String 	used_payment_amount;	// 납입금액
}
