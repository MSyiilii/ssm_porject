package cn.msy.service.impl;

import cn.msy.dao.IPermissionDao;
import cn.msy.domain.Permission;
import cn.msy.service.IPermissionService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class IIPermission implements IPermissionService {
    @Autowired
    private IPermissionDao permissionDao;

    @Override
    public List<Permission> findAll(Integer page,Integer size) throws Exception {
        PageHelper.startPage(page, size);
        return permissionDao.findAll();
    }

    @Override
    public void save(Permission permission) throws Exception {
        permission.setId(UUID.randomUUID().toString().replaceAll("-",""));
        permissionDao.save(permission);
    }

    @Override
    public Permission findById(String id) throws Exception {
        return permissionDao.findById(id);
    }

    @Override
    public void deleteById(String id) throws Exception {
        permissionDao.deleteFromRole_Permission(id);
        permissionDao.deleteById(id);
    }
}
