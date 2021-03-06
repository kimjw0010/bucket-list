package com.induk.bucketlist.service;

import com.induk.bucketlist.domain.Member;
import com.induk.bucketlist.dto.UploadFile;
import com.induk.bucketlist.repository.MemberRepository;
import com.induk.bucketlist.util.FileStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class MemberService {

    private final MemberRepository memberRepository;
    private final FileStore fileStore;

    public List<Member> memberList() {
        return memberRepository.findAll();
    }

    public Member findMember(Long idx) {
        return memberRepository.findByIdx(idx);
    }

    public Long saveMember(Member member) throws IOException {
        member.setSrc("");
        member.setInfo("");
        memberRepository.save(member);
        return member.getIdx();
    }

    public int updateMember(Member member) throws IOException {
        System.out.println("member.getImageForm() = " + member.getImageForm().getOriginalFilename());
        MultipartFile multipartFile = member.getImageForm();
        UploadFile uploadFile = fileStore.storeFile(multipartFile, "member");

        if(uploadFile != null)
            member.setSrc(uploadFile.getStoreFilename());

        return memberRepository.update(member);
    }

    public void updateMember_U(Member member) throws IOException {
        System.out.println("member.getImageForm() = " + member.getImageForm().getOriginalFilename());
        MultipartFile multipartFile = member.getImageForm();
        UploadFile uploadFile = fileStore.storeFile_U(multipartFile, "member");

        if(uploadFile != null)
            member.setSrc(uploadFile.getStoreFilename());
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
