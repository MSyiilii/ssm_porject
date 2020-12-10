package cn.msy.controller;

import cn.msy.domain.Role;
import cn.msy.domain.UserInfo;
import cn.msy.service.IUserService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;


import java.util.List;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private IUserService userService;


    @RequestMapping("/findAll.do")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "size", required = true, defaultValue = "4") Integer size) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<UserInfo> userInfoList = userService.findAll(page, size);
        //PageInfo就是一个分页Bean
        PageInfo pageInfo=new PageInfo(userInfoList);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("user-list");
        return modelAndView;
    }

    @RequestMapping("/save.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String save(UserInfo userInfo) throws Exception {
        userService.save(userInfo);
        return "redirect:findAll.do";
    }


    @RequestMapping("/findById.do")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    public ModelAndView findById(@RequestParam(name = "id",required = true) String id) throws Exception {
        ModelAndView modelAndView=new ModelAndView();
        UserInfo userInfo=userService.findById(id);
        modelAndView.addObject("user",userInfo);
        modelAndView.setViewName("user-show");
        return modelAndView;

    }

    @RequestMapping("/findUserByIdAndAllRole.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView findUserByIdAndAllRole(String id) throws Exception {
        UserInfo user = userService.findById(id);
        List<Role> roleList = userService.findOtherRole(id);
        ModelAndView mv = new ModelAndView();
        mv.addObject("user", user);
        mv.addObject("roleList", roleList);
        mv.setViewName("user-role-add");
        return mv;
    }

    @RequestMapping("/addRoleToUser.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String addRoleToUser(String userId, String[] ids) throws Exception {
        userService.addRoleToUser(userId,ids);
        return "redirect:findAll.do";
    }
}
