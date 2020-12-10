package cn.msy.controller;

import cn.msy.domain.Permission;
import cn.msy.domain.Role;
import cn.msy.service.IRoleService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/role")
public class RoleController {
    @Autowired
    private IRoleService roleService;

    @RequestMapping("/findAll.do")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    public ModelAndView findAll(@RequestParam(name = "page", required = true, defaultValue = "1") Integer page, @RequestParam(name = "size", required = true, defaultValue = "4") Integer size) throws Exception {
        List<Role> all = roleService.findAll(page, size);
        PageInfo pageInfo = new PageInfo(all);
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.addObject("pageInfo", pageInfo);
        modelAndView.setViewName("role-list");
        return modelAndView;
    }

    @RequestMapping("/save.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public String save(Role role) throws Exception {
        roleService.save(role);
        return "redirect:findAll.do";
    }


    @RequestMapping("/findById.do")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    public ModelAndView findById(@RequestParam(name = "id", required = true) String roleId) throws Exception {
        ModelAndView mv = new ModelAndView();
        Role role = roleService.findById(roleId);

        mv.addObject("role", role);
        mv.setViewName("role-show");
        return mv;
    }

    @RequestMapping("/findRoleByIdAndAllPermission.do")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ModelAndView findRoleByIdAndAllPermission(@RequestParam(name = "id", required = true) String roleId) throws Exception{
        ModelAndView modelAndView = new ModelAndView();
        Role role = roleService.findById(roleId);
        List<Permission> permissionList=roleService.findOtherPermissions(roleId);
        modelAndView.addObject("role",role);
        modelAndView.addObject("permissionList",permissionList);
        modelAndView.setViewName("role-permission-add");
        return modelAndView;
    }

    @RequestMapping("/addPermissionToRole.do")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN')")
    public String addPermissionToRole(String roleId,String[] ids){
        roleService.addPermissionToRole(roleId,ids);

        return "redirect:findAll.do";
    }
}
