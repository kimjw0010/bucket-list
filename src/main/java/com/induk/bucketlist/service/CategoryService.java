package com.induk.bucketlist.service;

import com.induk.bucketlist.domain.Category;
import com.induk.bucketlist.repository.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class CategoryService {

    private final CategoryRepository categoryRepository;

    public List<Category> categoryList() {
        return categoryRepository.findAll();
    }

    public Category findCategory(Long idx) {
        return categoryRepository.findByIdx(idx);
    }
}
