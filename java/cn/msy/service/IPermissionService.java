package cn.msy.service;

import cn.msy.domain.Permission;
import org.springframework.security.core.parameters.P;

import java.util.List;

public interface IPermissionService {
    List<Permission> findAll(Integer page, Integer size) throws Exception;

    void save(Permission permission) throws Exception;

    Permission findById(String id) throws Exception;

    void deleteById(String id) throws Exception;
}
