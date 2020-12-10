package cn.msy.dao;


import cn.msy.domain.SysLog;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface ISysLogDao {

    @Insert("insert into syslog values(#{id},#{visitTime},#{username},#{ip},#{url},#{executionTime},#{method})")
    void save(SysLog sysLog) throws Exception;

    @Select("select * from syslog ORDER BY visitTime DESC")
    List<SysLog> findAll() throws Exception;
}
