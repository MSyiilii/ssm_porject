package cn.msy.service.impl;

import cn.msy.dao.IRoleDao;
import cn.msy.domain.Permission;
import cn.msy.domain.Role;
import cn.msy.service.IRoleService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.UUID;

@Service
@Transactional
public class IIRoleService implements IRoleService {

    @Autowired
    private IRoleDao roleDao;

    @Override
    public List<Role> findAll(int page, int size) throws Exception {
        PageHelper.startPage(page,size);
        return roleDao.findAll();
    }

    @Override
    public void save(Role role) throws Exception {
        role.setId(UUID.randomUUID().toString().replaceAll("-",""));
        roleDao.save(role);
    }

    @Override
    public Role findById(String roleId) throws Exception{
        return roleDao.findById(roleId);
    }

    @Override
    public List<Permission> findOtherPermissions(String roleId) throws Exception{
        return roleDao.findOtherPermissions(roleId);
    }

    @Override
    public void addPermissionToRole(String roleId, String[] ids) {
        for (String id : ids) {
            roleDao.addPermissionToRole(roleId,id);
        }
    }

}
