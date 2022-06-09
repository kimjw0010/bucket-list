package com.induk.bucketlist.domain;

import lombok.*;
import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Getter @Setter
@ToString
@AllArgsConstructor
@NoArgsConstructor
public class Member {
    private Long idx;

    @NotBlank(message = "이메일은 필수 입력입니다.")
    @Email(message = "이메일 형식에 맞지 않습니다.")
    @Length(max=30)
    private String email;

    @NotBlank(message = "비밀번호는 필수 입력입니다.")
    @Pattern(regexp="(?=.*[0-9])(?=.*[a-zA-Z])(?=.*\\W)(?=\\S+$).{10,20}",
            message = "비밀번호는 영문 대,소문자와 숫자, 특수기호가 적어도 1개 이상씩 포함된 10자 ~ 20자의 비밀번호여야 합니다.")
    private String password;

    @NotBlank(message = "이름을 입력해 주세요.")
    @Length(max=6)
    private String name;

    @Length(max=255)
    private String src;
    private MultipartFile imageForm;

    @Length(max=50, message = "한 줄 소개는 최대 50자입니다.")
    private String info;
}