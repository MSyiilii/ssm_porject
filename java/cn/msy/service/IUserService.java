package cn.msy.service;

import cn.msy.domain.Role;
import cn.msy.domain.UserInfo;
import org.springframework.security.core.userdetails.UserDetailsService;

import java.util.List;

public interface IUserService extends UserDetailsService {
    List<UserInfo> findAll(int page, int size) throws Exception;

    void save(UserInfo userInfo) throws Exception;

    UserInfo findById(String id) throws Exception;

    void addRoleToUser(String userId, String[] ids);

    List<Role> findOtherRole(String id) throws Exception;
}
