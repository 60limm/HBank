package com.hb.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hb.domain.Savings;
import com.hb.domain.User;

@Mapper
public interface MainMapper {
	

	public void joinForm(User uservo);
	
	public User loginForm(User uservo);
	
	public List<Savings> savingslist();
	public List<Savings> savingSelectOne(int sv_seq);
}
