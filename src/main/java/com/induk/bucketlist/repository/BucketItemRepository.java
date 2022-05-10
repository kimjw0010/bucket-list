package com.induk.bucketlist.repository;

import com.induk.bucketlist.domain.Member;
import com.induk.bucketlist.domain.Bucket_item;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BucketItemRepository {

    List<Bucket_item> findAll();
    Bucket_item findByTitle(String title);
    Long save(Bucket_item bucketItem);
    int update(Bucket_item bucketItem);
    void delete(Long idx);
}
