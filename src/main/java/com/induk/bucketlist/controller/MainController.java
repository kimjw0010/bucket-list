package com.induk.bucketlist.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Controller
@RequestMapping("/bucketlist")
@RequiredArgsConstructor
public class MainController {

    @RequestMapping
    public String home(Model model) {
       return "index";
    }

}
