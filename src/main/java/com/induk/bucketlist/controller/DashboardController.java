package com.induk.bucketlist.controller;

import com.induk.bucketlist.domain.BucketItem;
import com.induk.bucketlist.domain.Member;
import com.induk.bucketlist.service.BucketItemService;
import com.induk.bucketlist.service.MemberService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

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
        List<BucketItem> bucketItems = bucketItemService.bucketItemListByIdx(m.getIdx());

        int active_bucketlist = 0;
        int complete_bucketlist = 0;
        for(int i=0; i<bucketItems.size(); i++)
            if (bucketItems.get(i).isStatus()) complete_bucketlist++;
            else active_bucketlist++;

        model.addAttribute("member", memberService.findMember(m.getIdx()));
        model.addAttribute("bucketItems", bucketItems);
        model.addAttribute("active_bucketlist", active_bucketlist);
        model.addAttribute("complete_bucketlist", complete_bucketlist);

        return "bucketlist/dashboard/dashboard";
    }

    @RequestMapping(value="/addAjax", method=RequestMethod.POST)
    @ResponseBody
    public List<BucketItem> addAjax(BucketItem bucketItem, HttpSession session) throws Exception{

        Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
        SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyy-MM-dd");

        Member member = (Member)session.getAttribute("member");
        bucketItem.setMember_idx(member.getIdx());
        bucketItem.setStatus(false);
        bucketItem.setCreated_at(fourteen_format.format(date_now));

        Long bucket_idx = bucketItemService.saveBucketItem(bucketItem);
        List<BucketItem> bucketItems = bucketItemService.bucketItemListByIdx(member.getIdx());

        return bucketItems;
    }

    @RequestMapping(value="/editAjax", method=RequestMethod.POST)
    @ResponseBody
    public List<BucketItem> editAjax(BucketItem bucketItem, HttpSession session) throws Exception{
        System.out.println("bucketItem.getCategory_idx() = " + bucketItem.getCategory_idx());
        Date date_now = new Date(System.currentTimeMillis()); // 현재시간을 가져와 Date형으로 저장한다
        SimpleDateFormat fourteen_format = new SimpleDateFormat("yyyy-MM-dd");
        Member member = (Member)session.getAttribute("member");
        bucketItem.setMember_idx(member.getIdx());
        bucketItem.setCreated_at(fourteen_format.format(date_now));
        bucketItemService.updateBucketItem(bucketItem);

        List<BucketItem> bucketItems = bucketItemService.bucketItemListByIdx(member.getIdx());

        return bucketItems;
    }

    @RequestMapping(value="/completeAjax", method=RequestMethod.POST)
    @ResponseBody
    public List<BucketItem> completeAjax(BucketItem bucketItem, HttpSession session) {

        Member member = (Member)session.getAttribute("member");
        bucketItemService.completeBucketItem(bucketItem);
        List<BucketItem> bucketItems = bucketItemService.bucketItemListByIdx(member.getIdx());

        return bucketItems;
    }

    @RequestMapping(value="/categoryListAjax", method=RequestMethod.POST)
    @ResponseBody
    public List<BucketItem> categoryListAjax(BucketItem bucketItem, HttpSession session) {

        Member member = (Member)session.getAttribute("member");
        bucketItem.setMember_idx(member.getIdx());

        List<BucketItem> bucketItems = null;
        if(bucketItem.getCategory_idx() == 0) bucketItems = bucketItemService.bucketItemListByIdx(member.getIdx());
        else
            bucketItems = bucketItemService.bucketItemListByCategoryIdx(bucketItem);

        return bucketItems;
    }

    @RequestMapping(value="/delAjax", method=RequestMethod.POST)
    @ResponseBody
    public List<BucketItem> delAjax(BucketItem bucketItem, HttpSession session) {

        Member member = (Member)session.getAttribute("member");
        bucketItem.setMember_idx(member.getIdx());

        bucketItemService.deleteBucketItem(bucketItem.getIdx());
        System.out.println("bucketItem.getCategory_idx() = " + bucketItem.getCategory_idx());
        System.out.println("bucketItem = " + bucketItem.getIdx());
        List<BucketItem> bucketItems = bucketItemService.bucketItemListByIdx(member.getIdx());

        for(int i=0;i<bucketItems.size();i++)
            System.out.println("bucketItems.get(i).getTitle() = " + bucketItems.get(i).getTitle());
        return bucketItems;
    }
}
