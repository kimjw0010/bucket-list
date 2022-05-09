package com.induk.bucketlist.service;

import com.induk.bucketlist.domain.Bucket_list;
import com.induk.bucketlist.repository.BucketlistRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BucketListService {

    private final BucketlistRepository bucketlistRepository;

    public List<Bucket_list> bucketlistList() {
        return bucketlistRepository.findAll();
    }

    public Bucket_list findBucketlist(Long idx) {
        return bucketlistRepository.findByIdx(idx);
    }

    public Long saveBucketlist(Bucket_list bucketList) {
        bucketlistRepository.save(bucketList);
        return bucketList.getIdx();
    }

    public int updateBucketlist(Bucket_list bucketList) {
        return bucketlistRepository.update(bucketList);
    }

    public void deleteBucketlist(Long idx) {
        bucketlistRepository.delete(idx);
    }
}
