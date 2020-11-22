package com.yzh.workorder.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import io.swagger.annotations.ApiModel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

import java.time.LocalDateTime;

/**
 * @description: BaseEntity
 * @author: jingtian.wang
 * @time: 2020/11/19 19:46
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("实体基类")
public class BaseEntity {
    private static final long serialVersionUID = 2L;
    /**
     * 主键
     */
    @TableId("ID")
    private String id;
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
