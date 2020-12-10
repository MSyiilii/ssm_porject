package cn.msy.service.impl;

import cn.msy.dao.ISysLogDao;
import cn.msy.domain.SysLog;
import cn.msy.service.ISysLogService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class IISysLogService implements ISysLogService {

    @Autowired
    private ISysLogDao sysLogDao;

    @Override
    public List<SysLog> findAll(int page,int size) throws Exception {
        PageHelper.startPage(page,size);
        return sysLogDao.findAll();
    }

    @Override
    public void save(SysLog sysLog) throws Exception {
        sysLog.setId(UUID.randomUUID().toString().replaceAll("-",""));
        sysLogDao.save(sysLog);
    }
}
