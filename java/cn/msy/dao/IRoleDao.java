package cn.msy.dao;


import cn.msy.domain.Permission;
import cn.msy.domain.Role;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IRoleDao {

    //根据用户id查询出所有对应的角色
    @Select("select * from role where id in (select roleId from users_role where userId=#{userId})")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "roleName", property = "roleName"),
            @Result(column = "roleDesc", property = "roleDesc"),
            @Result(column = "id", property = "permissions", javaType = java.util.List.class, many = @Many(select = "cn.msy.dao.IPermissionDao.findPermissionByRoleId"))
    })
    List<Role> findRoleByUserId(String userId) throws Exception;

    @Select("select * from role")
    List<Role> findAll() throws Exception;

    @Insert("insert into role values(#{id},#{roleName},#{roleDesc})")
    void save(Role role) throws Exception;

    @Select("select * from role where id=#{roleId}")
    @Results({
            @Result(id = true, column = "id", property = "id"),
            @Result(column = "roleName", property = "roleName"),
            @Result(column = "roleDesc", property = "roleDesc"),
            @Result(column = "id", property = "permissions", javaType = java.util.List.class, many = @Many(select = "cn.msy.dao.IPermissionDao.findPermissionByRoleId"))
    })
    Role findById(String roleId);

    @Select("select * from permission where id not in(select permissionId from role_permission where roleId=#{roleId})")
    List<Permission> findOtherPermissions(String roleId);

    @Insert("insert into role_permission(roleId,permissionId) values(#{roleId},#{id})")
    void addPermissionToRole(@Param("roleId") String roleId,@Param("id") String id);
}