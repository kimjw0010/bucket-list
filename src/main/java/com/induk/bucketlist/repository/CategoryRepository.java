package com.induk.bucketlist.repository;

import com.induk.bucketlist.domain.Category;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface CategoryRepository {

    List<Category> findAll();
    Category findByIdx(Long idx);
}
