package com.hb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.hb.domain.Savings;
import com.hb.domain.Used;
import com.hb.domain.User;
import com.hb.domain.svJud;

@Mapper
public interface MainMapper {
	

	public void joinForm(User uservo);
	
	public User loginForm(User uservo);
	
	public List<Savings> savingslistR();
	public List<Savings> depositlistR();
	public List<Savings> installmentlistR();
	public List<Savings> savingslistN();
	public List<Savings> depositlistN();
	public List<Savings> installmentlistN();
	
	public List<Savings> savingSelectOne(int sv_seq);
	
	public void savingForm(Used used);
	
	public List<svJud> savingStatus(String user_seq_no);
	
	public int savingCheck(@Param("used_usernum")String used_usernum, @Param("used_service_seq")String used_service_seq);
}
