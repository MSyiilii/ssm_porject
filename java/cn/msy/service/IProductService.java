package cn.msy.service;

import cn.msy.domain.Product;

import java.util.List;

public interface IProductService {

    List<Product> findAll(Integer page,Integer size) throws Exception;

    void save(Product product) throws Exception;
}
