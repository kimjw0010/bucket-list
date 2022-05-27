package com.induk.bucketlist.controller;

import com.induk.bucketlist.repository.BucketlistRepository;
import com.induk.bucketlist.service.BucketItemService;
import com.induk.bucketlist.service.BucketListService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping("/bucketlist/dashboard")
public class DashboardController {

    @GetMapping
    public String home(Model model) {
        System.out.println("test dashboard");
        return "bucketlist/dashboard/dashboard";
    }
}
