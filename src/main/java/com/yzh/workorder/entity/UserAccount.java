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
public class UserAccount implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    @TableId("ID")
    private Long id;

    /**
     * 用户账户唯一ID
     */
    @TableField("ACCOUNT_ID")
    private Long accountId;

    /**
     * 姓名
     */
    @TableField("NAME")
    private String name;

    @TableField("NICK_NAME")
    private String nickName;

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
     * 是否有效（0:无效, 1:有效）
     */
    @TableField("ACTIVE")
    private Boolean active;

    /**
     * 是否删除（0:未删除, 1:删除）
     */
    @TableField("DELETED")
    private Boolean deleted;

    /**
     * 是否锁定（0:未锁定, 1:锁定）
     */
    @TableField("LOCKED")
    private Boolean locked;

    /**
     * 创建人ID
     */
    @TableField("CREATE_USER_ID")
    private Long createUserId;

    /**
     * 创建时间
     */
    @TableField("CREATE_DATETIME")
    private LocalDateTime createDatetime;

    /**
     * 修改人ID
     */
    @TableField("MODIFY_USER_ID")
    private Long modifyUserId;

    /**
     * 修改时间
     */
    @TableField("MODIFY_DATETIME")
    private LocalDateTime modifyDatetime;

    /**
     * 版本号
     */
    @TableField("VERSION")
    private Integer version;


}
