package com.induk.bucketlist.repository;

import com.induk.bucketlist.domain.BucketItem;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BucketItemRepository {

    List<BucketItem> findAll();
    List<BucketItem> findByIdx(Long idx);
    BucketItem findByTitle(String title);
    Long save(BucketItem bucketItem);
    int update(BucketItem bucketItem);
    void delete(Long idx);
}
