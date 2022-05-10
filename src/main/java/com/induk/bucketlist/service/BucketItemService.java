package com.induk.bucketlist.service;

import com.induk.bucketlist.domain.Bucket_item;
import com.induk.bucketlist.domain.Member;
import com.induk.bucketlist.repository.BucketItemRepository;
import com.induk.bucketlist.repository.MemberRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BucketItemService {

    private final BucketItemRepository bucketItemRepository;

    public List<Bucket_item> bucketItemList() {
        return bucketItemRepository.findAll();
    }

    public Bucket_item findBucketItem(String title) {
        return bucketItemRepository.findByTitle(title);
    }

    public Long saveBucketItem(Bucket_item bucketItem) {
        bucketItemRepository.save(bucketItem);
        return bucketItem.getIdx();
    }

    public int updateBucketItem(Bucket_item bucketItem) {
        return bucketItemRepository.update(bucketItem);
    }

    public void deleteBucketItem(Long idx) {
        bucketItemRepository.delete(idx);
    }
}
