package com.hb.domain;



import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Savings {
	private int sv_seq;				// 고유번호		auto_increment
	private String sv_name;			// 상품이름
	private float sv_interest;		// 금리
	private String sv_interest_type;// 단리복리여부		단리 : simple / 복리 : compound
	private String sv_term;			// 상품기간		month기준 -> day기준
	private String sv_manager;		// 관리자고유번호	default : 1101003002
	private String sv_type;			// 상품구분		예금 : deposit(D) / 적금 : installment(I)
}
