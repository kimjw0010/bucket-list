package com.induk.bucketlist.controller;

import com.induk.bucketlist.service.BucketListService;
import com.induk.bucketlist.service.CategoryService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/bucketlist/category")
public class CategoryController {

    private final CategoryService categoryService;

    @GetMapping
    public String home(Model model) {
        model.addAttribute("categorys", categoryService.categoryList());

        return "bucketlist/category/listForm";
    }
}
