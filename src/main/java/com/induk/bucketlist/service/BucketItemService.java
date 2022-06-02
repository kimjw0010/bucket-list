package com.induk.bucketlist.service;

import com.induk.bucketlist.domain.BucketItem;
import com.induk.bucketlist.dto.UploadFile;
import com.induk.bucketlist.repository.BucketItemRepository;
import com.induk.bucketlist.util.FileStore;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.List;

@Service
@RequiredArgsConstructor
public class BucketItemService {

    private final BucketItemRepository bucketItemRepository;
    private final FileStore fileStore;

    public List<BucketItem> bucketItemList() {
        return bucketItemRepository.findAll();
    }

    public List<BucketItem> bucketItemListByIdx(Long idx) {
        return bucketItemRepository.findByIdx(idx);
    }

    public List<BucketItem> bucketItemListByCategoryIdx(BucketItem bucketItem) {
        return bucketItemRepository.findByCategoryIdx(bucketItem);
    }

    public BucketItem findBucketItem(String title) {
        return bucketItemRepository.findByTitle(title);
    }

    public Long saveBucketItem(BucketItem bucketItem) throws IOException {
        UploadFile uploadFile = fileStore.storeFile(bucketItem.getImageForm(), "bucketItem");

        if(uploadFile == null) {
            bucketItem.setSrc("");
        }else{
            bucketItem.setSrc(uploadFile.getStoreFilename());
        }

        bucketItemRepository.save(bucketItem);
        return bucketItem.getIdx();
    }

    public void updateBucketItem(BucketItem bucketItem) throws IOException {
        UploadFile uploadFile = null;
        System.out.println("bucketItem = " + bucketItem.getSrc());
        if(bucketItem.getSrc() == null) {
            uploadFile = fileStore.storeFile(bucketItem.getImageForm(), "bucketItem");
        }
        if(uploadFile != null) {
            bucketItem.setSrc(uploadFile.getStoreFilename());
        }
        bucketItemRepository.update(bucketItem);
    }

    public void completeBucketItem(BucketItem bucketItem) {
        bucketItemRepository.complete(bucketItem);
    }

    public void deleteBucketItem(Long idx) {
        bucketItemRepository.delete(idx);
    }
}
