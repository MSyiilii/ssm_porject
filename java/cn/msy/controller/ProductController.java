package cn.msy.controller;

import cn.msy.domain.Product;
import cn.msy.service.IProductService;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/product")
public class ProductController {

    @Autowired
    private IProductService productService;

    @RequestMapping("/findAll.do")
    //@RolesAllowed("ADMIN")//jsr250注解不生效原因不明 解决方法：在springmvc.xml中添加即可，开启对于AOP的支持
    //@Secured("ROLE_ADMIN")//使用Secured要加ROEL_前缀 不需要导入pom依赖
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER','ROLE_GUEST')")
    public ModelAndView findAll(@RequestParam(name = "page",required = true,defaultValue = "1") Integer page, @RequestParam(name = "size",required = true,defaultValue = "4") Integer size) throws Exception {
        ModelAndView modelAndView = new ModelAndView();
        List<Product> all = productService.findAll(page,size);
        PageInfo pageInfo = new PageInfo(all);
        modelAndView.addObject("pageInfo",pageInfo);
        modelAndView.setViewName("product-list");
        return modelAndView;
    }

    @RequestMapping("/save.do")
    @PreAuthorize("hasAnyRole('ROLE_ADMIN','ROLE_USER')")
    public String save(Product product) throws Exception {
        productService.save(product);
        return "redirect:findAll.do";
    }
}
