package com.induk.bucketlist.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Category {

    private Long idx;
    private String name;
    private String scr;
    private String created_at;
}
