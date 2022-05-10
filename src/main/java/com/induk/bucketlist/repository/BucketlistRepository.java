package com.induk.bucketlist.repository;

import com.induk.bucketlist.domain.Bucket_item;
import com.induk.bucketlist.domain.Bucket_list;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BucketlistRepository {

    List<Bucket_list> findAll();
    Bucket_list findByIdx(Long idx);
    Long save(Bucket_list bucketList);
    int update(Bucket_list bucketList);
    void delete(Long idx);
}
