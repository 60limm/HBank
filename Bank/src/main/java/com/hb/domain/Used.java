package com.hb.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Used {
	private int used_seq;			// 고유번호		auto_increment
	private String used_usernum;	// 회원번호
	private String used_finnum;		// 계좌핀번호
	private String used_status;		// 진행상태		심사대기(default)/진행/만기/반려
	private Date used_regdate;		// 가입날짜		not sysdate
	private Date used_maturity;		// 만기날짜
	private int used_service_seq;	// 이용상품고유번호	Savings 테이블의 sv_seq 참조
}
