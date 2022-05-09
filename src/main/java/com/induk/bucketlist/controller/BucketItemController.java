package com.induk.bucketlist.controller;

import com.induk.bucketlist.service.BucketItemService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/bucketlist/item")
public class BucketItemController {

    private final BucketItemService bucketItemService;

    @GetMapping
    public String home(Model model) {
        model.addAttribute("bucketItems", bucketItemService.bucketItemList());

        return "bucketlist/item/listForm";
    }
}
