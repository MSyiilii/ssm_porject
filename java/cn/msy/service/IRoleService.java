package cn.msy.service;

import cn.msy.domain.Permission;
import cn.msy.domain.Role;


import java.util.List;

public interface IRoleService {

    List<Role> findAll(int page, int size) throws Exception;

    void save(Role role) throws Exception;

    Role findById(String roleId)throws Exception;

    List<Permission> findOtherPermissions(String roleId)throws Exception;

    void addPermissionToRole(String roleId, String[] ids);
}
