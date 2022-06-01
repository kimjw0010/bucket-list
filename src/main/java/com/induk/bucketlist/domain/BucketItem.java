package com.induk.bucketlist.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;
import org.springframework.web.multipart.MultipartFile;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class BucketItem {

    private Long idx;

    @NotNull(message = "category는 필수 선택입니다.")
    private Long category_idx;

    @NotNull(message = "작성자는 필수 선택입니다.")
    private Long member_idx;

    @NotBlank(message = "제목은 필수 입력입니다.")
    @Length(max=128)
    private String title;

    @NotBlank(message = "성공여부는 필수 입력입니다.")
    private boolean status;

    @NotBlank(message = "작성일은 필수 입력입니다.")
    private String created_at;

    @Length(max=255)
    private String src;
    private MultipartFile imageForm;

    private Category category;
}
