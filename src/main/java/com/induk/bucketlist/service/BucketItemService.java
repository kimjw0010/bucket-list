package com.induk.bucketlist.service;

import com.induk.bucketlist.domain.BucketItem;
import com.induk.bucketlist.repository.BucketItemRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BucketItemService {

    private final BucketItemRepository bucketItemRepository;

    public List<BucketItem> bucketItemList() {
        return bucketItemRepository.findAll();
    }

    public List<BucketItem> bucketItemListByIdx(Long idx) {
        return bucketItemRepository.findByIdx(idx);
    }

    public BucketItem findBucketItem(String title) {
        return bucketItemRepository.findByTitle(title);
    }

    public Long saveBucketItem(BucketItem bucketItem) {
        bucketItemRepository.save(bucketItem);
        return bucketItem.getIdx();
    }

    public int updateBucketItem(BucketItem bucketItem) {
        return bucketItemRepository.update(bucketItem);
    }

    public void deleteBucketItem(Long idx) {
        bucketItemRepository.delete(idx);
    }
}
