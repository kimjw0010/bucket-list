package com.induk.bucketlist.service;

import com.induk.bucketlist.domain.Member;
import com.induk.bucketlist.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;

    public List<Member> memberList() {
        return memberRepository.findAll();
    }

    public Member findMember(Long idx) {
        return memberRepository.findByIdx(idx);
    }

    public Long saveMember(Member member) {
        memberRepository.save(member);
        return member.getIdx();
    }

    public int updateMember(Member member) {
        return memberRepository.update(member);
    }

    public int checkDuplicateEmail(String email){
        return memberRepository.countByEmail(email);
    }

    public void deleteMember(Long idx) {
        memberRepository.delete(idx);
    }

    public Member login(Member member){
        return memberRepository.login(member);
    }
}
