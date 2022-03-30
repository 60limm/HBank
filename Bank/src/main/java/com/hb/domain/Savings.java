package com.hb.domain;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Savings {
	private int    sv_seq;				// 고유번호		TBL_SAVINGS_SEQ.NEXTVAL
	private String sv_name;				// 상품이름
	private String sv_interest_type;	// 단리복리여부		단리 : simple / 복리 : compound
	private String sv_manager;			// 관리자고유번호	default : 1101003002
	private String sv_type;				// 상품구분		default : 예금
	private int    sv_limit_min;		// 최소납입금
	private int    sv_limit_max;		// 최고한도
	private String sv_contents;			// 기타유의사항
	private String sv_condition;		// 가입제한조건		
	private String sv_target;			// 가입대상		 

	private String sv_return_type;		// 이자지급방식		default : 만기일시지급
	private String sv_join_method;		// 가입방법		
	private String sv_payment_type; 	// 적금납입방식		매월 : M / 매일 : D
	
	private float  sv_interest_6;		// 6개월 금리
	private float  sv_interest_12;		// 12개월 금리
	private float  sv_interest_24;		// 24개월 금리
	private float  sv_interest_36;		// 36개월 금리
}
