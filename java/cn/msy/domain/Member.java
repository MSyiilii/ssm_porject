package cn.msy.domain;

import lombok.Data;

//会员
@Data
public class Member {
    private String id;
    private String name;
    private String nickname;
    private String phoneNum;
    private String email;


}
