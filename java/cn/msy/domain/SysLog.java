package cn.msy.domain;

import cn.msy.utils.DateUtils;
import lombok.Data;

import java.util.Date;

@Data
public class SysLog {
    private String id;
    private Date visitTime;
    private String visitTimeStr;
    private String username;
    private String ip;
    private String url;
    private Long executionTime;
    private String method;

    public String getVisitTimeStr() {
        if (visitTime!=null){
            visitTimeStr= DateUtils.date2String(visitTime,"yyyy-MM-dd HH:mm:ss");
        }
        return visitTimeStr;
    }
}
