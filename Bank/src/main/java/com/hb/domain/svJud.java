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
	private int sv_seq;					// 고유번호		auto_increment
	private String sv_name;				// 상품이름
	private float sv_interest;			// 금리
	private String sv_interest_type;	// 단리복리여부		단리 : simple / 복리 : compound
	private String sv_term;				// 상품기간		month기준 -> day기준
	private String sv_manager;			// 관리자고유번호	default : 1101003002
	private String sv_type;				// 상품구분		예금 : deposit(D) / 적금 : installment(I)
	private String sv_limit_min;		// 최소납입금
	private String sv_limit_max;		// 최대납입금
	private String sv_contents;			// 설명
	private String sv_target;			// 가입대상		개인 / 직장인 / 청년 
	private String sv_return_type;		// 이자지급방식		default : 만기일시지급
	private String sv_payment_type; 	// 납입방식		매월 : M / 매일 : D
	
	// used
	private int used_seq;				// 고유번호		auto_increment
	private String used_usernum;		// 회원번호
	private String used_finnum;			// 계좌핀번호
	private String used_status;			// 진행상태		심사대기(default)/진행/만기/반려
	private Date used_regdate;			// 가입날짜		not sysdate
	private Date used_maturity;			// 만기날짜
	private int used_service_seq;		// 이용상품고유번호	Savings 테이블의 sv_seq 참조
	private String used_payment_date;	// 납입일			매일(D) 매월의 경우 req 날짜
	private String used_payment_amount;	// 납입금액	
}
