package com.heno.airock.service;

import org.springframework.stereotype.Service;

import com.heno.airock.dto.MemberDTO;
import com.heno.airock.member.repository.MemberRepository;


@Service
public class MemberService {
    private final MemberRepository memberRepository;
    
    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }
    
	public boolean login(MemberDTO memberDTO) {
		MemberDTO loginMember = memberRepository.login(memberDTO);
		if(loginMember != null) {
			return true;
		} else {
			return false;
		}
	}

}
