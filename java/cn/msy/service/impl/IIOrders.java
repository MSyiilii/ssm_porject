package cn.msy.service.impl;

import cn.msy.dao.IOrdersDao;
import cn.msy.domain.Orders;
import cn.msy.service.IOrdersService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class IIOrders implements IOrdersService {
    @Autowired
    private IOrdersDao ordersDao;

    @Override
    public List<Orders> findAll(int page,int size) throws Exception {

        //参数pageNum 是页码值   参数pageSize 代表是每页显示条数
        PageHelper.startPage(page, size);
        return ordersDao.findAll();
    }

    @Override
    public Orders findById(String ordersId) throws Exception {
        return ordersDao.findById(ordersId);
    }
}
