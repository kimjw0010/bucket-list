package com.induk.bucketlist.domain;

import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.springframework.data.annotation.Id;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    private Long idx;

    @NotBlank(message = "이메일은 필수 입력입니다.")
    @Email(message = "이메일 형식에 맞지 않습니다.")
    @Length(max=30)
    private String email;

    @NotBlank(message = "비밀번호는 필수 입력입니다.")
    @Length(max=20)
    private String password;

    @NotBlank(message = "이름을 입력해 주세요.")
    @Length(max=6)
    private String name;

    private int allAgree;

    private int newsAgree;

    private int conditionAgree;
}