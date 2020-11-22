package com.yzh.workorder.entity;

import com.baomidou.mybatisplus.annotation.TableId;

import java.time.LocalDateTime;

import com.baomidou.mybatisplus.annotation.TableField;

import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
 * <p>
 * 系统用户账号表
 * </p>
 *
 * @author jingtian.wang
 * @since 2020-11-19
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("用户实体")
public class UserAccount extends BaseEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 姓名
     */
    @TableField("NAME")
    private String name;

    @TableField("NICK_NAME")
    private String nickName;

    /**
     * 密码
     */
    @TableField("PASSWORD")
    private String password;
    /**
     * 小程序唯一ID
     */
    @TableField("APPLET_ID")
    private String appletId;

    /**
     * 微信账户OpenID
     */
    @TableField("WECHAT_OPENID")
    private String wechatOpenid;

    /**
     * 性别（F:女, M:男, O:其他）
     */
    @TableField("GENDER")
    private String gender;

    /**
     * 出生日期
     */
    @TableField("BIRTHDAY")
    private String birthday;

    /**
     * 护照号
     */
    @TableField("PASSPORT_NO")
    private String passportNo;

    /**
     * 身份证号
     */
    @TableField("IDCARD_NO")
    private String idcardNo;

    /**
     * 银行卡号
     */
    @TableField("BANK_CARD_NO")
    private String bankCardNo;

    /**
     * 电话
     */
    @TableField("PHONE_NO")
    private String phoneNo;
    /**
     * 上级负责人ID
     */
    @TableField("LEADER_ID")
    private String leaderId;
    /**
     * 省份
     */
    @TableField("PROVINCE")
    private String province;
    /**
     * 市
     */
    @TableField("CITY")
    private String city;
    /**
     * 区/县
     */
    @TableField("DISTRICT")
    private String district;
    /**
     * 邮箱
     */
    @TableField("EMAIL")
    private String email;

    /**
     * 联系方式
     */
    @TableField("ADDRESS")
    private String address;

    /**
     * 头像图片地址
     */
    @TableField("HEAD_URL")
    private String headUrl;

    /**
     * 签名图片地址
     */
    @TableField("SIGN_URL")
    private String signUrl;
    /**
     * 描述
     */
    @TableField("DESCRIPTION")
    private String description;

    /**
     * 用户角色ID
     */
    @TableField("ROLE_ID")
    private Long roleId;

    /**
     * 是否锁定（0:未锁定, 1:锁定）
     */
    @TableField("LOCKED")
    private Boolean locked;
}
