package com.induk.bucketlist.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;

@Getter
@Setter
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
}