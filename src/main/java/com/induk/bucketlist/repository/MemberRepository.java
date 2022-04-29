package com.induk.bucketlist.repository;

import com.induk.bucketlist.domain.Member;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberRepository {

    List<Member> findAll();
    Member findByIdx(Long idx);
    Long save(Member member);
    int update(Member member);
    void delete(Long idx);
    Member login(Member member);
    int countByEmail(String email);
}
