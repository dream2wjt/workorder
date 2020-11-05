package com.jing.workorder.entity;

import java.io.Serializable;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;

/**
* <p>
    * 
    * </p>
*
* @author jingtian.wang
* @since 2020-11-03
*/
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@NoArgsConstructor
@AllArgsConstructor
@ApiModel("用户实体")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
    * 主键ID
    */
    @ApiModelProperty("主键id")
    private Long id;

    /**
    * 姓名
    */
    @ApiModelProperty("用户名")
    private String name;

    /**
    * 年龄
    */
    @ApiModelProperty( "用户年龄")
    private Integer age;

    /**
    * 邮箱
    */
    @ApiModelProperty("用户邮箱")
    private String email;


}
