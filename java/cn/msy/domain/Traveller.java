package cn.msy.domain;

import lombok.Data;

//旅客
@Data
public class Traveller {
    private String id;
    private String name;
    private String sex;
    private String phoneNum;
    private Integer credentialsType;//证件类型 0身份证 1护照 2军官证
    private String credentialsTypeStr;
    private String credentialsNum;
    private Integer travellerType;//旅客类型 0成人 1儿童
    private String travellerTypeStr;

    public String getCredentialsTypeStr() {
        if (credentialsType != null) {
            if (credentialsType == 0) {
                credentialsTypeStr = "身份证";
            } else if (credentialsType == 1) {
                credentialsTypeStr = "护照";
            } else if (credentialsType == 2) {
                credentialsTypeStr = "军官证";
            }
        }
        return credentialsTypeStr;
    }

    public String getTravellerTypeStr() {
        if (travellerType != null) {
            if (travellerType == 0) {
                travellerTypeStr = "成人";
            } else if (travellerType == 1) {
                travellerTypeStr = "儿童";
            }
        }
        return travellerTypeStr;
    }
}
