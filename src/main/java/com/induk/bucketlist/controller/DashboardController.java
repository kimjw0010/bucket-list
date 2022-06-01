package com.induk.bucketlist.controller;

import com.induk.bucketlist.domain.BucketItem;
import com.induk.bucketlist.domain.Member;
import com.induk.bucketlist.service.BucketItemService;
import com.induk.bucketlist.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;

@Controller
@RequiredArgsConstructor
@RequestMapping("/bucketlist/dashboard")
public class DashboardController {

    private final MemberService memberService;
    private final BucketItemService bucketItemService;

    @GetMapping
    public String home(HttpSession session, Model model) {
        System.out.println("test dashboard");

        Member m = (Member)session.getAttribute("member");

        model.addAttribute("member", memberService.findMember(m.getIdx()));
        model.addAttribute("dashboard", bucketItemService.bucketItemListByIdx(m.getIdx()));
        return "bucketlist/dashboard/dashboard";
    }

    @PostMapping("/addAjax")
    @ResponseBody
    public Long addAjax(@RequestParam("title") String title,
                        @RequestParam("category_idx") Long category_idx,
                        @RequestPart("imageForm") MultipartFile imageForm){

        System.out.println("title = " + title);
        System.out.println("category_idx = " + category_idx);
        System.out.println("imageForm = " + imageForm.getOriginalFilename());
        //return bucketItemService.saveBucketItem(bucketItem);
        return 0L;
    }
}
