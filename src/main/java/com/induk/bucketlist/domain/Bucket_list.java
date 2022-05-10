package com.induk.bucketlist.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Bucket_list {

    private Long idx;
    private Long category_idx;
    private String title;
    private String start_date;
    private String completion_date;
}
