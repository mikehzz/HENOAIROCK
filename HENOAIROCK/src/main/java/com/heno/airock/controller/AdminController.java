package com.heno.airock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.heno.airock.cmn.PcwkLoger;

@Controller
@RequestMapping("/admin") // 어드민 공통 주소 처리
public class AdminController implements PcwkLoger {

    // 어드민 로그인 페이지
    @GetMapping("/login")
    public String adminLoginForm() {
        return "admin_login";
    }
    
    // 어드민 대시보드 페이지
    @GetMapping("/dashboard")
    public String adminDashboard() {
        return "admin_dashboard";
    }
    
    // 사용자 관리 페이지
    @GetMapping("/users")
    public String manageUsers() {
        return "manage_users";
    }
    
    // ...
}
