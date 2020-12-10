package cn.msy.service.impl;

import cn.msy.dao.IProductDao;
import cn.msy.domain.Product;
import cn.msy.service.IProductService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class IIProduct implements IProductService {

    @Autowired
    private IProductDao productDao;


    @Override
    public List<Product> findAll(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page, size);
        return productDao.findAll();
    }

    @Override
    public void save(Product product) throws Exception {
        product.setId(UUID.randomUUID().toString().replaceAll("-", ""));
        productDao.save(product);
    }
}
