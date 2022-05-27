package com.induk.bucketlist.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.validation.constraints.NotNull;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Bucket_list {

    private Long idx;

    private Long category_idx;

    @NotNull(message = "제목은 필수 선택입니다.")
    private String title;

    private String start_date;

    private String completion_date;
}
