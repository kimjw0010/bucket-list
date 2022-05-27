package com.induk.bucketlist.controller;

import com.induk.bucketlist.domain.Member;
import com.induk.bucketlist.dto.HistoryUrl;
import com.induk.bucketlist.service.MemberService;
import com.induk.bucketlist.util.FileStore;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.MalformedURLException;

@Controller
@RequiredArgsConstructor
@RequestMapping("/bucketlist/members")
public class MemberController {

    private final MemberService memberService;
    private final FileStore fileStore;

    @GetMapping("/login")
    public String login(Model model, @ModelAttribute("historyUrl") HistoryUrl historyUrl){
        System.out.println("login get");
        model.addAttribute("member", new Member());
        return "/bucketlist/member/memberLogin";
    }

    @PostMapping("/login")
    public String login(@Valid Member member, BindingResult bindingResult,
                        @RequestParam(value = "remember", required = false)String remember,
                        @ModelAttribute("historyUrl") HistoryUrl historyUrl,
                        HttpSession session, HttpServletRequest request,
                        HttpServletResponse response) throws IOException {
        System.out.println("login post");
        Member m = memberService.login(member);
        // 쿠키에 입력받은 member의 email 저장
        Cookie cookie = new Cookie("email", member.getEmail());
        if(remember == null) cookie.setMaxAge(0);
        response.addCookie(cookie);

        // email 형식이 맞지 않으면
        if(bindingResult.hasFieldErrors("email")) {
            System.out.println("login error type");
            return "/bucketlist/member/memberLogin";
        }

        // email password에 맞는 member가 없을 때
        if(m == null){
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer;
            writer = response.getWriter();
            writer.print("<script language='JavaScript' charset='UTF-8'>");
            writer.print("alert('이메일과 비밀번호를 확인해주세요');");
            writer.print("location.href='/bucketlist/members/login?" + historyUrl.getParam() + "';");
            writer.print("</script>");
            writer.close();
        }

        // 세션 등록
        session.setAttribute("member", m);

        // 다른 페이지(메인 제외)에서 로그인 했을 경우 해당 페이지로 이동
        if(!historyUrl.getHistoryUrl().isEmpty() && historyUrl.getHistoryUrl() != ""){
            return "redirect:" + historyUrl.getURL();
        }
        return "redirect:/bucketlist/dashboard";
    }

    @GetMapping("/signup")
    public String signupForm(Model model){
        System.out.println("singup get");
        model.addAttribute("member", new Member());
        return "/bucketlist/member/memberJoin";
    }

    @PostMapping("/signup")
    public String addMember(@Valid Member member, BindingResult bindingResult, HttpServletRequest request,
                            HttpServletResponse response, @ModelAttribute("historyUrl") HistoryUrl historyUrl
                            ) throws IOException {
        System.out.println("singup post");
        //형식
        if(bindingResult.hasErrors()) {
            System.out.println("singup error type");
            return "/bucketlist/member/memberJoin";
        }

        int num = memberService.checkDuplicateEmail(member.getEmail());
        System.out.println(num);
        if(num > 0){
            request.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter writer;
            writer = response.getWriter();
            writer.print("<script language='JavaScript' charset='UTF-8'>");
            writer.print("alert('이메일이 중복됩니다.');");
            writer.print("location.href='/bucketlist/members/signup?" + historyUrl.getParam() + "';");
            writer.print("</script>");
            writer.close();
        } else {
            System.out.println("will save");
            memberService.saveMember(member);
        }

        return "redirect:/bucketlist/members/login";
    }

    @GetMapping("/edit")
    public String updateForm(HttpSession session, Model model){
        Member m = (Member)session.getAttribute("member");
        model.addAttribute("member", memberService.findMember(m.getIdx()));
        return "/bucketlist/members/editForm";
    }

    @PostMapping("/edit")
    public String updateForm(HttpSession session, @Valid Member member,
                             BindingResult bindingResult, HttpServletResponse response,
                             @RequestParam(value = "imageDel", required = false) String imageDel) throws IOException {

        Member sessionMember = (Member)session.getAttribute("member");
        Member m = memberService.findMember(sessionMember.getIdx());

        member.setEmail(m.getEmail());
        member.setImage(m.getImage());
        member.setIdx(m.getIdx());
        //형식 검사
        if(bindingResult.hasFieldErrors("email") || bindingResult.hasFieldErrors("name")) {
            return "/bucketlist/members/editForm";
        }
        if(member.getPassword() == null || member.getPassword().equals("")) member.setPassword(m.getPassword());
        System.out.println("\n\n\n request m:"+member.getPassword());
        System.out.println("\n\n\n session m:"+m.getPassword());

        int result = memberService.updateMember(member, imageDel);

        if(result >0) {
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('수정되었습니다'); location.href='/bucketlist/members/editForm';</script>");
            out.flush();
        }
        else{
            response.setContentType("text/html; charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.println("<script>alert('수정에 실패하였습니다.'); location.href='/bucketlist/members/editForm';</script>");
            out.flush();
        }
        return "redirect:/bucketlist/members/edit";
    }

    @ResponseBody
    @GetMapping("/images/{filename}")
    public Resource downloadImage(@PathVariable String filename) throws MalformedURLException {
        return new UrlResource("file:" + fileStore.getFullPath("member", filename));
    }

    @GetMapping("/logout")
    public String logout(HttpSession session){
        System.out.println("logout get");
        session.invalidate();
        return "redirect:/bucketlist";
    }
}