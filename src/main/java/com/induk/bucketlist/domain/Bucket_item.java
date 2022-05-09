package com.induk.bucketlist.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import org.hibernate.validator.constraints.Length;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Bucket_item {

    private Long idx;

    @NotNull(message = "bucket_list는 필수 선택입니다.")
    private Long bucket_list_idx;

    @NotNull(message = "작성자는 필수 선택입니다.")
    private Long member_idx;

    @NotBlank(message = "제목은 필수 입력입니다.")
    @Length(max=64)
    private String title;

    @NotBlank(message = "내용은 필수 입력입니다.")
    @Length(max=256)
    private String content;

    @NotBlank(message = "완료예정일은 필수 입력입니다.")
    private String completion_date;

    private Bucket_list bucket_list;
    private Member member;
    private Category category;
}
