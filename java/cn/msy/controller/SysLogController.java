package cn.msy.controller;

import cn.msy.domain.SysLog;
import cn.msy.service.ISysLogService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/sysLog")
public class SysLogController {

    @Autowired
    private ISysLogService sysLogService;


    @RequestMapping("/findAll.do")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_GUEST')")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page,@RequestParam(name = "size",required = true,defaultValue = "10") Integer size) throws Exception {
        ModelAndView mv = new ModelAndView();
        List<SysLog> sysLogList = sysLogService.findAll(page,size);
        PageInfo pageInfo=new PageInfo(sysLogList);
        mv.addObject("pageInfo", pageInfo);
        mv.setViewName("syslog-list");
        return mv;
    }
}
