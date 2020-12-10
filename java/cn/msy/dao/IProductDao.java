package cn.msy.dao;

import cn.msy.domain.Product;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface IProductDao {
    //根据id查询产品
    @Select("select * from product where id=#{id}")
    public Product findById(String id) throws Exception;

    @Select("select * from product")
    List<Product> findAll() throws Exception;

    @Insert("insert into product values(#{id},#{productNum},#{productName},#{cityName},#{departureTime},#{productPrice},#{productDesc},#{productStatus})")
    void save(Product product) throws Exception;
}
