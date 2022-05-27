package com.induk.bucketlist.service;

import com.induk.bucketlist.domain.Member;
import com.induk.bucketlist.dto.UploadFile;
import com.induk.bucketlist.repository.MemberRepository;
import com.induk.bucketlist.util.FileStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

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
        UploadFile uploadFile = fileStore.storeFile(member.getImageForm(), "member");

        if(uploadFile == null) {
            member.setImage("user_image.png");
        }else{
            member.setImage(uploadFile.getStoreFilename());
        }

        memberRepository.save(member);
        return member.getIdx();
    }

    public int updateMember(Member member, String imageDel) throws IOException {
        if(imageDel == null){
            UploadFile uploadFile = fileStore.storeFile(member.getImageForm(), "member");

            if(uploadFile == null) {
                Member m = findMember(member.getIdx());
                member.setImage(m.getImage());
            }else{
                member.setImage(uploadFile.getStoreFilename());
            }
        }
        else member.setImage("user_image.png");
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
